# Quartermaster (Armory) — VA Script
**Character:** Quartermaster (QM), Navarro military base — issues standard-issue gear to new recruits

**Total recordable lines:** 12 (`qm1`–`qm12`)

---

> **Direction:** A brisk, no-nonsense supply NCO — more paperwork clerk than soldier, but still Enclave military through and through. Businesslike and mildly suspicious of anyone who isn't in proper uniform, with a dry, cutting sarcasm for anyone who comes across as slow. He can flip fast from routine processing to hard authority if a base alert is up or someone gives him the wrong answer about papers.

---

## Spotted With Company
*Triggered if he notices the PC has party members along.*

`qm1:` Who the hell are you guys... Alert! Intruders on the base!

## First Meeting — Already in Power Armor
*Approaching alone while already wearing power armor — he assumes you're a soldier trying to offload old gear.*

`qm2:` What the... I can see why you're here. You obviously want to get rid of that antique suit you're wearing.

## First Meeting — Out of Uniform
*Approaching alone without proper power armor.*

`qm3:` Why are you out of uniform, soldier?

*Response to a vague or evasive answer.*

`qm4:` Uh, what? Can't think of a good excuse? I'm waiting, soldier!

*Low-intelligence PC.*

`qm5:` You're a bit on the slow side, aren't you? (sigh) Well, that's not your fault. I have a brother just like you. Anyway, are you new here? I don't recall seeing you before.

*Standard-intelligence PC.*

`qm6:` Are you new here? I don't recall seeing you before.

## Issuing Standard Gear
`qm7:` Well, you'll need your standard issue, then. Go into the armory, suit up, and take your weapon. You should report to the Drill Sergeant afterwards.

`qm8:` You're welcome. Now get out of here. I've got work to do and I don't want to be disturbed.

## Too Busy to Talk
*Ambient float, no dialog box. Plays on a repeat visit, or as a flat brush-off once he's already sorted the PC out.*

`qm9:` I'm busy right now. Come back later.

## Sent By the Sergeant
*A later, scripted visit — the Sergeant has called ahead.*

`qm10:` Hello, recruit. I just got a call from your Sergeant. He says I'm to suit you up and send you back to him. That right?

## Base Alert / Security Check
*Base is on high alert and he doesn't recognize the PC.*

`qm11:` This base is on alert and I don't recognize you. Show me your papers, soldier.

*PC fails to produce valid papers.*

`qm12:` Wrong answer. You're to carry your papers with you at all times and you should know that!

---

*End of script — 12 lines total. Tag numbers follow ascending message-ID order, not this document's topical grouping.*
