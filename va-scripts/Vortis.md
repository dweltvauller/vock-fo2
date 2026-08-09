# Vortis — VA Script
**Character:** Vortis, owner of the slave pen, NCR Entrance

**Total recordable lines:** 44 (`vort1`–`vort44`)

---

> **Direction:** Vortis is a scrawny, foul-mouthed old slaver who runs a slave pen just outside NCR's gates — technically legal, since NCR only bans slaves *inside* the walls. He's greedy, cynical, and openly contemptuous of "goody two-shoes" idealists, but he warms up fast to anyone who talks or acts like a fellow slaver. Vocal qualities: raspy, wheedling businessman's voice, quick to turn foul-mouthed and threatening when annoyed or crossed. He respects money and toughness above everything else, and gets visibly nervous/aggressive when he thinks he's actually in danger (the guard-call and threat lines should have real menace, not just irritation).

---

## Greetings
*First meeting only. Which one plays depends on whether the PC already has a slaver reputation.*

`vort1:` So what do you want?

*Plays instead of vort1 if the PC is known as a slaver — warm, brotherly.*

`vort2:` Brother, welcome to Vortis' hall. How can I help you?

*Repeat visits — first time back, growing impatience.*

`vort3:` You're starting to annoy me.

*Second time back — explains his business, a little defensive.*

`vort4:` This place is my place and I, Vortis, run an honest and legitimate business no matter what anybody in NCR tells you. Since NCR doesn't allow slaves inside the gates, I mind them for folks who've got business inside.

*Third time back — openly hostile.*

`vort5:` What are you, dense? This is a slave pen. I got licenses for it.

*Triggers instead, on a later visit, if the PC's reputation is very good ("goody two-shoes"). Mocking, dismissive — he's kicking the PC out.*

`vort6:` Oh, look - the goody two-shoes, lollipop kid. Boys, escort this hypocritical paragon of saintly virtue out of my sight!

## Main Hub
*Once past the greeting, the conversation opens here.*

`vort7:` Well?

## Asking About Work
`vort8:` Work? Well... there might be something. You ever hear of the New California Rangers?

## Getting Thrown Out
*Plays when the PC pushes too far or reacts badly to him. Final and dismissive.*

`vort9:` Fuck you. Boys, escort this annoying crud out of my sight.

## Vault 13
`vort10:` Vault 13! Get outta here. Damn place is a myth. Vault 13, my ass.

## GECK
`vort11:` A what? Well, whatever it is, I ain't got it.

## About This Town
`vort12:` New California Republic - nothing but temperance types and merchants. Got a bug about slavers and slavery, but what the hell, it makes my business.

## Asking About Ranger Trouble
`vort13:` Somebody steered you wrong. I don't have no trouble with nobody - especially not no Rangers. I'm all legal, so there ain't nothing on me.

*Plays instead if he's willing to open up about it. Baiting — feeling the PC out for the work offer.*

`vort14:` Yeah, I may have some feelings about the Rangers. You looking for work?

## Asking to Look Around
`vort15:` No, you may not go nosing around, shit-for-brains! This ain't a museum!

## The Ranger Safe-House Job (First Offer)
*Pitches the job — map the Rangers' safe houses up north.*

`vort16:` Well then, you should know some folks see them as a potential problem. It would be extremely useful if we had a map of their safe houses through the north - New Reno, Klamath, wherever. I'd be willing to pay, oh say, $500 for something like that. You think you could get that for me?

*Explains who the Rangers are and what they do. Four-part explanation, delivered as one continuous rant with the PC interjecting between each part — irritated at having to spell it out.*

`vort17:` Let me tell you, then. These Rangers have got it in their heads to wipe out slavery and slavers - by force. They've been creating a lot of trouble for hard working folks.

`vort18:` They work in secret, especially up north.

`vort19:` Jeez, I got to spell this out for you? They raid slavers, drive off the stock, and smuggle 'em down south to NCR lands where slavery's illegal. So you interested?

`vort20:` There is no "and"! You want the job or not?

*PC accepts the job.*

`vort21:` Fine. When you get me a map, I'll be here.

*PC asks where to even find a map.*

`vort22:` How the hell should I know!? If I knew, I'd have it, wouldn't I? Look, there's supposed to be a cell in town. Find them and see what you can do.

## Returning for the Safe-House Job
`vort23:` You're back again. Did you get that map?

## Nagging About the Job
*Plays if the PC brings this up again before finishing it.*

`vort24:` I'm still waiting for you to finish the first job!

*Plays if the job's already been completed some other way.*

`vort25:` Not since you did your job. Thanks.

## Completing the Safe-House Job
`vort26:` Good work. Now you best make yourself scarce, in case those Rangers ever wise up.

## Loitering
*Told to move along after finishing business with him.*

`vort27:` Well don't hang around here, you moron! Somebody'll get suspicious.

## Float — Guards!
*Ambient float, no dialog box. Triggered if the PC lingers near his place at the wrong time and he decides they're a threat.*

`vort42:` What the fuck? Guards! We got an intruder!

## Float — Night Threat
*Ambient float, no dialog box. A warning shout, triggered late at night if the PC gets too close to his door.*

`vort43:` Go in there and I'll blow your head off. Understand?

## Float — Closed for the Night
*Ambient float, no dialog box. Plays if the PC approaches after hours but hasn't crossed the line yet.*

`vort44:` It's late and we're closed. Come back in the morning.

## The Ranger Safe-House Job (Second Offer / Attack)
*A follow-up, more aggressive job pitch. Which line plays depends on whether the PC already has a slaver reputation.*

`vort28:` Good work. One more thing though. You're a slaver, right? How 'bout you lend a hand and wipe out those safe houses for me. I could pay you for the job - say $1000.

*Plays instead if the PC isn't known as a slaver — appeals to their meanness instead.*

`vort29:` Good work. One more thing though. You look like a mean sonuvabith. How 'bout you wipe out those safe houses for me. There's a reward for it - say $1000.

*PC accepts.*

`vort30:` Excellent. Here, let me mark these coordinates on your map thingy. Report back when you're done.

*PC declines.*

`vort31:` Your loss. Now you best make yourself scarce, in case those Rangers ever wise up.

## Returning for the Attack Job
`vort32:` You're back. Did you wipe out the Rangers' safe houses?

## Job Complete — Big Payout
*Genuinely delighted — this is the best news he's heard in a while.*

`vort33:` Really? Hot damn. This is the best news I've heard yet. This will be quite a blow to the Rangers. Good work. Here's your pay. Now you best make yourself scarce, the Rangers in town are sure to be looking for you.

## Refusing to Send Backup
*Plays if the PC asks for extra men to help with the raid and he says no.*

`vort34:` Hell no. I'm not rounding up any guys for this. If you feel you can't handle it, then leave.

## Agreeing to Send Backup
*Plays instead if a Speech check succeeds. He agrees to round up help.*

`vort35:` Well, alright. I think I can round up some boys to aid you in this. They'll meet you on the way. You ready to start now?

## Ready for the Raid
`vort36:` You ready for the raid, or are you here to waste more of my time?

## Asking to Buy Slaves
*Only comes up in a specific side conversation. Dismissive — sends the PC elsewhere.*

`vort37:` Well that's fuckin nice. We don't sell here. Metzger up north in the Den can help you with that.

*Plays if the PC's already tried Metzger and wasn't satisfied. A little needling.*

`vort38:` Well aren't you a picky fuck. You do realize that his stock isn't limited to just the Den, right? He's got his own holding pen where slaves are dropped off.

## Selling the Slaver Camp Location
*Which price plays depends on the PC's general reputation — the "goody two-shoes" surcharge is delivered with a sneer.*

`vort39:` What, do you think you can get whatever the fuck you want for free? $1000. Take it or leave it.

*Plays instead for a PC with a very good reputation. More contemptuous.*

`vort40:` What, do you think you can get whatever the fuck you want for free? Plus, you ooze virtuousness. I don't like that. $2000. Take it or leave it.

*PC pays up. He points out the location on the map.*

`vort41:` [He points on your map the location of the slaver camp.] It's around there. Now what else are you going to waste my time with?

---

*End of script — 44 lines total.*
