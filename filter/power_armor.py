"""
VOCK Power Armor helmet effect.

Makes a clean voice recording sound like the Enclave soldiers in stock
Fallout 2, who talk through a power armor helmet speaker. We matched
the numbers to the stock GATE, POWR and SGNT speech files.

The chain, in order:

1. Mono. Stereo input gets mixed down to one channel.

2. Bandpass. A steep low cut at 400 Hz and a gentle top cut at
   2500 Hz. The stock files lose their bass fast but keep some sloped
   treble up to 8 kHz, so the top cut stays soft. A steep top cut
   sounds muffled.

3. Compressor (5:1 above -24 dB). Evens out loud and quiet words so
   they sit at one level, like a small speaker driven hard.

4. Saturation (tanh, drive 4.0). Rounds off the peaks and adds grit.
   It comes after the compressor so it can catch the first bit of each
   word, which a compressor is too slow to grab.

5. Speaker clip. Flattens positive peaks at 0.45 and negative peaks
   at 0.70. The uneven limits sound like a cheap speaker cone hitting
   the end of its travel. A 30 Hz high-pass removes the offset the
   uneven clip leaves behind.

6. Megaphone cone, +3 dB in a narrow band at 1.8 kHz. Small speakers
   ring at one frequency, and that ring reads as "helmet speaker".

7. Presence, +2 dB around 1.2 kHz. The stock files have a small bump
   there.

8. Echo. One faint repeat 127.7 ms later at -27 dB, as heard in the
   SGNT files. Pass --no-echo to leave it out.

9. Normalize the peak to -1 dBFS.

Steps 3 and 4 each get a peak-normalized input, so a quiet take and a
loud take come out with the same amount of squash and grit.

Usage:
    python power_armor.py input.wav output.wav
    python power_armor.py input_folder/ output_folder/
"""
import argparse
from pathlib import Path

import numpy as np
import soundfile as sf
from scipy.signal import butter, sosfilt

AUDIO_EXTS = (".wav", ".flac", ".ogg", ".mp3")


def bandpass(audio, sr, low=400, low_order=4, high=2500, high_order=2):
    """Steep low cut, gentle top cut."""
    audio = sosfilt(butter(low_order, low, btype="highpass", fs=sr, output="sos"), audio)
    return sosfilt(butter(high_order, high, btype="lowpass", fs=sr, output="sos"), audio)


def peak_normalize(audio):
    return audio / (np.max(np.abs(audio)) + 1e-9)


def compress(audio, sr, ratio=5.0, threshold_db=-24, attack_ms=0.2, release_ms=80):
    """The attack has to be fast. With a slow attack the peaks get
    through while the rest of the word drops in level, and the voice
    ends up spikier than before."""
    threshold = 10 ** (threshold_db / 20)
    attack = np.exp(-1 / (sr * attack_ms / 1000))
    release = np.exp(-1 / (sr * release_ms / 1000))

    env = 0.0
    gain = np.ones_like(audio)
    abs_audio = np.abs(audio)
    for i in range(len(audio)):
        x = abs_audio[i]
        coeff = attack if x > env else release
        env = coeff * env + (1 - coeff) * x
        if env > threshold:
            over_db = 20 * np.log10(env / threshold + 1e-9)
            gain_db = -over_db * (1 - 1 / ratio)
            gain[i] = 10 ** (gain_db / 20)
    return audio * gain


def saturate(audio, drive=4.0):
    """Soft clip. Higher drive gives more grit; past 4 it turns fuzzy."""
    driven = audio * drive
    return np.tanh(driven) / np.tanh(drive)


def asym_clip(audio, sr, pos=0.45, neg=0.70):
    """Clip the positive side harder than the negative side, then take
    out the offset with a 30 Hz high-pass."""
    clipped = np.clip(audio, -neg, pos)
    return sosfilt(butter(1, 30, btype="highpass", fs=sr, output="sos"), clipped)


def band_boost(audio, sr, center, gain_db, width):
    """Boost a band around center by gain_db. width is the half-width
    as a fraction of center."""
    sos = butter(2, [center * (1 - width), center * (1 + width)], btype="bandpass", fs=sr, output="sos")
    return audio + sosfilt(sos, audio) * (10 ** (gain_db / 20) - 1)


def echo(audio, sr, delay_ms=127.7, gain_db=-27):
    """One faint repeat. The output gets longer by the delay so the last
    word's repeat doesn't get cut off."""
    delay = int(round(sr * delay_ms / 1000))
    out = np.concatenate([audio, np.zeros(delay)])
    out[delay:] += audio * 10 ** (gain_db / 20)
    return out


def normalize(audio, peak_db=-1.0):
    peak = np.max(np.abs(audio)) + 1e-9
    target = 10 ** (peak_db / 20)
    return audio * (target / peak)


def process(audio, sr, add_echo=True):
    audio = bandpass(audio, sr)
    audio = compress(peak_normalize(audio), sr)
    audio = saturate(peak_normalize(audio))
    audio = asym_clip(audio, sr)
    audio = band_boost(audio, sr, 1800, 3.0, 0.15)  # megaphone cone
    audio = band_boost(audio, sr, 1200, 2.0, 0.3)   # presence
    if add_echo:
        audio = echo(audio, sr)
    return normalize(audio)


def process_file(path_in, path_out, add_echo=True):
    audio, sr = sf.read(path_in, always_2d=False)
    if audio.ndim > 1:
        audio = audio.mean(axis=1)
    sf.write(path_out, process(audio, sr, add_echo), sr)


def main():
    parser = argparse.ArgumentParser(description="Apply the VOCK Power Armor helmet effect to audio files")
    parser.add_argument("input", help="Input file or folder")
    parser.add_argument("output", help="Output file or folder")
    parser.add_argument("--no-echo", action="store_true", help="Leave out the echo")
    args = parser.parse_args()

    in_path = Path(args.input)
    out_path = Path(args.output)

    if in_path.is_dir():
        out_path.mkdir(parents=True, exist_ok=True)
        files = sorted(f for f in in_path.iterdir() if f.suffix.lower() in AUDIO_EXTS)
        for f in files:
            print(f"Processing {f.name}...")
            process_file(f, out_path / f.name, not args.no_echo)
        print(f"Done. {len(files)} files processed.")
    else:
        process_file(in_path, out_path, not args.no_echo)
        print(f"Done. Saved to {out_path}")


if __name__ == "__main__":
    main()
