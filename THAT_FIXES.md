# THAT fixes

Talking Heads Actually Talk (THAT) gives about 60 Fallout 2 characters real voices. Play it on top of the Restoration Project and some of those voices go quiet, or say something the subtitle doesn't. vock-fo2 carries THAT's recordings and fixes what we find as we review each character. Versions match [CHANGELOG.md](CHANGELOG.md). For the talking-head art, see [TALKING_HEADS_FIXES.md](TALKING_HEADS_FIXES.md).

## WIP

### Lines you never got to hear

The actors recorded these, but the THAT-RPU scripts played an older, unvoiced version of the line instead.

- **Louis Salvatore** (New Reno): his offer to make you a made man.
- **Stuart Little** (New Reno): what he says after you lose a fight, after you win one, and when he signs you up.

### Recordings we fixed

- **Matthew** (San Francisco): his advice on getting into Navarro used to play a three-minute recording session, with takes of seven different lines. You now hear the one take that belongs there.
- **Louis Salvatore** (New Reno): his hissed "You have not yet PROVEN yourself... details of your assignment" stopped dead on the last sound. It now fades out.

### Subtitles that didn't match the voice

You'll hear the same takes as before. The subtitles now follow what the actors said.

- **Dragon** (San Francisco), three typos in his lines:
  - "advanced though their use" now reads "advanced through their use".
  - "You are ready fight Lo Pan" now reads "You are ready to fight Lo Pan".
  - "I do not believe you would use the knowledge for good" gets the "that" he says: "I do not believe that you would use...".
- **Stuart Little** (New Reno) greets you with "Awright, nice ta meet ya." The subtitle used to add a "Champ" he never says. When he asks if you've heard of him, he calls himself the "Biggest agent in all of New Reno", not "of Reno".
- **Matthew** (San Francisco) opens with "What can I do for you?". The subtitle said "What can I help you with?". Modders: 110 keeps the original line in `fcfmatt.msg`, and the game shows the new 1110.
- **Stark** (Vault City) says the raiders "always stop just short of breaking our defenses". The subtitle said "stop short of breaking through our defenses".
- **Stark** (Vault City) asks an outsider "Is there something I can help you with?" His subtitle said "What do you want?". Modders: the original line stays in `vcstark.msg` as 145, and the game shows the new 1145.

## v1.14

### Lines you never got to hear

The actors recorded these, but the THAT-RPU scripts played an older, unvoiced version of the line instead.

- **Miss Kitty** (New Reno): 15 lines, including her free services, companion sex, the greeting after the Enclave falls, the date and the job offer.

### Broken text

- **Miss Kitty** (New Reno) greeted a returning prizefighter or porn star with "Error". She says her real greeting now.

## Still broken

- **Roger Westin** (NCR): "Well then, that's all." plays half speed in a deep "monster" voice. It's a copy of the end of another Westin line, and THAT never shipped a real take of this one. It needs a new recording.
- **Typhon** (Broken Hills): three of his recordings stop before the actor finishes. "Find me one" ends at "Find m...", "made it a little easier on me" loses "on me", and "If I'd'a known..." loses its last sound. THAT shipped them cut, so these need new takes too.
- **Steve** (Broken Hills): THAT gave Marcus's reply "Ain't no future in it..." to Steve's actor, who never recorded it. We moved the line to Marcus, and it stays silent until his actor records it.

Next up: the THAT characters we haven't reviewed yet.
