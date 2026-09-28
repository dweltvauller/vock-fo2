# Talking Heads art: findings and fixes

The tools and working files are in this folder (see `README.md`).

VOCK loads after Talking Heads (TH) in `mods_order.txt`, so any file in `vock-fo2/data/art/heads/` replaces the Talking Heads copy of the same name.

## How the engine reads head art

For each head, `heads.lst` lists a name stem and three fidget counts (good, neutral, bad). The line number is the head ID that protos and scripts reference, so you can't reorder, insert or delete lines.

During dialogue fallout2-ce loads these files:

- `<head>gp`, `<head>np`, `<head>bp`: lip-sync (phoneme) frames. The phoneme table indexes frames 0 to 8, so each file needs 9 frames.
- `<head>gf<N>`, `<head>nf<N>`, `<head>bf<N>`: idle fidgets. The engine picks N between 1 and the count in `heads.lst`, then builds the file name from it.
- `<head>gn`, `<head>ng`, `<head>nb`, `<head>bn`: mood transitions. All of them exist in TH.

If a phoneme file has fewer than 9 frames, the mouth freezes on the last frame it has. If `heads.lst` declares more fidgets than exist, the engine tries to load a file that isn't there and that fidget never plays. Neither case crashes the game.

The engine draws each frame centred in a 388x200 window, bottom aligned, then moves it by the file's header shift (the FRM `shiftX` for direction 0). It adds each frame's x offset to a running total and resets the total only at frame 0 (`gameDialogRenderTalkingHead` in `game_dialog.cc`). TH gives most files a header shift, and one head's files can differ: a narrower crop gets a shift that puts the face back in place. A file with the wrong shift makes the head jump when the engine swaps to it. Fidgets and transitions play in order, so their offsets move the head the same way each time. Lip-sync frames play in phoneme order, so any x offset in a `*gp`, `*np` or `*bp` file makes the head drift sideways while the character talks.

The engine draws the lip-sync file only while a speech file plays (`gameDialogLipSyncStarted`, set once `lipsLoad` finds `SOUND\SPEECH\<head>\<file>`). Without speech the head stays on its fidgets and transitions, so lip-sync problems (drift, a jump when talking starts, wrong light) only show for voiced heads. On 2026-09-27 speech existed for `bgjes`, `lou` and `jenny` (vock-fo2) and `fest`, `vcval`, `marin`, `lao` and `henry` (THAT). `ardin`, `bird`, `fannc`, `marge`, `merk`, `phl`, `plant`, `suze` and `dogmt` had none.

Palette index 0 is transparent. A stray index-0 pixel inside a face lets the dialogue background show through.

## What we found (audit of `talking_heads.dat`)

Phoneme files with fewer than 9 frames:

| file | frames |
|---|---|
| ardinbp, ardingp, ardinnp | 4 |
| bishpbp | 2 |
| kittybp, kittygp | 4 |
| merkbp | 8 |
| schbp | 1 |
| bgjesnp | 2 |

Missing phoneme files: `francbp` (Francis, bad mood) and `catgp` (Cat, good mood).

Fidget counts in `heads.lst` that don't match the art:

| head | TH declares | files exist |
|---|---|---|
| gruth | 1,1,1 | 1,1,0 (no `gruthbf1`) |
| franc | 2,2,2 | 1,2,2 |
| tray | 2,2,2 | 1,1,1 |
| arth | 1,1,1 | 2,2,2 |
| bosss | 2,2,2 | 1,2,2 (vanilla bug, RPU ships it too) |

Repeated frames: TH lip-sync files have 9 frames but reuse 4 or 5 mouths (typically `0 1 2 1 0 2 0 3 3`). TH fidgets play forward and back and hold frames, and 83 static heads use 1-frame transitions. Each repeated frame lands where its first copy did, so none of this makes a head jump. The `dogr` and `rdog` lip-sync files repeat one frame 9 times, which suits a dog.

Light: we compared each file's first frame with frame 0 of its mood's lip-sync file. Francis and Jenny were the only heads rendered in different light, apart from `bgjes` (see "Still open"). Jules's good and neutral fidgets are 3% brighter than his lip-sync, too little to see. Other heads differ by under 2%, which is dither.

Seams: we placed each file's first frame (and a transition's last frame) where the engine draws it and compared it with frame 0 of its mood's lip-sync file. TH seams line up except for the ones under "Jumps", and Goat_Boy's `bishpbp` fixed TH's Bishop snap. Some fidgets start on another mouth than the lip-sync file (`dario` open mouth, `dogmt` good bared teeth, `tndi2bf3`), so only the mouth changes at the seam.

## What we fixed

### Missing assets
- Goat_Boy redrew the short phoneme files with 9 frames each: `ardinbp`, `ardingp`, `ardinnp`, `bgjesnp`, `bishpbp`, `kittybp`, `kittygp`, `kittynp`, `merkbp` and `schbp`.
- Goat_Boy made the two missing phoneme files, 9 frames each with x offset 0: `francbp` (356x200) and `catgp` (308x200). `francbp` has the same light as the relit bad-mood art, and `catgp` starts on the same frame as Cat's other good-mood art.
- `gruthbf1.frm` is a VOCK blink made from frame 0 of `gruthbp`, since Talking Heads has no bad-mood fidget for Gruthar. It has 4 frames (open, closed, half, open).

### Fidget counts
- `heads.lst` changes four counts: `franc,1,2,2`, `tray,1,1,1`, `arth,2,2,2`, `bosss,1,2,2`. `bosss` has only `bosssgf1` in `master.dat`, but vanilla and RPU both declare 2 good fidgets.

### See through
- The 13 `sajag*.frm` files fill see-through pixels on Sajag's head.
- The 13 `ahs9h*.frm` files fill see-through pixels, mostly on the shirt and collar, some on the face and neck.
- The 13 `jenny*.frm` files fill see-through pixels on her top.
- `bgjesnf2.frm` fills see-through pixels on Mordino's fingers, hand and shirt.
- `vcvalbf2.frm` fills see-through spot on Valerie's collar.

### Light
- We relit `francbf1`, `francbf2`, `francbn` and `francgf1` to match the rest of Francis's art.
- We relit `jennybp`, `jennygp` and `jennynp` (lip-sync) to match her other files.

### Other
- Assets included in TH mod that the engine never loads: `vcvalnfp.frm`, `dogmtbfp` and `lbshpbfp`.

Script-side Talking Heads fixes live in `vock-fo2/CHANGELOG.md`: Don and Kurisu heads not showing, Kaga's head menu, and Miss Kitty's "Error" greeting for prizefighters.

## Still open

### Drifting
- Louise: Drifts sideways while talking. `lounp`, `lougp` and `loubp` have x offsets of -1 and +1 on several frames. The same kind of offsets are in the lip-sync files of `bird`, `suze`, `merk` (TH `merkgp`), `plant`, `marge`, `fest`, `phl`, `fannc` and `vcval`. Zeroing the offsets stops the drift, with at most a 1-pixel wobble.

### See through
- Other heads have see-through specks like Sajag had. The worst left is `henry`. Some specks are real gaps in hair or fur, so check each head before filling.

### Static heads
- Some moods never move. Their only fidgets have 1 frame: `dogmt` bad (`dogmtbf1`, `dogmtbf2`), `jules` bad (`julesbf1`), `marin` good (`maringf1`, `maringf2`) and `sch` good and bad (`schgf1`, `schbf1`). `dogmtbp` also repeats one frame 9 times, while Dogmeat's good and neutral lip-sync files move his mouth.
- `gruthgp`, `mcclrgp` and `lennybp` use 3 mouths. The same heads' other lip-sync files use 4.

### Light
- Big Jesus Mordino's lip-sync files (`bgjesgp`, `bgjesbp` and `bgjesnp`) are 6% darker than his other art.
- Jules' good and neutral fidgets are 3% brighter than his lip-sync, which is too little to see.
- Every other head is within 2%, which is just dither.

### Jumps
- The `ardin` head jumps 18 px sideways when the lip-sync starts in good or bad mood. Goat_Boy's `ardingp` and `ardinbp` carry header shifts of 0 and -36, where TH's used 18 and -18. Setting them back to 18 and -18 lines them up with the fidgets. `ardinnp` (-17 against TH's -18) lines up.
- Smaller TH jumps: Dogmeat 3 px when he starts talking in bad mood, Jenny 2 px at every lip-sync seam, and `vcval`, `fannc` and `marin` 1 px.
- `laobn` is a byte copy of `laonb`. Going from bad to neutral, Lao's head snaps to the neutral pose, plays the neutral-to-bad animation, then jumps back to neutral.
- Klint's bad lip-sync (`klintbp`) faces the camera, while his bad fidgets and `klintnb` look down to the side. His head snaps between the two poses when he starts or stops talking in bad mood.

### Cut at the edge
TH art fills the middle 356 px of the 388 px window. On these heads the body runs to the edge of the art and stops in a hard vertical line about 16 px inside the window. The cut is in the TH art, and the fix is new art at 388 px wide. Measured as 60+ solid pixels on the first or last column of a frame, placed as the engine draws it:

| head | side | solid px on edge | files |
|---|---|---|---|
| vaj | both | 200 | 13 |
| bgjes | right | 200 | 1 (`bgjesnf2`, the arm coming in, frames 3-11) |
| typhn | right | 181 | 2 |
| cat | right | 162 | 1 |
| jules | right | 138 | 2 |
| marin | right | 133 | 5 |
| tully | left | 114 | 2 |
| franc | right | 101 | 12 (left shoulder armour) |
| cnr | right | 79 | 5 |
| kit | left | 76 | 1 |
| mason | both | 75 | 2 |
| kitty | right | 66 | 3 |
| arth | both | 65 | 13 |

Checked by eye on `bgjes` and `franc`. Another 31 heads touch the edge with 20 to 60 pixels, mostly the bottom of the torso, which is hard to see. `docs/edge-cuts.md` lists them.

## License

Goat_Boy's art is CC BY-NC-ND 4.0. See `LICENSE-ART` in the vock-fo2 repo root.
