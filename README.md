# V.O.C.K. Fallout 2

A voice-acting mod for Fallout 2, adding spoken dialogue for NPCs using volunteer voice actors. Built with the [V.O.C.K. pipeline tool](https://github.com/dweltvauller/vock).

- [CREDITS.md](CREDITS.md): voice cast
- [THAT.md](THAT.md): Talking Heads Actually Talk voice cast
- [CHANGELOG.md](CHANGELOG.md): release history

## Repository layout

The source is a sparse, RPU-shaped `data/` tree — only the files this mod adds or changes, so `diff -r ../rpu/data data` is the full manifest:

| path | contents |
|---|---|
| `data/text/english/dialog/*.msg` | dialogue MSGs with VOCK audio tags |
| `data/text/english/game/pipboy.msg` | holodisk-narration audio tags |
| `data/text/<lang>/dialog/*.msg` | the same tags injected into RPU's translations |
| `data/sound/speech/<npc>/*.acm,.lip,.txt` | generated speech |
| `data/scripts/*.int` | compiled talking-head scripts (source in `scripts_src/`) |
| `data/art/heads/*.frm` | talking-head art |
| `wav/`, `textgrid/` | rebuild metadata (kept out of `data/`) |

Build with `vock.py` (`layout = data` in `vock.cfg`): it packs `data/**` verbatim into `dat/vock.dat`, plus `dat/vock_floats.dat` (ambient floats) and `dat/vock_combat.dat` (per-NPC combat barks) as opt-out overlays defined by `float_filter.cfg` / `combat_filter.cfg`.
