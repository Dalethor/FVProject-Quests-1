sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Oh, hi.  Listen, um.. $name, was it?  Listen, pal,  I really don't have time for the friendly-friendly, so why don't you just move on?");
	}
	if ($text=~/new dishwasher/i) {
		#:: Match if faction is better than indifferent
		if ($faction < 5) {
			quest::say("Dishwasher, huh?  You must not mind getting your feet wet then, huh?  Well, I do have a job for you.  It seems one of our younger employees got a little nevous around a Deputy and ditched his um..  recent purchase into the river.  We sent the fool after it but ol' [Chomper] got him.  He said he had dropped it off the docks but the currents might have moved it from there.  It should be in an old pouch.  Return the merchandise to me.  Well?  Get going!");
		}
		#:: Match if faction is indifferent
		elsif ($faction == 5) {
			quest::say("You need to prove your dedication to our cause before I can discuss such matters with you.");
		}
		#:: Match if faction is worse than indifferent
		elsif ($faction > 5) {
			quest::say("Oh, hi.  Listen, um.. $name, was it?  Listen, pal.  I really don't have time for the friendly-friendly, so why don't you just move on?");
		}
	}
	if ($text=~/Chomper/i) {
		#:: Match if faction is better than indifferent
		if ($faction < 5) {
			quest::say("Chomper is a big, mean ol' fish.  He looks like a normal fish, but a little bigger, and boy, oh boy, is he mean!");
		}
		#:: Match if faction is indifferent
		elsif ($faction == 5) {
			quest::say("You need to prove your dedication to our cause before I can discuss such matters with you.");
		}
		#:: Match if faction is worse than indifferent
		elsif ($faction > 5) {
			quest::say("Oh, hi.  Listen, um.. $name, was it?  Listen, pal, I really don't have time for the friendly-friendly, so why don't you just move on?");
		}
	}
}

sub EVENT_ITEM {
	#:: Turn in for 13785 - Torn Old Pouch
	if (plugin::takeItems(13785 => 1 )) {
		#:: Match if faction is better than indifferent
		if ($faction < 5) {		
			quest::say("What is this?  The pouch is empty!  Where is the Ruby?!  What do you mean you don't have it?  Oh no.  I bet [Chomper] swallowed it!  Get it back and bring it to me.");
			#:: Ding!
			quest::ding();
			#:: Give a moderate amount of experience
			quest::exp(1500);
			#:: Create a hash for storing cash - 900 to 2000cp
			my %cash = plugin::RandomCash(900,2000);
			#:: Grant a random cash reward
			quest::givecash($cash{copper},$cash{silver},$cash{gold},$cash{platinum});
			#:: Set factions
			quest::faction(241, 5);		#:: + Deeppockets
			quest::faction(223, 5);		#:: + Circle of Unseen Hands
			quest::faction(292, -5);	#:: - Merchants of Rivervale
			quest::faction(329, 5);		#:: + Carson McCabe
			quest::faction(336, 5);		#:: + Coalition of Tradefolk Underground
		}
		#:: Match if faction is worse than indifferent
		elsif ($faction > 5) {
			quest::say("Oh, hi.  Listen, um.. $name, was it?  Listen, pal,  I really don't have time for the friendly-friendly, so why don't you just move on?");
			#:: Return a 13785 - Torn Old Pouch
			quest::summonitem(13785);
		}
	}
	#:: Turn in for 13786 - Large Ruby
	if (plugin::takeItems(13786 => 1 )) {
		#:: Match if faction is better than indifferent
		if ($faction < 5) {		
			quest::say("You found it!  Heh.  Good thing you brought it back bub.  This thing isn't priceless, its worthless but at least you proved you are loyal.  Poor ol' Chomper..");
			#:: Ding!
			quest::ding();
			#:: Give a moderate amount of experience
			quest::exp(1000);
			#:: Create a hash for storing cash - 900 to 2000cp
			my %cash = plugin::RandomCash(1800,4000);
			#:: Grant a random cash reward
			quest::givecash($cash{copper},$cash{silver},$cash{gold},$cash{platinum});
			#:: Set factions
			quest::faction(241, 10);		#:: + Deeppockets
			quest::faction(223, 10);		#:: + Circle of Unseen Hands
			quest::faction(292, -10);	#:: - Merchants of Rivervale
			quest::faction(329, 10);		#:: + Carson McCabe
			quest::faction(336, 10);		#:: + Coalition of Tradefolk Underground
		}
		#:: Match if faction is worse than indifferent
		elsif ($faction > 5) {
			quest::say("Oh, hi.  Listen, um.. $name, was it?  Listen, pal, I really don't have time for the friendly-friendly, so why don't you just move on?");
			#:: Give back a 13786 - Large Ruby
			quest::summonitem(13786);
		}
	}	
	#:: Return unused items
	plugin::returnUnusedItems();
}
