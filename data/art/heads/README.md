# Talking Heads art: findings and fixes

VOCK loads after Talking Heads (THAT) in `mods_order.txt`, so any file in this folder replaces the Talking Heads copy of the same name.

## How the engine reads head art

For each head, `heads.lst` lists a name stem and three fidget counts (good, neutral, bad). The line number is the head ID that protos and scripts reference, so you can't reorder, insert or delete lines.

During dialogue fallout2-ce loads these files:

- `<head>gp`, `<head>np`, `<head>bp`: lip-sync (phoneme) frames. The phoneme table indexes frames 0 to 8, so each file needs 9 frames.
- `<head>gf<N>`, `<head>nf<N>`, `<head>bf<N>`: idle fidgets. The engine picks N between 1 and the count in `heads.lst`, then builds the file name from it.
- `<head>gn`, `<head>ng`, `<head>nb`, `<head>bn`: mood transitions. All of them exist in THAT.

If a phoneme file has fewer than 9 frames, the mouth freezes on the last frame it has. If `heads.lst` declares more fidgets than exist, the engine tries to load a file that isn't there and that fidget never plays. Neither case crashes the game.

## What we found (Sep 13 audit of THAT's `talking_heads.dat`)

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

| head | THAT declares | files exist |
|---|---|---|
| gruth | 1,1,1 | 1,1,0 (no `gruthbf1`) |
| franc | 2,2,2 | 1,2,2 |
| tray | 2,2,2 | 1,1,1 |
| arth | 1,1,1 | 2,2,2 |
| bosss | 2,2,2 | 1,2,2 (vanilla bug, RPU ships it too) |

THAT's `heads.lst` also lists 62 heads with no art in THAT. Those heads use base-game art or never got drawn, and we left them alone.

## What we fixed

- Goat_Boy redrew the short phoneme files with 9 frames each. They live here as `ardinbp`, `ardingp`, `ardinnp`, `bgjesnp`, `bishpbp`, `kittybp`, `kittygp`, `kittynp`, `merkbp` and `schbp`. `bishpbp` grew from 216x185 to 337x192, so check Bishop in game. Goat_Boy's three Kitty files share one image, and THAT had already shared `kittybp` with `kittygp`.
- `heads.lst` here copies THAT's file line for line (CRLF endings) and changes four counts: `gruth,1,1,0`, `franc,1,2,2`, `tray,1,1,1`, `arth,2,2,2`.
- We left `bosss,2,2,2` alone to match vanilla and RPU. The fix belongs upstream in RPU as `bosss,1,2,2`.
- We lowercased every file name here and dropped a duplicate `bgjesnp.FRM` that git tracked next to `bgjesnp.frm`.

Script-side Talking Heads fixes live in `CHANGELOG.md`: Don and Kurisu heads not showing, Kaga's head menu, Francis audio crossover, and Miss Kitty's "Error" greeting for prizefighters.

## Still open

- `francbp.frm` and `catgp.frm` don't exist. Ask Goat_Boy for them.
- `gruthbf1.frm` doesn't exist. Once it lands, set gruth back to `1,1,1`.
- RPU PR for `bosss,1,2,2`: not filed. THAT's `heads.lst` overrides RPU's, so VOCK would need to carry the change here too.

## License

Goat_Boy's art in this folder is CC BY-NC-ND 4.0. See `LICENSE-ART` in the repo root.
