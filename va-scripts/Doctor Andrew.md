# Doctor Andrew — VA Script
**Character:** "Doctor" Andrew, unlicensed medic running the Auto-Doc, Vault City

**Total recordable lines:** 60 (`andr1`–`andr60`)

---

> **Direction:** Andrew isn't really a doctor — he operates a loaner Auto-Doc ("the ol' Doctor") out of a back room and charges for the privilege. Scruffy, folksy, a bit of a huckster, but not malicious: he genuinely thinks the machine mostly works, and gets nervous when it doesn't. Casual grammar throughout ("gonna," "ain't," "ol'," dropped g's). Warm and eager when there's money on the table, sheepish when the autodoc misbehaves, and morbidly matter-of-fact during the botched-surgery lines. Middle-aged male voice, backwoods/rural cadence.

---

## Greeting — Injury Assessment
*His opening line, picked by how hurt the player looks. `andr5` is for a player who isn't hurt.*

`andr1:` Looks like you've seen some fighting, friend. You here to get patched up?

`andr2:` Whoa... looks like you've seen some serious action, friend. You here to get patched up?

`andr3:` Whoa... looks like you've been in some heavy fighting, friend. You here to get patched up?

`andr4:` Holy...! You're bleeding all over the floor! You here to get patched up?

`andr5:` You here to get patched up?

## Healing Cost Quote
*The player asks to be healed. He writes the price down instead of saying it, so no number is spoken. `andr7` is for when the Auto-Doc is acting up.*

`andr6:` All right... from the looks of it, it's gonna be pricey. You got the cash, then you're good to go.

`andr7:` All right... from the looks of it, it's gonna be pricey. You got the cash, then you're good to go. No guarantees with the ol' Doc in the back room, of course...

## Healing Accepted — Self
*The player pays and agrees to be healed. `andr56` is for when the player talked the price down; `andr8` is for when they paid in full.*

`andr56:` Well... all right. That sounds fair. Let's get to it, then. I'll just hook you up to the ol' Doctor here... slip your arms into the slots there, and I'll tighten the braces and secure the clamps...

`andr8:` Let's get to it, then. I'll just hook you up to the ol' Doctor here... slip your arms into the slots there, and I'll tighten the braces and secure the clamps...

## Healing Successful — Self
*The Auto-Doc works.*

`andr9:` All right! Knew the ol' Doctor wouldn't let me down.

## Bonus Ride
*The player isn't hurt but wants a ride in the Auto-Doc anyway. Andrew's wary.*

`andr10:` Uh, well now, that might not be the safest thing for you, friend. Seems like you already took a few trips in the ol' Doctor from the way you talk. But if you want to...

`andr11:` Uh... how you feel? Any better? Any worse?

## Repeat Ride — Outcome
*The player rides again after he warned them.*

`andr12:` Uh, well, I warned you...

`andr13:` Uh-oh. Looks like the ol' Doctor took a pound of flesh this time.

## Refuses Robobrain
*The player asks him to heal their robot companion.*

`andr14:` Well, now I ain't a mechanic, so I can't help that brain whazzit you got with you. Sorry, friend.

## Healing Cost Quote — Whole Party
*The player wants their whole group healed. He writes the price down instead of saying it, so no number is spoken. `andr60` is for when the robot companion is along.*

`andr15:` Well, now... tell you what. One price for the whole lot of you, and we'll call it even. What do you say?

`andr60:` Well, now... tell you what. One price for the whole lot of you, and we'll call it even. The procedure won't work on your robot brain, buddy. What do you say?

## Healing Accepted — Party
*The player pays to heal the group. Also used for the toe removal below. `andr57` is for when the player talked the price down; `andr16` is for when they paid in full.*

`andr57:` Well... all right. That sounds fair. Let's get to it, then. I'll just hook up the ol' Doctor here... Have 'em lay down, and I'll tighten the braces and secure the clamps...

`andr16:` Let's get to it, then. I'll just hook up the ol' Doctor here... Have 'em lay down, and I'll tighten the braces and secure the clamps...

## Healing Successful — Party

`andr17:` There, all stitched up! Knew the ol' Doctor still had some life left in 'im.

## What Is This Place?

`andr18:` This here's the common body shop for Vault City. Me an' the ol' Doctor in the back patch up whoever needs some attention.

## About the Auto-Doc
*`andr19` if the machine is still unreliable; `andr20` if the player has fixed it.*

`andr19:` It can be a little ornery sometimes, but mostly it does its job. Mostly.

`andr20:` Been running a lot smoother lately, which is good. Cuts down on repeat visitors.

## Thanks for the Repair
*The player fixed the Auto-Doc for free.*

`andr21:` Eh... well... thank you very much. That was decent of you to volunteer to fix it like that.

## Demands Payment for Repair
*The player wants money for fixing it. He refuses, knowing the guards are nearby.*

`andr22:` Hell, no! I didn't ask you to fix it, so you don't get jack. I wouldn't push your luck as long as the guards are in earshot.

## Back to Business

`andr23:` So... was there something else I could help you with?

`andr24:` What can I help you with?

## Combat Implants

`andr25:` Combat implants? What do you mean?

`andr26:` Huh. Well, I suppose with help from the ol' Doctor I could do that operation. Course, I'd need some impact plates and dissipaters first... might be able to pry some out of a suit of combat armor, if you can find one.

`andr27:` Heh! You're serious then, I see. Well, now, this is a risky venture. The Citizens find out I'm using the ol' Doctor for this, an' they'll take it right back.

## Implant Menu
*`andr28` the first time; `andr29` on later visits.*

`andr28:` Depends what you want. You want low impact, high impact, low thermal, or high thermal? Each one's got its price tag.

`andr29:` Which one? Low impact, high impact, low thermal, or high thermal?

## Dermal Impact Armor

`andr30:` Standard Dermal Impact Armor takes the kick outta most explosions, punches, kicks, stuff like that. Say, 5%. I'll need to strip some Combat Armor for the plates, and it'll take two days to do the grafts. 7K oughta cover it.

*The upgraded version. `andr31` if the player already has the basic implant; `andr32` if they don't.*

`andr31:` Well, technically, "high impact" is standard Dermal Impact Armor with extra assault-issue impact plates crammed under your skin.

`andr32:` Well, technically, "high impact" is standard Dermal Impact Armor with extra assault-issue impact plates crammed under your skin. So you're gonna need the basic dermal graft first.

`andr33:` Well, I'm gonna need another set of combat armor to get the extra assault plates. Good thing is, the plates'll double the strength of the original grafts, so they'll absorb 10% of the kick. Except...

`andr34:` It'll take a stretch, a few days at least, assuming the ol' Doctor don't mess it up. An' it's expensive. 40K, as I see it. Plus... well, it ain't gonna help your looks none.

*What it'll do to their looks. `andr35` for a female player, `andr36` for a male player.*

`andr35:` All the curves you got are gonna become right angles, near as I can tell. Shoving all those plates into your body means your charisma's gonna take a hit. You still game?

`andr36:` You're gonna be all blocky-looking when I'm done. Shoving all those plates into your body means your charisma's gonna take a hit. You still game?

## Phoenix Armor

`andr37:` The Phoenix Implants take the bite outta fire, lasers and plasma burns... about 5%. I'll need to strip some combat armor for the thermal membranes, and it'll take two days for the operation. 10K oughta cover it.

*The upgraded version. `andr38` if the player already has the basic implant; `andr39` if they don't.*

`andr38:` Well, technically, "high thermal" is standard Phoenix Armor with some thermal dissipaters layered over the membranes.

`andr39:` Well, technically, "high thermal" is standard Phoenix Armor with some thermal dissipaters layered over the membranes. So you're gonna need the basic Phoenix implant graft first.

`andr40:` Well, I'm gonna need to scavenge thermal dissipaters from another set of combat armor. Good thing is, the dissipaters'll double the thermal resistance, absorbing 10% of the bite. But...

`andr41:` It's gonna make your skin blister. Bad. You'll look a lot like that bubbly pre-war packaging material, so don't expect to be getting too many dates after this. And it's gonna cost you. 50K. Up front.

## Implant Surgery — Starting
*The player pays for an implant. `andr59` is for when the player talked the price down; `andr42` is for when they paid in full.*

`andr59:` Well... that sounds fair. All right, let me just bolt you into the ol' Doctor here... hope the anesthesia reservoir ain't clogged again... maybe you better bite down on this piece of brahmin hide just in case.

`andr42:` All right, let me just bolt you into the ol' Doctor here... hope the anesthesia reservoir ain't clogged again... maybe you better bite down on this piece of brahmin hide just in case.

## Implant Surgery — Result
*The player wakes up after the operation. One line per implant.*

`andr44:` Well, they're in, I guess. Uh, about the swelling and soreness, I'm pretty sure that both are just temporary side effects. Oh, that stabbing sensation you feel when you move your arms and legs should fade in a few weeks.

`andr45:` Can you hear me? Whew. I didn't think there was any room left for those impact plates, but I was able to pry a lot of muscle tissue and cartilage out of the way. They're in a jar over there, if you want a souvenir.

`andr46:` Mercy... that was trial and error surgery if I ever saw it. I ended up having to amputate some of your nerve endings... that's the burning and itching sensation you're feeling right now. It'll probably fade in a few weeks.

`andr47:` I hope to heaven you can hear me right now. Look, when you regain feeling in your extremities, you'll feel an incredible itching sensation all over. Don't scratch! If you do, those pus-crusts over the drainage incisions'll burst and leave scars. Give 'em a few weeks to heal, okay?

## Healing Failed
*The player pays for a heal, but the Auto-Doc acts up. `andr58` is for when the player talked the price down; `andr48` is for when they paid in full. Then `andr49`, a bit embarrassed.*

`andr58:` Well... all right. That sounds fair. Let's get to it, then. I'll just hook up the ol' Doctor here... Let me tighten the braces and secure the clamps...

`andr48:` Let's get to it, then. I'll just hook up the ol' Doctor here... Let me tighten the braces and secure the clamps...

`andr49:` Hmmph. Looks like the ol' Doctor's being stubborn again. Piece of junk... still, I was glad I was able to pop the clamps before it started the exploratory surgery routine. Maybe it'll work better next time.

## Refund Demanded
*The player wants their money back after the failed heal.*

`andr50:` Sorry, no guarantees, no refunds. You take your chances. If you got a problem with it, take it up with the guards.

## Mutated Toe Removal
*The player has grown a mutated sixth toe and wants it gone.*

`andr51:` Well, I can try. No guarantees with the ol' Doctor in the back room, of course. It's gonna cost you... and there's no telling if the operation'll take. Might grow back.

`andr52:` Hmmmmm. Five hundred, and we'll call it a deal. I'm not authorized to perform amputations with the Auto-Doc, and it'll be my job if they find out.

*After the operation:*

`andr53:` That little friend of yours should be gone now. I hope. It's hard to squeeze out all of that mutated pus out of the bone marrow. Anyway, here you go.

*If the player asks for another ride in the Auto-Doc afterwards:*

`andr54:` Uh, well, okay... but I warned you last time that it might not be safe.

## Fatal Malfunction
*The Auto-Doc goes badly wrong with the player strapped in. `andr55` as he starts it up, casual; `andr43` a moment later, right after the player screams.*

`andr55:` All right. Here we go.

`andr43:` Uh-oh.

---

Total: 60 lines (`andr1`–`andr60`). Tag numbers follow the game's internal order, not this document's grouping.
