# Zeke — VA Script
**Character:** Zeke, elder of the surviving Vault 15 squatters

**Total recordable lines:** 22 (`zeke1`–`zeke22`)

---

> **Direction:** Zeke is the de facto leader of Vault 15's surviving squatters -- elderly, practical, and worn down by years of scraping by under Darion's raiders. Guarded and dismissive with strangers at first, wanting no trouble brought to his people's door, but once the player proves trustworthy (by helping Rebecca) he opens up into a tired, pragmatic negotiator: laying out exactly why his people can't fight back on their own, then jumping at an NCR deal the moment it's offered, so long as Darion dies first. Adult-to-older male, weary survivor's voice -- brusque suspicion giving way to cautious relief, and finally either warm gratitude or bitter irony depending on how the deal actually shakes out.

---

## First Meeting -- Turned Away
*Player's first visit, before earning any trust. Zeke just wants the stranger gone.*

`zeke1:` My name's Zeke, stranger. I'm sorry, but I don't have time to talk to you -- and I don't think there's anything in this town for you, anyway. You should move on.

## Pressed for Answers Anyway
*If the player insists on asking questions despite being turned away.*

`zeke2:` Well, I think you'll find that we're all out of answers here. Why don't you come back when we get a shipment in?

## Repeat Visit -- Still Not Trusted
*Same brush-off on later visits, before the player has earned any standing.*

`zeke3:` Hello, again. I still don't have any answers for you, stranger. Why don't you take a hint and get the duck out of fodge?

## Earning Trust -- First Real Conversation
*Once the player has helped Rebecca, Zeke opens up for the first time.*

`zeke4:` Rebecca has told me what you did for her. I want to apologize for the treatment you received here. You certainly didn't deserve it. What can I help you with?

## Trusted -- Standard Greeting
*Repeat visits once trust is established.*

`zeke17:` What can I help you with?

## Questions Hub

`zeke5:` What do you want to know?

## About Darion

`zeke6:` Yes, I do. I act as the middle man between him and the people up here. I'm not very happy about the fact, now that I know what he's up to.

## About the Raiders

`zeke7:` Nothing. They have the guns, they control the water, and they control the food. That means they are in charge. Period. We have no skills and no means of support without the backing of Darion. How can we turn against him? We're at his mercy.

## About the Vault Door
*Gives the player the key card he's been holding onto.*

`zeke8:` It's behind that door over there, but it's locked from the other side and trapped, too. I don't have any means of opening it... Wait a minute. I found this key card some time ago, and I have no idea what it is for. Rebecca says that you found some sort of door where they were holding Chrissy. Maybe this card will open it. Here, take it.

## Anything Else Going On?
*The NCR angle -- Zeke lays out why the settlement can't just turn on Darion.*

`zeke9:` There's a city west of here called NCR. They claim Vault 15 is their ancestral home and they want it back. They've been sending people here trying to talk us into leaving but we aren't going for it. This is the only home we know.

## Anything Else -- After the Deal's Already Been Offered
*Shorter version once the NCR deal is already on the table.*

`zeke18:` Just the problems with the NCR, but I think the deal you offered will solve that.

## Proposing the NCR Deal

`zeke10:` That all depends. What did you have in mind?

## The Catch -- Darion Has to Go
*Zeke agrees to the deal, but only if the player takes care of Darion first.*

`zeke11:` Not bad... I like it. You've got yourself a deal if you can get NCR to agree to it as well. But... Look, someone has to take care of Darion and his cronies. It should be done now before they realize what has happened and have time to prepare for an attack. Why not get this over with and take Darion out now? You'll have the element of surprise on your side.

## Player Agrees to Deal With Darion

`zeke12:` Excellent. Good luck to you, and thank you.

## Player Hesitates

`zeke13:` Well, take the time to think about it, but know this -- until Darion is out of the picture, I have no choice but to maintain things around here as they are. It's for the safety of everyone concerned. That means no deal and you are still persona non grata. Understand?

## Waiting on Darion's Death
*Greeting while the player has agreed to kill Darion but hasn't yet.*

`zeke14:` Hi. I'm still waiting for a final resolution to our troubles. In other words, kick Darion's ass!

## Leaving Without Asking About the Vault Door
*Triggers if the player heads out without ever asking about the key card.*

`zeke16:` Wait, before you go... I found this key card some time ago, and I have no idea what it's for. Rebecca says that you found some sort of entrance where they were holding Chrissy. Maybe this card will open it. Here, take it.

## Darion Is Dead -- Deal Fulfilled
*Plays if the player had already struck the NCR deal before killing Darion.*

`zeke15:` You've done it, friend! We're no longer under Darion's yoke. Thank you! I'm ready to accept your deal with NCR now. Just have them send one of their reps by and I'll seal the deal.

## Darion Is Dead -- No Deal Was Made
*Plays if Darion died without the NCR deal ever being discussed.*

`zeke19:` You've done it, friend! We're no longer under Darion's yoke. Thank you!

---

## Floats -- Ambient

### Deal Completed
*Plays instead of opening dialogue once the NCR deal has fully gone through.*

`zeke20:` Thanks for the chance of a new life. We all owe you.

### Hostile
*Plays if the player has turned hostile toward Zeke.*

`zeke21:` Just go away. I have nothing to say to you.

### Darion Dead, But the Deal Fell Through
*A bitter, ironic outcome -- Darion's gone, but without the NCR arrangement finalized properly, the settlement has no food supply.*

`zeke22:` Now that Darion's gone we don't have any way to get food. We will surely perish! Thanks a lot.

---

*End of script -- 22 lines total. Tag numbers follow ascending message-ID order, not the document's topical grouping.*
