# Gruthar — VA Script
**Character:** Gruthar, leader of the intelligent deathclaw pack living in Vault 13

**Total recordable lines:** 43 (`gruth1`–`gruth43`) — `gruth1`–`gruth2` are from a separate scene (see note at the end); `gruth3`–`gruth43` are his main dialogue.

---

> **Direction:** Gruthar is unmistakably a deathclaw — a huge, clawed predator — but speaks with the calm, formal precision of a diplomat. He's spent his life proving that intelligence deserves to be met with reason, not fear, and it shows: measured pace, full sentences, almost no contractions except when he's being blunt. He's protective of his pack to the point of quiet menace when threatened or mocked, but his default mode is patient and courteous, even generous, toward a stranger who treats him with the same respect. Underneath the composure is real weariness — he's had to fight for basic acceptance his whole life, and it costs him. He calls the player "human," not as an insult but as a simple statement of fact, the way he'd note anyone's species.

---

## First Meeting

`gruth3:` Do not fear me, human. I do not intend to harm you. I am Gruthar, leader of this deathclaw pack. Why have you come here?

`gruth4:` Why have you come here?
*Repeat greeting on later visits, before any real conversation has happened.*

## Sizing Up the Player's Intelligence
*Only comes up if the player picks a deliberately dumb-sounding dialogue option.*

`gruth5:` You are no idiot, human. I can see the truth of this in your eyes. Please do not try to deceive me. I have no patience for such games.

`gruth6:` Very well. If you wish to be thought of as an idiot, then so be it. Return to me if you change your mind.

`gruth7:` My apologies. You seem to be intellectually challenged. You are no threat to me or the pack. You are welcome here, and may consider this place a safe haven from the outside world. Harm no one, stay out of trouble, and you will always be welcome here.

## No Patience for Small Talk
*If the player presses him on how a deathclaw can talk.*

`gruth8:` Forgive me. I do not mean to be rude, but I do not see that this is relevant to our conversation. I can speak your tongue, I can read your written word. What more needs be said?

## Pointing the Way to Goris

`gruth9:` Yes, I certainly can. Very well. If we part as friends, human, you should speak with Goris. He has more understanding in this matter than I. He can usually be found in the vault library.

## What Happened to the Vault's People

`gruth10:` They are gone, human. We did not kill them and take their home. It is not our way to kill. I understand that you may not believe me, but I hope that you will judge me by my actions toward you and not out of fear or prejudice.

## Asking About the GECK

`gruth11:` A geck. Is that not a small lizard... no, wait... that is a gecko. I am sorry, but I do not know what a geck is, nor where it can be found.

`gruth12:` Yes, I believe you mentioned this once before. I do not know what a geck is, nor where it can be found.
*Repeat of the above, if asked again.*

## Considering the Request to Search the Vault

`gruth13:` I am sorry, but I do not allow just anyone to wander these halls. I am responsible for the safety of all who live here and I must exercise caution. However, I will look for this geck, and if I find it, I will let you know.

`gruth14:` I am sorry, but I do not allow just anyone to wander these halls. I am responsible for the safety of all who live here and I must exercise caution.
*Same refusal, without the offer to help — a slightly colder version of gruth13.*

## Weighing Trust
*The player offers to help him first, in exchange for being let in.*

`gruth15:` (Gruthar stares at you intently for a moment.) You would be interested in helping us? Yes, I sense little evil in you. Very well, I shall place my trust in you.

`gruth16:` (Gruthar stares at you intently for a moment.) I think not. I can sense the evil in you, human. I cannot risk the lives of those I protect by taking a chance with you.
*The rejection — flat, final, and a little sad rather than angry.*

## The Broken Machine

`gruth17:` There are many machines here, machines built by humans. Deathclaw hands cannot use these machines. However, there is one machine that understands questions. I ask it to run the other machines and it obeys. This machine no longer listens. It will no longer run the other machines. We are running out of food and water. I have ordered raids on the human lands so that we may survive. I am not proud of this and I would put an end to it. If you repair this machine, I will be able to feed my people once again. I will gladly stop the raids. Will you agree to this?

## Accepting the Bargain

`gruth18:` Thank you. The machine is in the vault control center on the third level. If you can repair it, please do so. I am placing my trust in you. Please do not betray it. You are welcome here.

## On Being a Thinking Deathclaw
*A quieter, more philosophical exchange — Gruthar reflecting on what it means to be an intelligent deathclaw.*

`gruth19:` I see... Well, deathclaws are dangerous by nature and great care must be taken when encountering them in the wild. However, I am certain that you have noticed that we are an exception. My pack poses no threat to you or your human communities. We have evolved beyond our base cousins and wish simply to be left alone.

`gruth20:` I have spent many sleepless nights, deep in thought, pondering just such issues. I have finally come to the conclusion that the burdens and responsibilities associated with the gift of intelligence are countless. There are only two choices available to any thinking being. Either accept life as it comes and make the best of it for yourself and others, or simply cease to be. I have chosen to accept the challenges of life. If this makes me a threat to humankind, then I pity the small mind that finds it so...

## Owning Up to the Raids

`gruth21:` (Gruthar pauses and seems to be carefully considering his response to you) I am sorry to say that I ordered the raids on the human lands. I am responsible for the lives of many here. We are running out of food, water, and other supplies. Until I can get the situation corrected, I need to take what I, a deathclaw, cannot ask humans for.

`gruth22:` I am displeased with your decision but I accept it. You may leave, but please return if you reconsider.
*If the player says they need time to think it over.*

## Checking In on the Repair
*Repeat-visit lines once the player has taken on the terminal-repair task, before it's actually fixed.*

`gruth23:` Hello, human. Have you examined the machine?

`gruth24:` I do not understand the workings of such things but I trust you, human. I will wait for your return.
*Said right after the player admits the machine's voice module is broken and they need to go find a replacement part.*

`gruth25:` Hello, human. Have you found the part to fix the machine?
*Checking in again on a later visit, before the part is delivered.*

## The Machine Is Fixed

`gruth26:` You have restored my faith in humans. I thank you for all that you have done for the pack. Is there something that I can do for you in return?

## The GECK, Delivered or Not

`gruth27:` Ah, let me see. [He leaves, then returns a moment later, awkwardly clutching some kind of metallic case in his large claws.] Yes, there was a geck in the vault storage room. It is yours with many thanks.

`gruth28:` Yes, there was a geck in the vault storage room. However, it is missing. I am sorry that I cannot give it to you as a reward for all your generous help.
*If it's no longer there to give.*

## Second Chances
*Greetings on later visits, depending on how a past conversation went.*

`gruth29:` Hello again, human. I hope that you do not intend to play the fool with me.
*If the player played dumb with him before.*

`gruth30:` Greetings, human. Have you reconsidered? Will you help me?
*If the player previously refused to help with the machine.*

`gruth31:` Greetings, friend. Have you examined the machine yet?
*If the player agreed to help but hasn't reported back yet.*

## Provoked to Anger

`gruth32:` I have no quarrel with you, human, and I do not want one. I am trying to deal with you civilly. Please return the favor!

`gruth33:` No. I am leader here, so I decide. If you do not like this, you can return to your human lands!

`gruth34:` I assure you that I was not trying to be funny or toy with you. Please excuse me if I gave you that impression. I would help you if I could.

`gruth35:` (Gruthar emits a guttural series of growls) I may not own this place, human, but it is my home and the home of others who rely on me for their protection. Do not push me to the point that either of us will regret it!
*His sharpest line short of violence — a real warning growl under the words.*

## Farewells and Endings

`gruth36:` Thank you. Please go to the control room and replace the module.

`gruth37:` You are not welcome here at this time. You may leave.
*A cold dismissal.*

`gruth38:` Good-bye.

`gruth39:` Apology accepted, human. Have a nice day!
*Genuinely warmer — he means it.*

## Floats

`gruth41:` Hello, my friend. You have saved the pack and we thank you.
*Ambient greeting once the player has completed the machine-repair questline.*

`gruth42:` Die, treacherous human!
*Hostile float — the player has turned on him or his pack.*

`gruth43:` I hope you are enjoying your stay.
*A friendly ambient aside for a player he considers harmless (low-Intelligence path).*

## The Death of Matt

`gruth40:` Unfortunately, it had to come to this. I allowed him to stay unharmed as long as he presented no threat to the pack. He chose his path. I hope you understand.
*A grim, regretful admission — Gruthar explaining why another vault resident (Matt) is dead.*

---

*End of main dialogue script — 41 recordable lines (`gruth3`–`gruth43`). Tag numbers follow ascending message-ID order, not this document's topical grouping.*

---

## Note: `gruth1`–`gruth2` (Separate Scene)

Two additional Gruthar lines exist outside this dialogue tree, in the scene where Frank Horrigan kills Gruthar. They use the same voice/tag prefix but belong to a different script and a very different moment — Gruthar defiant in the face of his own death, not the diplomat of the lines above. See that scene's own material for context; they're listed here only so the actor knows the full range of the `gruth` tag numbers.

`gruth1:` You tell your so-called President that he will burn for this.

`gruth2:` That may be, but we were created through your experimentation. You gave us life!
