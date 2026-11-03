"""
VOCK Power Armor helmet effect (filter D, s8q).

Winner of the 2026-10-24 Discord blind test (Granite D). It is the
vock-filters power_armor_strict chain at a29a876 plus an asymmetric
speaker clip after the saturation.

Calibrated against the stock Arch Dornan speech (GATE, POWR, SGNT in
dat/master/sound/Speech/POWER), measured per file on voiced frames:
-6 dB points at about 300 Hz and 2-2.5 kHz, then a gentle top roll-off
to about -10 dB at 3.15 kHz, -17 dB at 5 kHz and -33 dB at 8 kHz.
SGNT has a faint 127.7 ms echo at about -27 dB in all 22 files; this
filter adds it (pass --no-echo to leave it out). The stock files have
a crest factor of about 10-17 dB on voiced frames.

The compressor runs before the saturation: in the other order the
first cycles of each word get through before it clamps down, which
raises the crest factor. Both stages get a peak-normalized input, so
every take gets the same compression and grit whatever its level.

The asymmetric clip cuts positive peaks lower than negative ones, like
a speaker cone hitting its travel limit unevenly. On grani7 it clips
14.4% of voiced samples.

Chain: mono downmix -> bandpass (4th-order low cut at 400 Hz, 2nd-order
       top cut at 2500 Hz) -> compression (5:1 at -24 dB) -> saturation
       (tanh, drive 4.0) -> asymmetric clip (+0.45 / -0.70, 30 Hz DC
       block) -> megaphone cone (+3 dB at 1.8 kHz) -> presence (+2 dB
       at 1.2 kHz) -> echo (127.7 ms, -27 dB) -> normalize

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
    """Steep low cut, gentle top cut: the stock files lose their lows
    fast but keep a sloped top end up to 8 kHz."""
    audio = sosfilt(butter(low_order, low, btype="highpass", fs=sr, output="sos"), audio)
    return sosfilt(butter(high_order, high, btype="lowpass", fs=sr, output="sos"), audio)


def peak_normalize(audio):
    return audio / (np.max(np.abs(audio)) + 1e-9)


def compress(audio, sr, ratio=5.0, threshold_db=-24, attack_ms=0.2, release_ms=80):
    """Attack must be fast enough to catch transient peaks - a slower
    attack lets peaks through untouched while sustained level drops,
    which raises crest factor instead of lowering it."""
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
    """Tanh soft clip on a peak-normalized input: rounds peaks and adds
    grit, never hard-clips."""
    driven = audio * drive
    return np.tanh(driven) / np.tanh(drive)


def asym_clip(audio, sr, pos=0.45, neg=0.70):
    """Speaker-style distortion: clip positive peaks lower than negative
    ones, then block the DC this leaves."""
    clipped = np.clip(audio, -neg, pos)
    return sosfilt(butter(1, 30, btype="highpass", fs=sr, output="sos"), clipped)


def band_boost(audio, sr, center, gain_db, width):
    sos = butter(2, [center * (1 - width), center * (1 + width)], btype="bandpass", fs=sr, output="sos")
    return audio + sosfilt(sos, audio) * (10 ** (gain_db / 20) - 1)


def echo(audio, sr, delay_ms=127.7, gain_db=-27):
    """Single faint repeat, as measured in every SGNT file. The output
    grows by the delay so the last word's repeat is not cut off."""
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
    audio = band_boost(audio, sr, 1800, 3.0, 0.15)  # megaphone cone: narrow speaker resonance
    audio = band_boost(audio, sr, 1200, 2.0, 0.3)   # presence: the stock files' small bump near 1.25 kHz
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
    parser.add_argument("--no-echo", action="store_true", help="Leave out the SGNT echo")
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
