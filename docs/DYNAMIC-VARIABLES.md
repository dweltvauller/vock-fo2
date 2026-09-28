# Dynamic Variables in NPC Dialogue

Some Fallout 2 NPC lines aren't a single `.msg` entry. The script builds them at runtime by gluing `mstr()` fragments around a live value: a price, a count, the player's name, a gender flag, a story flag. That breaks voice-over in two ways:

- A recorded line can't say a number or name that changes per playthrough.
- The engine only plays the audio for the **first tagged** `mstr()` in a concatenation, so every later tagged fragment never voices (the dead-tag bug).

This file lists every such line for the Talking Head NPCs VOCK forks, and how each one was handled. It's split by which project owns the voice: **VOCK** or **THAT** (per the `Mod` column in `vock-npc/data/character_table.csv`).

The originals come from RPU's `scripts_src`, not from the `//VOCK:` comments in our scripts. Current state comes from `scripts_src/` and `data/text/english/dialog/` in this repo. PC dialogue options (`NOption`/`BOption`/`GOption`) aren't voiced and are left out. Compiled 2026-09-27.

## How a splice gets resolved

- **Staged direction.** The call stays concatenated and the tag stays on the first fragment. The live value sits inside a bracketed stage direction, e.g. `(Counts $X.)`, so it shows in the subtitle but the VA never speaks it.
- **Merged.** The concatenation is replaced with one new whole-line msg ID per reachable variant, logged under `# VOCK Add Ons` in the NPC's `.msg`. The variable either disappears, becomes a generic word, or just picks which merged ID plays.
- **Unvoiced tail.** The value sits outside the only tagged fragment, so the audio simply doesn't cover it. Nothing is dead, but the value isn't staged either.
- **Open.** Still concatenated, and either a tagged fragment never voices or a spoken value isn't staged.

---

# VOCK

## Money and prices

### Staged direction

| NPC | Script | Variable | Tags | Subtitle |
|---|---|---|---|---|
| Zaius | `hczaius` | `local_var(LVAR_Reward)` | zaius16, zaius19 | `(Counts $X.)` / `(Counts $X and gives you half.)` |
| Frankie | `dcfranki` | `whiskey_cost` | frank4 | `(He jerks a thumb at a sign behind the bar: Whiskey shot... $X)` |
| Sheila | `dcsheila` | `sex_cost` | shela14 | `(She pulls her top open. The price is written right across her chest: $X.)` |
| Metzger | `dcmetzge` | `party_price` | metzg40, 41, 43, 44, 45, 62, 63 | counts out, shuffles, slides, slaps down, taps the contract tag: `$X` |
| Metzger | `dcmetzge` | `slaving_money` | metzg68-80 | `(Tosses a coin pouch with $X.)`, `(Counts dirty caps $X.)` |
| Skeeter | `gcskeetr` | `MCOST`, `DECOST`, `HRCOST`, `ARCOST`, `FNCOST`, `CPCOST` | skeet48, 49, 51, 52, 53, 54 | chalks or scrawls the price: `$X).` |
| Grisham | `mcgrisha` | `brahmin_seed_reward` | grish3 | `(he hands over $X)` |
| Doctor Andrew | `vcandy` | `Heal_Rate` | andr6, andr7 | `(Scribbles $X onto a blood-stained prescription pad.)` |

In RPU, Skeeter's first five price lines were built into a `temp_msg` string. They now each have their own `Reply()`.

Metzger's metzg68 and metzg71 also spliced `dude_name`. The name was replaced with msg 1552 ("slaver"), and the money splice stays staged.

### Open

| NPC | Script | Variable | Tags | Problem |
|---|---|---|---|---|
| Eldridge | `nceldrid` | `MCOST`, `DECOST`, `HRCOST`, `ARCOST`, `FNCOST` | eld16, 17, 19, 20, 21 | plain `...for $` + value + `.`, no bracket; still built into one `temp_msg` |
| Eldridge | `nceldrid` | `CPCOST` | eld22 | plain `...SUPERCHARGE it for $` + value |
| Eldridge | `nceldrid` | `module_price` (selector) | eld34/35 + eld36 | eld36 never voices |
| Doctor Andrew | `vcandy` | `multRate` | andr15 | unvoiced tail: `Well, now... tell you what.` is tagged, `N bucks for the whole lot of you...` isn't |
| Doctor Jubilee | `scdocjub` | literal `10000` | jub17 | `...let it go for $` + `10000` + `.`, no bracket (fixed amount, not a live value) |

## Other numbers and codes

| NPC | Script | Variable | Tags | Resolution |
|---|---|---|---|---|
| Grisham | `mcgrisha` | `brahmin_killed` | grish3 | staged: `(he raises N fingers)` |
| Jo | `mcjo` | `days_left` | jomod64 | staged: `(He counts off on his fingers: N days.)` |
| Doctor Jubilee | `scdocjub` | `LVAR_Westin_Pill_Pickup_Counter - GAME_TIME_IN_DAYS` | jub31, jub32, jub45, jub54 | RPU built each line from gender, day count and a day/days plural. It's merged to one line per gender, with the count staged after it: `(Points to a calendar hanging on the wall: N days out.)` |
| Leslie Anne Bishop | `nclabish` | `mrs_bishop_combination` | lbshp122, lbshp105 | combination still spliced after the tag; new staged tail after it (msg 2514, 2761) |
| Leslie Anne Bishop | `nclabish` | `random_combination` | lbshp83 | unvoiced tail in reverse: the number comes before the only tagged fragment (`, I think... something like that...`) |

## PC name (`dude_name`)

| NPC | Script | RPU fragments | Resolution | Replaced with |
|---|---|---|---|---|
| Brother Matthew | `abmatt` | 800 + name + 801 | merged, 1800 | "friend" |
| Morlis | `acmorlis` | 212 + name + 213 | merged, 1212 | "Chosen One" |
| Charles Curling | `qccurlng` | 127 + name + 128 | merged, 1128 | "mutant" |
| Torr Buckner | `kctorr` | 229/249 + name + 230/231/250/251; 279 + name + 280 | merged, 1230, 1231, 1250, 1251, 1280 | "friend" |
| Aldo | `kcaldo` | 300 + name + 301; 350 + name + 351 | merged, 1300, 1350 | dropped ("Oh mighty one", "Well, friend") |
| Grisham | `mcgrisha` | 600/601 + name + 1600/1601 | merged, 650, 651 | "in-law" ("my in-law" in 651) |
| Jo | `mcjo` | floats: 629/630 + 605 + name + 606, both name orders | merged, 1600-1605 | "this person at your side" |
| Christopher Wright | `ncchrwri` | 246/247 + name + 1246/248; floats `floater_rand_with_check(200-205, 220-222, dude_name)` | merged, 1306, 1307; floats 1300-1305 | dropped; floats rewritten without a name |
| Ethyl Wright | `ncethwri` | float 530 + name + 1530 | merged, 1614 | "stranger" |
| Keith Wright | `nckeiwri` | 253 + name + 1253 | merged, 1352 | dropped |
| Jagged Jimmy J | `ncjimmyj` | floats `floater_rand_with_check(200, 206, dude_name)` | merged, 2200, 2201 | dropped; floats rewritten without a name |
| Leslie Anne Bishop | `nclabish` | 315 + name + 1315 + name + 2315; floats 510/511 (one or two names); 591 + name + 1591 (+ 592/593 by gender); 665 + name + 1665 | merged, 2317, 2510, 2512, 2591-2593, 2665 | "darling" |
| Orville Wright | `ncorvill` | 310 + name + 5310; 580 + name + 5580 | merged, 1310, 1580 | "tribal" |
| Vikki Goldman & Juan Cruz | `fcjuavki` | 193 + name + 228 | merged, 1193 | "recruit" |
| Connar | `vcconnar` | 167 + name + 168; 740 + name + 741 | merged, 2200, 2201 | "wanderer" |
| Goris | `ocgoris` | 14 lines: 111/204/1000/1019-1022/1041/1060/1079/1098/1117/1136/1137 + name + 215/216/1156/1157/1158; name + 1158 | merged, 2111, 2204, 3000, 3019-3022, 3041, 3060, 3079, 3098, 3117, 3136, 3137, 3158 | "brother" |
| Metzger | `dcmetzge` | 540 + money + 15401 + name + 2540; 543 + name + 1543 + money + 2543 | name swapped for msg 1552 ("slaver"); money stays staged | "slaver" (msg 1552) |

## PC family name (`dude_family_name`)

| NPC | Script | RPU fragments | Resolution |
|---|---|---|---|
| Christopher Wright | `ncchrwri` | 316 + family + 317 | merged, 1308 |
| John Bishop | `ncbishop` | `temp` built as 200 + temp + 203 + family + 204 | merged, 2000 |

## Made-man name (`made_man_name`)

| NPC | Script | RPU fragments | Resolution |
|---|---|---|---|
| John Bishop | `ncbishop` | 750 + name + 751 | merged, 2022 (name slot dropped) |
| John Bishop | `ncbishop` | name + 745 | unvoiced lead-in: the name comes before the only tagged fragment (bishp80) |
| Keith Wright | `nckeiwri` | float 220 + name + 1220; 252 + name + 1252 | merged, 1350 (float), 1351 |
| Orville Wright | `ncorvill` | name + 575; 590 + name + 5590 | merged, 1575, 1590 |
| T-Ray | `nctray` | 731 + name + 5731 + name + 6731 | merged, 2028 |

## Gender (`dude_is_female` / `dude_is_male`)

All of these pick a fragment by gender (`mstr(N + dude_is_female)`) and glue it to a shared fragment.

### Merged (one ID per gender)

| NPC | Script | RPU fragments | Merged IDs |
|---|---|---|---|
| Doctor Jubilee | `scdocjub` | 200/260/290/300 + (201/261/291/301 + female) + 203/263/293/303 | 2002, 2003, 2006-2011 |
| John Bishop | `ncbishop` | 201 + temp + (205 + female); (515 + female) + 517; 725 + (726 + female); (820 + female) + 822 | 2001-2002, 2007-2008, 2020-2021, plus the Node062 820/821 merge |
| Leslie Anne Bishop | `nclabish` | (370 + female) + 372 | 2370, 2371 |
| Ethyl Wright | `ncethwri` | 380 + (381 + female) | 1605, 1606 |
| Jules | `ncjules` | 450 + (451 + female); (1320 + female) + 1322; (1340 + male) + 1342 (+ 1343); (1360 + female) + 1362 | 2010-2011, 2019-2026 |
| Orville Wright | `ncorvill` | 320 + (321 + female); (660 + female) + 662 | 1321-1322, 1660-1661 |
| T-Ray | `nctray` | (395/790/810/830 + female) + 397/792/812/832; 485/500 + (486/501 + female) + 488/503 | 2020-2025, 2029-2034 |

### Left as-is on purpose

| NPC | Script | Fragments | Why |
|---|---|---|---|
| Christopher Wright | `ncchrwri` | cw40/cw41 + untagged 487 | untagged shared tail, no dead tag; audit chose to leave it |
| Jagged Jimmy J | `ncjimmyj` | untagged stage direction 240 + jimmy1/jimmy2 | leading fragment is a pure stage direction, so the gendered line is the first tag and voices |

### Open

| NPC | Script | Fragments | Problem |
|---|---|---|---|
| Eldridge | `nceldrid` | eld11 + (eld12/eld13 by gender) | eld12/eld13 never voice |
| Eldridge | `nceldrid` | float (eld87/eld88 by gender) + eld89 | eld89 never voices |

## Other game-state variables

### Merged (one ID per branch)

| NPC | Script | Variables |
|---|---|---|
| John Bishop | `ncbishop` | `payment` (2003-2004), `previous_node` (2005-2006), `mrs_bishop_banged` (2023-2024) |
| Leslie Anne Bishop | `nclabish` | `bishop_dead` (2250-2251, 2400-2401), `prev_node` (2470-2471) |
| Ethyl Wright | `ncethwri` | `node_6` (1600-1603), `mrs_wright_pissed` (1607-1608), `know_mrs_wright` (1610-1611) |
| Keith Wright | `nckeiwri` | `has_rep_slaver` (1355-1356) |
| Jules | `ncjules` | `has_rep_slaver` (2012-2013), `dude_charisma` (2014-2018) |
| Orville Wright | `ncorvill` | `has_rep_slaver` (1241-1242), `prev_node` (1275-1276) |
| T-Ray | `nctray` | `banged_t_ray` (2026-2027) |

### Open or unaddressed

| NPC | Script | Variables | Fragments | Notes |
|---|---|---|---|---|
| Grisham | `mcgrisha` | `is_staging_davin_wedding`, `grisham_dead` | wedding-confrontation floats: grish71/72/76/93 + grish77/78 (Miria/Davin) or grish94/95 + grish82/83/84/85 | three or four tagged fragments per float; only the first voices. The audit also marks the whole scene float-gated |
| Eldridge | `nceldrid` | `prev_node` | eld39/eld40 + eld41 | eld41 never voices |
| Big Jesus Mordino | `ncbigjes` | `myron_in_room` | untagged 240 + untagged 241/242 | all stage direction, nothing to voice; listed for completeness |

---

# THAT

THAT's own merged `77xx` lines in the NPC's `.msg` resolve these splices. The lines were reworded, not staged. VOCK only fixed wiring on top: Miss Kitty's Node011 paid branch pointed at the free-wording line.

| NPC | Script | Variable | RPU fragments | Resolution |
|---|---|---|---|---|
| Miss Kitty | `nckitty` | `temp_cost` (price) | 290 + 292 + cost + 422; 320 + 322 + cost + 422; 335 + 336 + cost + 1336; (420 + partners) + cost + 422; (620 + partner) + cost + 422 | reworded to "if you have the chips": 7716, 7718, 7720, 7721-7722, 7732-7733 |
| Miss Kitty | `nckitty` | `dude_name` | name + 522; 565 + name + 566; 575 + name + 576 | name replaced with "Lover": 7725, 7728, 7729 |
| Miss Kitty | `nckitty` | `dude_family_name`, gender | `temp_msg` = 215-219 (218 + family + 1218), then `temp_msg` + (220 + female) | merged |
| Miss Kitty | `nckitty` | `possible_sex_partners`, `sex_partner_obj` | (420 + partners) + 423; (620 + partner) + 623 | one merged ID per branch: 7723-7724, 7734-7735 |
| Roger Westin | `scwestin` | `num` (payment) | 131 + num + 168 | number dropped, merged to 7700 |
