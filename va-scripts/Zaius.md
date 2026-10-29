# Zaius — VA Script
**Character:** Zaius, Mine Foreman, Broken Hills (hczaius)

**Total recordable lines:** 45 (`zaius1`–`zaius45`)

---

> **Direction:** Zaius is a super mutant (older-generation; tough, weathered, pragmatic) who serves as Broken Hills' mine foreman. Gruff but fair. He's a working man — blunt, no-nonsense, with flashes of dry humor. He genuinely cares about Broken Hills and its survival. Gets short-tempered when pressured or disrespected, but is not cruel by nature. Think foreman-who's-seen-it-all, not villain. Maintain consistent gravel and weight across all sessions — he should sound the same whether greeting a stranger or threatening one.

---

## First Meeting / Greetings

`zaius1:` You the new guy in town?

## Low-Intelligence Paths
*Baffled but not hostile — faintly pitying, a little tired.*

`zaius2:` Ummm... Riiiight. Tell you what. Here's a couple of dollars. Head on down to the saloon and get yourself something to drink.

`zaius3:` Can't understand you, pal. Why not head on down to the saloon? Hell, maybe Francis will arm-wrestle with you.

## Quest Introduction — Air Purifier
*Triggered by a friendly or neutral greeting. Straightforward, a little tired of the situation, relieved to maybe have help.*

`zaius4:` Right. Well, I'm Zaius. Now that we're introduced... You any good with your hands? We've got a problem with our air purifier on the lower level of the mine, but we haven't got the parts to fix it or the protective gear to avoid being overwhelmed by the radon gas that's been building up.

## Polite Transition
*Played when the PC greeted him politely: the friendly opener followed by `zaius4`. Already recorded: this take is the original `zaius5` and `zaius4` takes spliced together (2026-10-28), so no new recording is needed.*

`zaius5:` Well, I'll hope that you enjoy your stay here in Broken Hills. Right. Well, I'm Zaius. Now that we're introduced... You any good with your hands? We've got a problem with our air purifier on the lower level of the mine, but we haven't got the parts to fix it or the protective gear to avoid being overwhelmed by the radon gas that's been building up.

## Snarky Greeting Branch
*Responding to a wiseass greeting. Dry, slightly irritated, but he rolls with it — he's dealt with worse.*

`zaius6:` Ha. Ha. Funny. Nothing better than a smart guy to solve a problem.

## Alternative Quest Prompt
*A more direct description of the problem, with more edge — already a little familiar with the PC here.*

`zaius7:` Our air purifier's broken. It's on the bottom level. We've got no parts, and we've got no protective equipment. Without the parts, we can't fix it. Without the protection, the radon gas'll nail us. Are you any good with your hands?

## Repeated Low-Intelligence Encounter
*Recognizes the low-INT PC returning. Mildly exasperated.*

`zaius8:` You again, eh?

`zaius9:` Pal, I already gave you some money. Go bother someone else, eh?

`zaius10:` Hi again. Why not go check out... Umm... The bank in town? I'm sure there are plenty people there who'd love to talk to you.

## Rejection / Quest Choice Branches
*Gentle dismissal when the PC says they can't help.*

`zaius11:` Well, if you ever happen to think of a way, let me know.

*Kicks off the bargaining/commitment loop.*

`zaius12:` Really? Would you do it for me... And, more importantly, for Broken Hills?

## Challenge / Smart-Aleck Escalation
*PC has been insulting Zaius. He turns it around — sardonic, slightly contemptuous but not fully hostile.*

`zaius13:` Izzat so? Well, my brainy friend, why not fix the air purifier down below? You'll need the parts, and you'll need to find a way to breathe the gas. Until you can show me you can do that, I think I'll just assume the only thing smart about you is your mouth.

## Hostile Exit
*PC has called Zaius an idiot twice. He's done. Fully hostile — controlled fury, not screaming; a mutant who could snap this person in half and is choosing not to. Yet.*

`zaius14:` The main problem is that I'm an idiot. I'm repeating this because I don't believe that your asshole just spouted something that sounded like words. Get out of my sight, maggot.

## Aggressive Quest Loop
*Still bristling. Delivers the quest info with a sharp edge and a taunt.*

`zaius15:` Aside from the jerks who keep harassing me, the problem is the air purifier in the mine. It's busted, and we don't have the protective gear to breathe the radon and we don't have the parts to fix it. You can, though, right? Because you're so smart?

## Barter / Reward Negotiation
*Said right after counting out a dollar figure to close the deal. Businesslike. Reused as-is in two other moments — no extra takes needed.*

`zaius16:` How's that sound?

## New Reno Directions / Quest Dispatch
*PC agreed to help for free. Genuinely relieved. The code phrase should land naturally, like reciting something memorized.*

`zaius17:` Great! You'll need the parts, of course. Go to New Reno and look for Renesco. He's got tools lying around the shop. Tell him Zaius sent you. Tell him that I said, "The canary's kicked the bucket." I don't know where to get protective equipment for the gas. I suppose you could go in without any but you'll be hurting. Again, thank you.

## Deferral / Rejection Loop
*Accepts it — a little resigned.*

`zaius18:` No? Well, if you should change your mind, you know where to find me.

## Half-Pay Retainer Dispatch
*Said right after counting out half the payment upfront. Genuine, still trying to help.*

`zaius19:` I'll give you the other half when you're done. Go to New Reno and look for Renesco. He's got tools just lying around his office. He should be able to help you with the parts.

## Firm Barter Limit
*PC has pushed the barter too far. Flat, final.*

`zaius20:` Sorry. That's the limit. Take it or leave it.

## Walking Away From Barter
*PC chose to leave without a deal. Dry, dismissive, not broken up about it.*

`zaius21:` Fine. Leave it, then. No thanks.

## Return Greetings / Status-Dependent Hub
*These play on subsequent visits — which one triggers depends on PC reputation and quest state. Record all; they're short.*

*Warm / high reputation.*

`zaius22:` Hi, friend!

*Cool / low reputation.*

`zaius23:` Oh, good. It's you again.

*Neutral.*

`zaius24:` Howdy.

*After the PC exposed the conspiracy and eliminated the traitors.*

`zaius25:` Y'know, I knew those bastards Franc, Manson, Jacob, and Aileen had it out for us. Well done! So...

*After the PC took the town's ore instead of returning it.*

`zaius26:` I hope you've given some thought to giving the ore back to the town... So...

*After the PC sold the ore — negative outcome.*

`zaius27:` Thanks for selling the ore. It's not like we couldn't use it or anything. So...

*After the PC returned the ore — positive outcome.*

`zaius28:` Thanks so much for returning that ore. You don't know how hard we work for that stuff.

*Generic impatient re-greeting.*

`zaius29:` What do you want now?

## Quest Re-Prompt
*Asks if the PC has reconsidered. Slightly hopeful.*

`zaius30:` You changed your mind about trying to fix the mine yet?

## Progress Check-In
*PC has taken the job; Zaius checks in. Gently urgent.*

`zaius31:` How's it coming? I hope you're going to take care of this soon...

## Delivery Phase — Parts Confirmed
*Plays at two different points in the parts-delivery quest — one recording covers both.*

`zaius32:` You've got the parts? Great... I hope you've got some protective gear. The fumes can take you down.

## Quest Completion Rewards
*The mine is fixed. Genuinely grateful. Warm, relieved.*

*Free-run completion.*

`zaius33:` You've fixed it? Excellent! Say, I know you were doing this for free, but... I couldn't let you do that. So me and the guys got together and got you this. It's a combat shotgun. Good luck. And thank you.

*Agreed retainer completion.*

`zaius34:` You've fixed it? Excellent! As agreed, here's the remainder of what we owe you. Thank you again.

## Impatient Urging
*PC said they're making progress but Zaius pushes back. Firm, anxious.*

`zaius36:` Good, good. Please hurry, though... Our town needs what we get out of here.

## Escalating Reprimand
*Holds his ground, controlled anger. `zaius37` is the male-PC version, `zaius42` the female-PC version ("Mrs." instead of "Mr.") — otherwise identical, record both.*

`zaius37:` Well, I'm sorry, Mr. High and Mighty, but I think that the town's survival might be a little more important. Hurry it up, will you?

`zaius42:` Well, I'm sorry, Mrs. High and Mighty, but I think that the town's survival might be a little more important. Hurry it up, will you?

## Hostile Confrontation
*A cold threat right before combat starts, once things have gone irreversibly wrong. Short, final, no more patience left.*

`zaius35:` You bastard. You're going to die now.

## Quiet Reprimand
*A softer version of the urgency. Quieter plea.*

`zaius38:` Please hurry. The mine is our town's lifeblood.

## Town Directions
*Pointing the PC toward other NPCs.*

`zaius39:` Well, the best person to talk to about that would be Marcus, over at the bank, or Steve, the greeter for the town.

## General Town Status
*A brief, measured answer. Cautiously optimistic.*

`zaius40:` I'd have to say they're all right. Still... They could always be better.

## Mutant-Human Coexistence
*Reflects on the town's unusual situation — more contemplative here. The line is long; let the complexity breathe.*

`zaius41:` Well, as the mutants are not only getting old and senile -- the gas keeps them young, or something -- I'd have to say things are pretty good. I mean, we don't want to kill everyone, and as far as I can tell, the humans don't think too poorly of us. 'Course, that's not including the humans from the other places around here... Now those are some bastards.

## Secret Tunnel / Conspiracy Quest
*Late-game branch. The PC found a note implicating Zaius in deaths in the tunnels beneath Broken Hills. Defensive but not guilty — he's been trying to contain a conspiracy, not run one.*

*Initial confrontation.*

`zaius43:` Hey, I just received the note. Go talk to Francis about it, all right? He's the one who wrote it.

*Explaining himself.*

`zaius44:` No! We're just protecting ourselves from the conspiracy. Marcus believes in law and evidence, and even though he knows these people are dangerous, he doesn't know who they are- and he's too honorable to plant evidence. My part is keeping Francis restrained from all-out revenge.

*Resolution / aftermath.*

`zaius45:` I knew Francis couldn't handle exposure. He knew the risks of what he did, but I guess he didn't figure on ever being caught. He'll be all right eventually. I hope the same will be true of Broken Hills.

---

*End of script*
