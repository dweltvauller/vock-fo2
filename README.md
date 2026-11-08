# V.O.C.K. Fallout 2

A voice-acting mod for Fallout 2, adding spoken dialogue for NPCs using volunteer voice actors. Built with the [V.O.C.K. pipeline tool](https://github.com/dweltvauller/vock).

- [CREDITS.md](CREDITS.md): voice cast
- [THAT.md](THAT.md): Talking Heads Actually Talk voice cast
- [CHANGELOG.md](CHANGELOG.md): release history
- [THAT_FIXES.md](THAT_FIXES.md): fixes to the THAT voices, by version
- [TALKING_HEADS_FIXES.md](TALKING_HEADS_FIXES.md): fixes to the Talking Heads portraits, by version

## Repository layout

The source is a sparse, RPU-shaped `data/` tree — only the files this mod adds or changes, so `diff -r ../rpu/data data` is the full manifest:

| path | contents |
|---|---|
| `data/text/english/dialog/*.msg` | dialogue MSGs with VOCK audio tags |
| `data/text/english/game/pipboy.msg` | holodisk-narration audio tags |
| `data/text/<lang>/dialog/*.msg` | the same tags injected into RPU's translations |
| `data/sound/speech/<npc>/*.acm,.lip,.txt` | generated speech |
| `data/sound/pipboy/*.acm` | generated holodisk narration |
| `data/scripts/*.int` | compiled talking-head scripts (source in `scripts_src/`) |
| `data/art/heads/*.frm` | talking-head art |
| `data/art/heads/heads.lst` | Talking Heads' head list with fidget counts corrected to match the art |
| `wav/`, `textgrid/` | rebuild metadata (kept out of `data/`) |
| `vock-fo2.ini` | player settings, shipped to the game's `mods\` folder (`[Additions]` has one switch per non-vanilla VOCK addition: the post-endgame easter-egg floats and their interval, Darion's karma-based taunts, and the Sacred Head's talking head) |

Build with `vock.py` (`layout = data` in `vock.cfg`): it packs `data/**` verbatim into `dat/vock-fo2.dat`, plus `dat/vock-fo2-floats.dat` (ambient floats) and `dat/vock-fo2-combat.dat` (per-NPC combat barks) as opt-out overlays defined by `float_filter.cfg` / `combat_filter.cfg`, and `dat/vock-fo2-pipboy.dat` (holodisk narration).

## License

This repository uses three licenses:

| What | License |
|---|---|
| Voice recordings: `data/sound/speech/**/*.acm`, `work/wav/**`, and the speech packed into `dat/*.dat` | [CC BY-NC-ND 4.0](https://creativecommons.org/licenses/by-nc-nd/4.0/) — see [`LICENSE-AUDIO`](LICENSE-AUDIO) |
| Art: `data/art/**` and the copies packed into `dat/*.dat` | [CC BY-NC-ND 4.0](https://creativecommons.org/licenses/by-nc-nd/4.0/) — see [`LICENSE-ART`](LICENSE-ART) |
| Everything else this mod authors: tooling, configs, lip-sync and TextGrid data, script changes | MIT — see [`LICENSE`](LICENSE) |

Each voice recording is © its voice actor, as listed in [CREDITS.md](CREDITS.md). You may share the recordings unchanged, for non-commercial purposes, with credit to the voice actor and a link to this repository. You may not edit, remix, pitch-shift, re-cut, or otherwise adapt them, and you may not use them in paid or monetized works. Repackaging the unchanged files for a mod pack or format conversion is fine.

The voice actors do not permit using these recordings to train, fine-tune, or prompt voice-cloning or other generative AI models. Ask the voice actor directly for any use outside these terms.

Each piece of art is © its artist, as listed in [CREDITS.md](CREDITS.md): the talking-head images and art asset bugfixes by Goat_Boy, and the Sacred Head talking head (`data/art/heads/bhead*.frm`), rendered from a 3D model by medicaledical. The same terms as the voice recordings apply: share unchanged, non-commercially, with credit to the artist and a link to this repository; no edits or adaptations. The license covers the art files in this repository only, not the 3D model itself, which is not distributed here. Ask the artist directly for any use outside these terms.

Fallout 2 and its original dialogue, scripts, and art belong to their respective rights holders. None of these licenses grants any rights to that content.
