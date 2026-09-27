# Talking Heads art: findings and fixes

VOCK loads after Talking Heads (TH) in `mods_order.txt`, so any file in `data/art/heads/` replaces the Talking Heads copy of the same name.

## How the engine reads head art

For each head, `heads.lst` lists a name stem and three fidget counts (good, neutral, bad). The line number is the head ID that protos and scripts reference, so you can't reorder, insert or delete lines.

During dialogue fallout2-ce loads these files:

- `<head>gp`, `<head>np`, `<head>bp`: lip-sync (phoneme) frames. The phoneme table indexes frames 0 to 8, so each file needs 9 frames.
- `<head>gf<N>`, `<head>nf<N>`, `<head>bf<N>`: idle fidgets. The engine picks N between 1 and the count in `heads.lst`, then builds the file name from it.
- `<head>gn`, `<head>ng`, `<head>nb`, `<head>bn`: mood transitions. All of them exist in TH.

If a phoneme file has fewer than 9 frames, the mouth freezes on the last frame it has. If `heads.lst` declares more fidgets than exist, the engine tries to load a file that isn't there and that fidget never plays. Neither case crashes the game.

The engine draws each frame centred in a 388x200 window, bottom aligned. It adds each frame's x offset to a running total and resets the total only at frame 0 (`gameDialogRenderTalkingHead` in `game_dialog.cc`). Fidgets and transitions play in order, so their offsets move the head predictably. Lip-sync frames play in phoneme order, so any x offset in a `*gp`, `*np` or `*bp` file makes the head drift sideways while the character talks.

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

All 13 `sajag` files have 17 to 23 pixels per frame set to palette index 0 on Sajag's cheeks, forehead, nose and lip.

TH's `heads.lst` also lists 62 heads with no art in TH. Those heads use base-game art or never got drawn, and we left them alone.

## What we fixed

- Goat_Boy redrew the short phoneme files with 9 frames each: `ardinbp`, `ardingp`, `ardinnp`, `bgjesnp`, `bishpbp`, `kittybp`, `kittygp`, `kittynp`, `merkbp` and `schbp`.
- `heads.lst` changes four counts: `franc,1,2,2`, `tray,1,1,1`, `arth,2,2,2`, `bosss,1,2,2`. `bosss` has only `bosssgf1` in `master.dat`, but vanilla and RPU both declare 2 good fidgets.
- `gruthbf1.frm` is a VOCK blink made from frame 0 of `gruthbp`, since Talking Heads has no bad-mood fidget for Gruthar. It has 4 frames (open, closed, half, open), all 333x200 with x offset 0, so gruth stays `1,1,1`.
- The 13 `sajag*.frm` files fix the see-through spots on Sajag's talking head.
- `bgjesnf2.frm` fixes the see-through pixels on Mordino's fingers and hand.
- `francbf1`, `francbf2`, `francbn` and `francgf1` are relit to match the rest of Francis's art. Talking Heads rendered his bad-mood art and his good fidget darker (average brightness 38-43 against 56-61), so the light jumped when his mood changed. Each mood change now meets an identical frame. A future `francbp` needs the same relight.
- The 13 `ahs9h*.frm` files fill 15,627 see-through pixels, mostly on the shirt and collar, some on the face and neck. A 1-pixel notch in the hair outline stays as it is.

Script-side Talking Heads fixes live in `CHANGELOG.md`: Don and Kurisu heads not showing, Kaga's head menu, and Miss Kitty's "Error" greeting for prizefighters.

## Still open

- `francbp.frm` and `catgp.frm` don't exist. Ask Goat_Boy for them.
- Lou drifts sideways while talking. `lounp`, `lougp` and `loubp` have x offsets of -1 and +1 on several frames. The same kind of offsets are in the lip-sync files of `bird`, `suze`, `merk` (TH `merkgp`), `plant`, `marge`, `fest`, `phl`, `fannc` and `vcval`. Zeroing the offsets stops the drift, with at most a 1-pixel wobble.
- Other heads have see-through specks like Sajag had. The worst are `jenny`, `vcval` and `henry`. Some specks are real gaps in hair or fur, so check each head before filling.

## License

Goat_Boy's art is CC BY-NC-ND 4.0. See `LICENSE-ART` in the repo root.
