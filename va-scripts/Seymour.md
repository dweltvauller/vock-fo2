# Seymour — VA Script
**Character:** Seymour, the talking spore plant, Broken Hills

**Total recordable lines:** 27 (`plant1`–`plant27`)

---

> **Direction:** Seymour is a genetically altered spore plant grown by a reclusive scientist known only as "the Professor," who nurtured him but never told anyone he was intelligent. He's been planted alone at the edge of town ever since, starved for company and stimulating conversation. Voice him as warm, erudite, and unfailingly cheerful, with a fondness for florid, old-fashioned courtesy ("my friend," "my fine-stemmed companion") and constant plant-based wordplay ("branch out," "put down roots," "the pollen of your indecision"). He never turns sour, even when the player brushes him off — disappointment reads as wistful melodrama, not anger.

---

## Ambient Floats — Before You've Ever Talked to Him
*One plays at random while the player is nearby, before they've spoken to Seymour for the first time. He's trying to get their attention.*

`plant22:` Psst! Hey! Hey, pal! Over here!

`plant23:` C'mere! I promise I won't hurt you.

`plant24:` Come on. You scared of a plant?

`plant25:` Over here! Let's get to it!

`plant26:` Yes, I'm a talking plant. Get over it and talk to me.

## First Meeting

`plant1:` Hi! Nice weather we've been having, huh?

`plant2:` Yes, I do talk. Better than some people, it seems. I'd smile at you right now, but I just don't have a mouth. [it laughs] Say, could you do me a big favor?

*Alternate reply — plays instead of plant2 if the player asks the more skeptical "is this really the plant that's talking?" question.*

`plant8:` Why, yes! Yes, it is! Very astute, friend, very astute. I can see you didn't germinate yesterday! My fine-stemmed companion, would you be so kind as to do me a favor?

*Alternate reply — plays instead of plant2 if the player already knows about the Professor.*

`plant10:` Oh, yes, the Professor. He grew me from a tiny spore and nurtured me... but I realized from an early age that if I were to act as smart as I truly am, he'd cut me into pieces to examine me. So, I played dumb and got planted out here. It's nice... but I'd like to branch out a little. Y'know, maybe get planted someplace else...

*Alternate reply — plays instead of plant2 if the player answers with a wordless grunt.*

`plant7:` Well said, well said! How delightful to see a homo sapiens use its brain to its fullest extent. My dear friend, would you be willing to do me a favor?

## Asking to Be Replanted

`plant3:` I'm looking for a better place to be. Right here is nice and all, but frankly, these plants aren't much for conversation. I was thinking over there, by the building with all the ghouls in it... Would you replant me?

*Alternate, smarter-phrased version of the same pitch.*

`plant9:` Deee-lightful! I'm very, very pleased. Just find yourself a shovel and come on back. When you're done, maybe I can tell you a secret. My friend, I do hope you continue to flower.

`plant4:` Great! All you have to do is find a shovel, dig me up, and plant me over there. When you do, I'll tell you a secret.

## The Chess Wager
*Follows on from plant10, if the player asks more about the Professor and his pet scorpion.*

`plant11:` So does he still have the scorpion? That thing is a mean chess player... it has a lot of bark and plenty of bite, if you know what I mean... but I know how to beat him. If you do me a favor, I'll tell you how.

`plant12:` My fine friend, if you will replant me near the ghouls' home over there, I will be happy to impart my deep-rooted knowledge of chess.

## Declining / Pity
*Plays whenever the player turns him down.*

`plant6:` If you should happen to change your mind, you know where to find me. I've put down roots here. Ha ha ha! Just a little plant humor for you. Oh, don't let me keep you. So long!

## Waiting to Be Moved

`plant5:` All right. Well, um... I'll be waiting here for you. Not like I really have a choice, you know. So long!

*A later visit, after the player has agreed but hasn't come back with a shovel yet.*

`plant15:` My friend! Has the sun been shining upon you? How does your day flower? Are you ready for the move? I certainly am!

*A later visit, if the player left without agreeing the first time.*

`plant20:` Have you had time to reconsider? Would you like to help me?

*If the player declines again on a return visit.*

`plant17:` That's a pity, that's a pity indeed. I do hope you'll change your mind at some point. Perhaps the pollen of your indecision will blow my way again. Good day.

*If the player has agreed to move him but shows up without a shovel.*

`plant21:` Alas, you do not appear to have a shovel. Until you can find one, I can't go. I await your return with bated pistil.

## Using a Shovel Directly on Him
*Float that plays if the player tries to use a shovel item on Seymour without going through dialogue first — he insists on talking it over.*

`plant27:` Whoa, friend. Don't just start digging. We've got to strategize the move first. Let's talk it over.

## The Move

`plant16:` I'm so excited I could release a spore cloud all over myself! Let's go!

## The Secret — Revealed Right After the Move
*Triggers automatically the moment Seymour is replanted — this is the "secret" he promised.*

`plant18:` Oooh... the soil here feels so... different. Cleaner, somehow. Probably because I don't have to share it with those other plants. Ahhh. Oh! Yes! If you ever run across the Professor and his scorpion, remember this chess maneuver: It's called the Flying Liver Attack, and the scorpion cannot stand against it.

`plant19:` I would also like to tell you that I happen to know the ghoul Typhon inside this building knows the whereabouts of a treasure trove. Perhaps that might be useful to you someday.

## Return Visits (After Being Replanted)

`plant13:` Ahh, my friend, you have returned. This is quite a delightful place here. The shade is perfect, and the company is simply dazzling. That Typhon, what a kidder! He really makes my intellectual sap flow!

*If asked to repeat the chess trick.*

`plant14:` Well, it was about how to beat the professor's scorpion at chess. My friend, it is simplicity itself. The Flying Liver Attack is like a flytrap to that bug - it walks right into it and then can't extricate itself. I guarantee your success.

---

*Total: 27 lines. Tag numbers follow ascending message-ID order in the `.msg` file, not this document's topical grouping.*

*End of script*
