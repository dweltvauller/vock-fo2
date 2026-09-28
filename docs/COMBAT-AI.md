# Combat AI Taunts — Scope

VOCK records combat floats for seven companions: Vic, Lenny, Goris, Robodog, Dogmeat, Davin, Kitsune. It also records them for one non-companion, Kaga. This file tracks what each one actually needs, why, and what's still open.

## Where the lines live

`combatai.msg` holds every combat taunt in the game — hit reactions, attack barks, run/miss lines — indexed by numeric ID. Fallout2-ce loads it directly; a sibling file, `cmbatai2.msg`, is dead weight left over from the original engine and isn't referenced anywhere in `combat_ai.cc`. We ignore it.

A critter's proto file points at an AI packet (`ai.txt`), and that packet defines which ID ranges fire for hit locations, attacks, moves, and misses. Two critters can share a packet. Two companions with separate packets can still point at the same ID range if nobody wrote unique lines for one of them.

VOCK keeps a single merged file, `vock-fo2/data/text/english/game/combatai.msg`, built by pulling each companion's range out of RPU's source file and copying it over intact.

## Per-companion status

**Goris** — 125 lines, base 44800, unique content, correctly wired. Record as written.

**Kitsune** — 36 lines, base 70400, unique content, correctly wired. Record as written.

**Robodog** (proto name Cyberdog, `PID_CYBERDOG`) — 5 lines at 60000/60020/60040-41/60060: run, move, two attack barks, one miss. All unique, real dialogue ("Whrrr. Click. Click. Woof!"), not filler. His hit-location reactions sit on a separate shared block (50000) used by both him and Dogmeat — we're leaving that block alone, so his hit reactions stay silent on the text side. His animation carries its own bark SFX regardless of what text plays.

**Lenny** — 180 lines, base 41200, unique content. His proto originally looked broken: the vanilla `dat/master` proto points his AI packet at Vic's packet instead of his own. Checked RPU's actual build proto (not the vanilla baseline) and found it already carries the correct packet number. No fix needed — RPU fixed this upstream before we ever looked. Record as written.

**Vic** — no unique lines exist. His AI packet correctly resolves to his own named section in `ai.txt`, but that section was authored to reuse the generic "Tough Person" ID range rather than carry its own text. We copied all 173 generic lines (100 hit-location, 20 run, 20 move, 20 attack, 13 miss) into his reserved ID block, 40400, so the engine has a real voice slot instead of silence. Recording is on hold — see below.

**Davin** — same situation as Vic. His packet resolves correctly to his own section, which reuses the generic "Normal Person" range. Copied the same 173-line shape into his reserved block, 42400. Recording is on hold — see below.

**Dogmeat** — no text lines, by design. His proto's combat vocalizations come from `MADDOGxx.ACM`, an animation-linked bark SFX set present in both the FO1 and FO2 vanilla sound trees. Confirmed this against FO2's own asset tree rather than assuming the FO1 precedent carried over. His four floater slots (50100/50120/50140/50160) exist in `combatai.msg` but sit empty; the text system and the bark SFX aren't mutually exclusive, so we could add lines on top of the barks, but we're not — matches the FO1 approach and avoids recording something the character was never designed to speak.

## Kaga

Kaga is not a companion. He is the special random encounter from Arroyo who hunts the player across five fights (`eckaga1`–`eckaga5`), wearing better armor each time. `combatai.msg` gives him his own range, 36000-36599, split into six blocks:

- **36000** — hit locations, shared by all five fights. 30 lines: head, arms, body, groin.
- **36100-36500** — one block per fight (Area 1-5), with run, move, attack, and miss lines. The 36500 run slots (36500-36505) are empty on purpose: Kaga does not flee in the final fight, which matches `eckaga5`.

That is 152 lines with text. Many repeat across fights, so they reduce to 86 unique tags:

- **13 reused script tags** — `kaga6/10/11/15/27/30/34/35/36/37/39/43/49`. The line already exists in his encounter scripts and is already recorded, so the bark plays the same file.
- **73 new tags** — `kaga50`–`kaga122`. These are listed in `combat_filter.cfg` and added to the "Combat Barks" section of `va-scripts/Kaga.md`.

Like the other combat barks, the new tags are ACM only (no LIP) and are packed into the opt-out `vock-fo2-combat.dat`. None of `kaga50`–`kaga122` is recorded yet.

## Recording scope

Record now: Goris (125 lines), Kitsune (36 lines), Robodog (5 lines), Lenny (180 lines), Kaga (73 new lines, `kaga50`–`kaga122`).

On hold: Vic (173 lines), Davin (173 lines). Both sets are copies of the shared archetype pool, not writing unique to either character — recording the full set would spend two VA sessions voicing text that isn't distinctly theirs. The lines stay in `combatai.msg` so the engine has something to load; no recording session is scoped for them until we decide whether to record the copies as-is, trim to a representative subset, or wait for bespoke lines.

Skip entirely: Dogmeat (bark SFX only, no text).

## Open questions

Vic and Davin recording scope — full set, trimmed subset, or bespoke rewrite. If bespoke lines get written later, swap them into the same 40400 / 42400 slots; the ID ranges are already reserved and correctly wired either way.
