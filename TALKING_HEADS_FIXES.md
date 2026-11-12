# Talking Heads fixes

The Talking Heads mod (TH) gives Fallout 2 characters animated, lifelike portraits. Some of them flicker, jump, freeze, show see-through spots, or carry a blue edge from the blue background they were cut out of. vock-fo2 fixes the heads it finds. Versions match [CHANGELOG.md](CHANGELOG.md). For the voices, see [THAT_FIXES.md](THAT_FIXES.md).

## WIP

### Lighting

- **Francis** (Broken Hills): his head now has the same lighting in every mood.
- **Jenny** (Klamath) no longer gets darker when she speaks.
- **Big Jesus Mordino** (New Reno) no longer gets darker when he speaks.

### See-through spots

- **AHS-9** (San Francisco): spots on his shirt, collar, face and neck are filled.
- **Jenny** (Klamath): spots on her top are filled.
- **Valerie** (Vault City): a spot on her collar is filled.
- **Badger** (San Francisco): spots in his teeth and on his shoulder pad are filled.
- **Frankie** (The Den): spots on his shoulder, chin and neck are filled.

### Heads that jumped or shook

- **Jenny** (Klamath) no longer jumps sideways when she starts or stops talking.
- **Valerie** (Vault City) no longer shifts sideways when she starts talking or while she talks.
- **Merk** (NCR) no longer shakes sideways while he talks.

### Wrong animation

- **Lao Chou** (San Francisco) no longer plays the wrong animation when his mood goes from bad to neutral.

### Blue aura

- **Tyler** (The Den): the blue ring around his outline is gone.

### Black aura

- **Frankie** (The Den): the black edge on his left shoulder and the white dots at his temple are gone.

## v1.14

### Frozen lip-sync

- **Ardin Buckner** (Klamath), **Big Jesus Mordino**, **John Bishop** and **Miss Kitty** (New Reno), **Merk** (NCR) and **Doctor Schreber** (Navarro) moved their lips on only a few frames. Goat_Boy redrew their lip-sync art with all 9 mouth shapes.
- **Gruthar** (Vault 13) froze in a bad mood, because Talking Heads has no bad-mood fidget for him. He now blinks.
- **Francis** (Broken Hills), **T-Ray** (New Reno), **Arthur Pendragon** (Special Encounter) and **Frank Horrigan** (Enclave Oil Rig): `heads.lst` pointed their fidgets at missing or unused art. Modders: the counts are now `franc,1,2,2`, `tray,1,1,1`, `arth,2,2,2` and `bosss,1,2,2`.

### See-through spots

- **Sajag** (Klamath): spots on his head are filled.
- **Big Jesus Mordino** (New Reno): spots on his fingers, hand and shirt in his neutral fidget are filled.
