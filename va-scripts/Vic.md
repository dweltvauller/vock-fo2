# Vic — VA Script
**Character:** Vic, the Den's Radio Repairman (recruitable companion)

**Total recordable lines:** 210 (`vic1`–`vic210`)

---

> **Direction:** Vic is an older, gruff-but-warm tinkerer, a former merchant held as a slave in the Den by Metzger and forced to fix a radio he'll never actually finish on his own. He's self-deprecating about his age and skill ("this old fart"), endlessly good-natured once free, and calls the PC "Boss" constantly once he joins the party. He turns anxious and insecure whenever he thinks he might be left behind or judged unfit to travel. Weathered, folksy voice — an old mechanic who's seen better days but never lost his humor.

---

## Imprisoned — First Meeting
*Two variants, depending on whether the PC has a slaver reputation.*

`vic1:` Would you tell him I can't... wait. Who are you? You're not a slaver. What are you doing here?

`vic21:` Would you tell him I can't fix this without the parts. I don't know... wait. Who are you? Some new recruit? He didn't send you here to rough me up again did he? It's not going to make any difference. I can't fix it here.

## Explaining Metzger's Threat
*After the PC introduces themselves.*

`vic2:` Metzger's still quite upset with me, even though we fixed his darn radio. He's threatening to sell me off! I'll do anything you ask if you can get me out of this mess.

## Asking to Be Freed First
*Vic won't commit to helping until the PC gets him out.*

`vic14:` Yeah, I can probably help you, but you've got to get me out of here first.

`vic15:` I told you. If you can get me out of here, I'll help you with anything you want.

## Wants Out, Radio's the Holdup
*Alternate framing of the setup, reached from a different opening line.*

`vic22:` Wow! You'd do that for me? I'd do anything if you could get me out this mess. Only problem is that Metzger's got me locked up here until I fix this radio and I don't have the parts I need.

## Why He's Locked Up
*Reached when the PC asks directly why Vic's confined.*

`vic23:` It's a long story. I guess you could say that Metzger's keeping me here until I fix this darn radio. The crystal's shot and I don't have any spare parts. How does he expect me to fix it?

## Returning Before the Radio's Fixed

`vic3:` Oh, hi again. This darn radio isn't going to repair itself. How does he expect me to fix it?

## Needs Parts From His Old Shack
*Two variants of the same explanation, reached from different dialogue paths.*

`vic4:` I know I can do it, I just need some spare parts. There is an old radio in my shack back in Klamath that has exactly what I need. You been to the Dunton's? My shack's... well, it was just east of their place.

`vic13:` Darn it. That's close, but I need the radio from my shack in Klamath. I know that one has the parts I need.

## Pointing Out the Shack on the Map

`vic12:` It's right here. [pointing to a map]

## Hasn't Been to the Shack Yet

`vic16:` You haven't been by my place yet have you? I really need that radio, Metzger's getting angrier with me by the day.

## Radio Fixed

`vic5:` That's great! I'll have the radio fixed in no time.

## Simple Thanks / Goodbye
*Short generic exit lines.*

`vic6:` Thanks.

`vic19:` Sure thing, Chief!

`vic20:` You got it, Sport!

## Didn't Understand

`vic7:` Pardon? I'm sorry but I don't understand.

## Free and Grateful

`vic8:` Thank you! I'm forever in your debt. What can I do to repay you?

## Getting the Radio Fixed So They Can Reason With Metzger

`vic24:` I've got to get this radio fixed. If you can help me do that, then maybe we can reason with him.

## Talking About Vault 13 / Vault City

`vic9:` Vault 13? There's a Vault City east of here. I trade there, sometimes.

## Asking Him to Join

`vic10:` Sure, I'll join up with you! This old fart has one big adventure left in him. I'm sure of it! I'm pretty good at repairing things too, despite what Metzger says.

## Declining to Join — Party's Full
*Six variants, chosen by the PC's Charisma and whether Vic's currently staying with Mom.*

`vic27:` I would if I could, but you're just not looking good. I'd only be a burden. Now that Mom's gone, I think I'll just head out. Don't know where... maybe we'll see each other again. Thank you for everything you've done for me.

`vic28:` I would if I could, but you're just not looking good. Looks like you can barely take care of yourself. I'd only be a burden. I'll just wait here, Mom's cooking reminds me of my ex-wife...

`vic29:` I would, honest. I'd do almost anything for you. It's just that you don't look like you're in any shape to lead anyone. I'd only be a burden. I'll just head over to Mom's, in a bit... until you can work things out. I haven't had her home cooking for a long time.

`vic30:` Sorry, Boss. Looks like you're pretty crowded. Now that Mom's gone, I think I'll just head out. Don't know where... maybe we'll see each other again. Thank you for everything you've done for me.

`vic31:` You're looking a bit crowded, Boss. I'll just wait here for you until you've worked things out. Mom's cooking reminds me of my ex-wife... not sure if that's a good thing or bad thing...

`vic32:` I would love to, Boss. It's just that you don't look like you have any more room. I'll just head over to Mom's. I haven't been there in a while. Just come get me if you find some room for me.

## Staying at Mom's, Never Joined the Party
*Reached if the PC talks to Vic while he's staying at Mom's, having never recruited him.*

`vic25:` Why'd you kill poor Mom... I guess you had your reasons... I'm sorry, Boss. It's not my place to question you. This is a pretty bad town. I'm sure she did something pretty bad.

`vic26:` Hey, Boss. Thanks for getting me out of that mess with Metzger. You need anything? Mom's been kind enough to feed me while you've been gone. I help her around the place...

## Vault City Directions

`vic11:` Vault City is east of here. I'll point it out on that map of yours.

## Ed the Brahmin Dealer

`vic17:` Oh, yeah. I remember that. I bought that from Ed. He's a brahmin dealer over in Vault City.

`vic18:` Water Flask? Oh, wait. Yea, I had a few dozen of'm. Sold pretty well. I got'm from Ed, a brahmin dealer over in Vault City.

`vic33:` Ed's over at Vault City. He's a Brahmin Dealer. He was just one of my many suppliers. Vault City's not too far from here.

`vic34:` I told you, it's over here. [Vic points to a location on your Pip-Boy 2000.]

## Impatient While Still Locked Up
*Ambient floats — Vic grumbling to himself while imprisoned, before the PC frees him.*

`vic117:` You think you can help me out?

`vic118:` Metzger still won't let me leave.

`vic119:` I can't take much more of this.

`vic120:` I'll do anything for you if you help me.

`vic121:` I'll earn back any expenses you may incur!

## Where Ed Is / Vault City Reminders
*Party-menu question answers about Ed and Vault City.*

`vic83:` From Ed. He's a brahmin dealer over in Vault City. You been there before? Let me show you on that map thing of yours.

`vic199:` Vault City. Here. Let me show you on that fancy map thing of yours.

`vic84:` He should be around here somewhere.

`vic85:` Vault City. Check that fancy map thing of yours.

## Party Menu — Healing Status
*Vic reports his condition after the PC heals him.*

`vic35:` Fully healed, Boss. Anything else?

`vic36:` Almost perfect condition, Boss.

`vic37:` I'm mostly healed up, Boss, but I've been better.

`vic38:` I tried, Boss, but I'm not doing so hot. I'll do what I can though.

## Party Menu — Wait Here
*One plays at random.*

`vic39:` Whatever you say, Boss.

`vic40:` Here? Right here? Okay, you're the Boss.

`vic41:` Right. I'll stay here until you come back, Boss. You will come back, right?

`vic42:` As long as you want. I'm not going anywhere.

`vic43:` Of course, Boss.

## Party Menu — Put Your Weapon Away
*One plays at random.*

`vic44:` If you say so.

`vic45:` Good call Boss.

`vic46:` Great thinking, Boss.

`vic47:` Sure, Boss. Anything else?

`vic48:` Away it is, Boss.

`vic49:` No problem, Boss.

`vic50:` Done, Boss.

## Party Menu — Stay Close
*One plays at random.*

`vic51:` Sure, Boss.

`vic52:` Close it is, Boss.

`vic53:` You know best, Boss.

`vic54:` I'm right behind ya, Boss.

`vic55:` Like glue, Boss.

`vic56:` If you say so, Boss.

`vic57:` Oh. Okay, Boss.

## Party Menu — Don't Get Too Far
*One plays at random.*

`vic58:` OK, I'll keep my distance, but not too far, Boss.

`vic59:` Okay, I won't, Boss.

`vic60:` I'll just stay back a little then, Boss.

`vic61:` Sure, Boss.

## Party Menu — Spread Out
*One plays at random.*

`vic62:` Right Boss. I'll hang way back.

`vic63:` What ever you say, Boss.

`vic64:` There you go, Boss.

`vic65:` Standing back, Boss.

`vic66:` Backing away, Boss.

`vic67:` Spreading out, Boss.

`vic68:` Okay, Boss.

## Rejoining — Party's Full

`vic69:` Uh, Boss? You seem a bit crowded. I'll just keep waiting here for ya.

## Rejoining — Frightened by the PC
*Low-Charisma PC.*

`vic198:` You're scaring me, Boss. What's happened to you? You look... well, scary. I think I'll just hang out here for a while...

## Rejoining — Happy to Be Back
*One plays at random.*

`vic70:` You bet, Boss!

`vic71:` Darn right I will, Boss.

`vic72:` Sure thing, Boss.

`vic73:` Ready to go when you are, Boss.

`vic74:` Great! Let's go.

`vic75:` Great!

`vic76:` You're the best, Boss!

`vic77:` You won't be disappointed. No more mistakes!

`vic78:` I'll be careful this time, don't you worry!

`vic79:` I knew you would forgive me for that... um. So, uh, Boss. What's the plan?

`vic80:` I won't let you down, Boss!

`vic81:` You're super, Boss!

`vic82:` I knew I wasn't too old for this. Those were just bad odds! Right, Boss?

## Party Menu — Questions Greeting
*One plays at random.*

`vic86:` Sure, Boss.

`vic87:` Ask anything, Boss.

`vic88:` I'll help you if I can, Boss.

`vic89:` I'm not in trouble am I, Boss?

`vic90:` Did I do something wrong, Boss?

`vic91:` Of course.

## Party Menu — Standard Greeting
*One plays at random.*

`vic92:` What'll we do now, Boss?

`vic93:` What's the plan, Boss?

`vic94:` Doing my best, Boss.

`vic95:` What can I do for you, Boss?

`vic96:` Change of plans, Boss?

`vic97:` Different strategy, Boss?

## Crippled
*One plays at random.*

`vic98:` Boss, they got me good. You've got to get me to a doctor. I don't know if I can back you up anymore.

`vic99:` I need a doctor, Boss. I'm really messed up. I don't know if I can fight with you anymore.

`vic100:` Boss, I'm really messed up. You got to get Lenny to check me out.

## Waiting For the PC
*One plays at random.*

`vic101:` Hey, Boss. You want me to join up with you now?

`vic102:` Hey, Boss. I don't mind waiting for you. I'm a real patient man.

`vic103:` We joining up again, Boss? I'll try harder.

`vic104:` I was afraid you might not come back. It sure is nice to see you again, Boss.

`vic105:` You looking for company again?

`vic106:` I'm ready to go, Boss.

`vic107:` I knew you wouldn't leave me.

`vic108:` Need some back up?

`vic109:` Need something repaired, don't you? I'm your man, Boss!

`vic110:` Don't worry, Boss. Sulik and I'll get along, honest.

`vic200:` Let's go.

`vic201:` Stay here. I'll be right back.

`vic202:` Me go.

## Party Menu — Remove Armor
*One plays at random.*

`vic111:` What? Uh... okay, Boss. If you say so.

`vic112:` Can I put something else on, Boss? I'm a little worried.

`vic113:` Okay... you're not going to leave me here... Are you, Boss?

`vic114:` But... I mean... Of course, Boss. Coming right off.

## Best Weapon

`vic115:` Well, Boss... I'm pretty good with small arms. I can handle almost any rifle, shotgun, and most small-medium pistols. I 'can' use knives. I've also got a pretty good throwing arm, but my aim's not the best in the world... actually, it's pretty horrible. Sorry, Boss. I'm really trying to get better.

`vic116:` Like I said, Boss, I prefer small arms. I can handle almost any rifle, shotgun, and most of those small-medium pistols. If we're really in a pinch I can try using a knife or even thrown weapons.

## Other Weapons He Can Use

`vic203:` I 'can' use knives and I've got a pretty good throwing arm, but... my aim's not the best in the world. Actually it's pretty horrible. Sorry, Boss. I'm really trying to get better.

`vic204:` Like I said, Boss. Knives and I've got pretty good throwing arm... I just miss a lot.

## Hostile
*One plays at random.*

`vic122:` I've had it up to here!

`vic123:` I'm going to rip your darn head off! No one hurts my family!

## Being Pushed
*One plays at random.*

`vic124:` Over here?

`vic125:` This better Boss?

`vic126:` How 'bout here?

`vic127:` Yes Boss.

`vic128:` What?

`vic129:` Where we going?

`vic130:` We leaving Boss?

`vic131:` I'm moving.

`vic132:` Sorry Boss.

`vic133:` Better?

`vic134:` Ooof.

`vic135:` How's this Boss?

`vic136:` I'll stand over here.

`vic137:` I'll just move over here now.

## Hurt / Crippled Reaction
*One plays at random.*

`vic138:` Boss! I'm not doing so well here.

`vic139:` I need a doctor.

`vic140:` Oh, boy. This really hurts.

`vic141:` Ow!

`vic142:` Ouch.

`vic143:` Dang it.

`vic144:` Medic?

`vic145:` I'm hanging in there... barely.

## Ambient — Vault City
*One plays at random.*

`vic146:` I never liked this place.

`vic147:` Why is this place so clean?

`vic148:` Do you smell something, Boss?

## Ambient — Klamath
*One plays at random.*

`vic149:` You know, Boss. I don't think I'll be coming back here when we're through. I can no longer call it home.

`vic150:` It sure is a lot dirtier than I remember.

`vic151:` We're not staying here long, are we Boss?

## Ambient — His Old Place in Klamath
*Plays instead of the general Klamath lines when Vic's near his old shack.*

`vic160:` Ah, a sight for sore eyes. This is... was my place, but I guess you knew that. Right, Boss?

## Ambient — the Den
*One plays at random.*

`vic152:` This place'll never change.

`vic153:` Boss, I'm not going to miss this place.

`vic154:` Thanks again for getting me out of this place, Boss.

`vic155:` I really owe you one, Boss.

## Ambient — New Reno
*One plays at random.*

`vic156:` Wow, this place sure has changed.

`vic157:` I haven't been here in ages.

`vic158:` I'm going to retire here.

`vic159:` I could open a repair shop around here.

## Ambient — Reacting to a Companion
*Sulik or one of the dogs being in the party.*

`vic161:` Sulik, don't you be looking at me like that.

`vic162:` Boss, Sulik's glaring at me again.

`vic163:` Nice pooch.

## Ambient — Waiting
*One plays at random.*

`vic164:` La de da...

`vic165:` Ho hum.

`vic166:` Waiting for the Boss...

`vic167:` I'm waiting for the Boss.

`vic168:` Just waiting.

`vic169:` The Boss sure wouldn't leave me behind...

`vic170:` Knock Knock... who's there... wait. How'd that go...

`vic171:` Still waiting.

`vic172:` What's that smell?

`vic173:` Anything to repair around here?

`vic174:` Here I am... waiting for the Boss.

`vic175:` An old man like me, wasting away his talents, just standing here.

`vic176:` I sure wish I had a stick of gum... it's been decades.

`vic177:` I need to get out of the relic business... nothing but trouble.

`vic178:` Why is waiting so tiring...

## Reacting to Healing
*One plays at random.*

`vic179:` Uh, thanks, Boss.

`vic180:` Thanks.

`vic181:` You sure you know what you're doing?

`vic182:` Can't we just rest instead?

`vic183:` Should we make camp?

`vic184:` Am I that bad off?

## Reacting to Drugs
*One plays at random.*

`vic185:` Not too much, Boss.

`vic186:` If you insist, Boss.

`vic187:` Boss, my head's not going to explode, is it?

`vic188:` Boss, I think I'm starting to like that stuff.

`vic189:` I'm feeling a bit funny, Boss.

`vic190:` You sure you have enough of that to spare.

`vic191:` Sure, Boss. I'll take some.

`vic192:` Thanks, Boss.

`vic193:` Not bad.

## Heading Back to Mom's

`vic194:` I'm a bit hungry at the moment. We'll talk again at Mom's.

## NPC-Info — Hurt, Radiated, or Poisoned

`vic195:` I feel like I broke a limb, Boss. You better have a look.

`vic196:` I feel like I am burning up, Boss. You better have a look.

`vic197:` I feel like I have been poisoned, Boss. You better have a look.

## Cat's Paw (New Reno)

*Comes back from a room at the Cat's Paw, the New Reno brothel, after a session with one of the girls. Floats over his head.*

`vic206:` Wow.

*The player comes back from a room at the Cat's Paw.*

`vic205:` Way to go, Boss! Ain't had sex myself in a loooooong time.

*Another party member comes back from a room at the Cat's Paw. One plays at random, floating over the head.*

`vic207:` *whistles*

`vic208:` *clap clap clap*

`vic209:` Way to go!

`vic210:` Wahoo.

---

*End of script*
