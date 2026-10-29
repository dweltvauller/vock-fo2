# Navarro Base Commander — VA Script
**Character:** Navarro Base Commander (CMDR), Enclave

**Total recordable lines:** 23 (`cmdr1`–`cmdr26`; 3 tags share another tag's recording)

---

> **Direction:** An aggressive, highly authoritarian, and ultra-patriotic military commander for the Enclave. He has zero patience for "mainland mutants" or lower-ranking grunts. His tone should be demanding, arrogant, condescending, and fierce. He treats anyone from outside the Enclave as a biological abomination. Deliveries should sound crisp, militaristic, and powerful.

---

## Intruders Spotted
*Triggered if the commander spots the PC inside his office with party members.*

`cmdr1:` Who the hell are you guys... Alert! Intruders on the base!

## Standard Grunt Greeting
*Triggered approaching alone while wearing Power Armor — he mistakes the PC for a low-ranking soldier.*

`cmdr2:` I don't have time to chitchat with the grunts. You're dismissed.

## Repeated Interaction / Dismissals
*Talking to him again after being dismissed.*

`cmdr3:` I told you I don't have time for you. Leave this office and do not come back here unless I send for you. Dismissed!

*Refusing to leave after his final warning — triggers combat.*

`cmdr4:` Disobeying a direct order of a superior officer is treason. I don't have time to court martial you so I'll handle this myself. Guards! Kill this idiot!

## The Vertibird Fob Quest
*Sent by another base NPC to retrieve the Vertibird plans/Fob.*

`cmdr5:` The Fob is in the locker over there. Have the duty officer contact me once it's secured. Dismissed!

*Alternative clean greeting loop while the PC is on active base duty.*

`cmdr6:` Make it quick soldier, I don't have all day to stand around.

## Base Alert / Security Check
*Non-dialogue script trigger if the PC manually interacts with his personal locker while he's watching.*

`cmdr7:` Leave my locker alone or I will dish out some serious pain.

*Base is on high alert, or the PC is caught walking around without proper clearance.*

`cmdr8:` This base is on alert and I don't recognize you. Show me your papers, soldier.

*PC fails to produce valid security papers.*

`cmdr9:` Wrong answer, maggot. You're to carry your papers with you at all times. You should know that!

## Timed Floats & Combat Audio
*Overhead floating warning bark if the PC tries to lockpick or steal from his locker.*

*Same take as `cmdr7` — no separate recording (was `cmdr10`).*

*Overhead combat shout when he or his guards open fire.*

`cmdr11:` Time to die.

## Pickpocket Detection
*Overhead bark if the PC is caught trying to steal from him directly (not his locker).*

*Same take as `cmdr11` — no separate recording (was `cmdr26`).*

## Restoration Project — Captured / Brought to Office
*Extended scene: PC sneaks onto the Enclave Vertibird in New Reno and gets caught arriving at Navarro.*

`cmdr12:` Alright, let's get this over with -- I don't like muties stinking up my office, and I got shit to do. Do you work for the Salvatores?

## Interrogation — PC Is Hostile

`cmdr13:` I don't have time for this bullshit. Guards! Kill this mutie!

## Interrogation — PC Claims Independence

`cmdr14:` So you're saying you're nothing more than a stray wasteland rat that happened to wander into one of our vertibirds?

*PC confirms they're a lone wanderer.*

`cmdr15:` Good, if you're acting alone, then I don't have to waste another second of my time with you. Guards! Kill this mutie!

*PC tries to pass it off as a misunderstanding.*

`cmdr16:` You're not leaving here alive, mutant. I couldn't risk you blabbing the location of this base to all your wasteland friends, now could I? Guards! Kill this mutie!

## Interrogation — PC Admits Working for the Salvatores

`cmdr17:` Tell me what I want to know, and I'll make sure your death is quick and... Relatively painless. Did Salvatore put you up to this?

*PC hesitates or gives a confused answer.*

*Same take as `cmdr13` — no separate recording (was `cmdr18`).*

*PC brags or gets snarky about working for Salvatore.*

`cmdr19:` That supposed to be funny, mutant? I think you'll be a lot funnier to me when you're a bleeding corpse. Guards! Kill this mutie!

## The Interrogation Q&A Loop
*Triggers if the PC tries to bargain for information before dying. Performance note on `cmdr20:` chuckle mockingly before speaking.*

`cmdr20:` Oh, you do? Well hell, why not? You're dying anyway. What do you want to know, mutant?

*"Why do you keep calling me a mutant?"*

`cmdr21:` Because you ARE. Sure, you might look kinda human, but don't let that fool you. You're still a mutant. You and everyone else on the mainland. All tainted. Next question?

*"Who the hell are you guys?"*

`cmdr22:` We're the Enclave -- The last bastion of true humanity on this damn planet. We're the only ones still upholding the honor of the ol' red, white, and blue. That's right, we're true patriots. We eat bald eagles and shit stars and stripes. We're all that's left of the great United States of America. But we're enough. Oh, yeah, we're enough to set things right. You can count on that, mutie. Next question?

*"Where am I?"*

`cmdr23:` This here's Navarro, our secret mainland base. We're sitting right on the coast of California and the pacific ocean. Next question?

*"How can I get some of that sweet armor?"*

`cmdr24:` By prying it off my dead body. Good luck with that, mutie. Next question?

## Ending the Interrogation

*PC says they've heard enough, or the question loop completes.*

`cmdr25:` Good, 'cause I'm damn tired of wasting my breath on a mutant. In fact, this whole things a waste of my time, because I don't give a flying fuck what you've got to say to me. Guards! Kill this mutie!

---

*End of script*
