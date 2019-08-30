sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Sit down and name your poison!  I know we are lacking in originality. but I intend to create some [" . quest::saylink("exotic drinks") . "].");
	}
	if ($text=~/exotic drinks/i) {
		quest::say("Interested in exotic drinks. are we?  I am attempting to create some of these drinks I read about in this book I found. It was called the [" . quest::saylink("Barkeep's Compendium") . "].  I will first need to get my hands on a few [" . quest::saylink("exotic ingredients") . "].");
	}
	if ($text=~/Barkeep's Compendium/i) {
		quest::say("I found the book amongst some garbage littering the ground in Freeport East.  It appears to have been created by an ogre named [" . quest::saylink("Clurg") . "].  I am sure he wants it returned. but I will never part with it.  That is... unless I get a few [" . quest::saylink("exotic ingredients") . "] I need to experiment with.");
	}
	if ($text=~/exotic ingredients/i) {
		quest::say("I desire a [" . quest::saylink("kiola nut") . "]. [" . quest::saylink("Erud's Tonic") . "]. [" . quest::saylink("honey jum") . "] and a [" . quest::saylink("Koalindl fish") . "].  If I could get those. I would no longer need to hold on to the [" . quest::saylink("Barkeep's Compendium") . "].  Whoever returned the ingredients to me could have it!!");
	}
	if ($text=~/kiola nut/i) {
		quest::say("The kiola nut usually grows only in humid territories.  I hear there are some such lands between Qeynos and Erudin.  Some also have been found on the islands of the Ocean of Tears.");
	}
	if ($text=~/Erud's Tonic/i) {
		quest::say("Now that is an ingredient that is hard to obtain.  Found only in the city of Erudin. it is a crime for anyone to attempt to smuggle it out of the city.  If caught. a horrid death is assured. though I hear there is a frequent customer of the taverns of Qeynos who has a way to obtain the forbidden liquid.");
	}
	if ($text=~/honey jum/i) {
		quest::say("Honey jum can be found in the halfling community of Rivervale.  I hear it is used in many of their potions.  I am sure it can be purchased somewhere in Rivervale.  If it is not on the shelf it is surely known by the shopkeeper.");
	}
	if ($text=~/Koalindl fish/i) {
		quest::say("Some rare drinks call for ground up fish. I intend to use the Koalindl fish of Qeynos.  It is said to be magical in nature.  The problem with obtaining them is that you must get them from Jahnda's Pool near the Temple of Life and I hear that the members protect these fish with great ferocity.");
	}
	if ($text=~/Clurg/i) {
		quest::say("I do not know. Ask an ogre. Maybe they have heard of him.");
	}
}

sub EVENT_ITEM {
	#:: Turn in for 13118. 13382, 13952, 13340 -  Erud's Tonic - Koalindl Fish - Honey Jum - Kiola Nut
	if (plugin::check_handin(\%itemcount, 13118 => 1, 13383 => 1, 13952 => 1, 13340 => 1)) {
		quest::say("Now I have every ingredient mentioned in the Barkeep Compendium. Here. You take it. <..click!.> Whoops!! I just closed it. It's magically sealed, I never closed it before. It's useless to you. I have no need for it any longer. Maybe you can return it to [" . quest::saylink("Clurg") . "] for some type of reward.");
		#:: Give item 13379 - Barkeep Compendium
		quest::summonitem(13379);
		#:: Give a small amount of xp
		quest::exp(200);
		#:: Ding!
		quest::ding();
		#:: Give a small amount of cash copper - plat
		quest::givecash(0,0,0,2);
		#:: Set faction
		quest::faction(336,1); 		#:: + Coalition of Tradefolk Underground
		quest::faction(229,1);	 	#:: + Coalition of Trade Folk
		quest::faction(329,1); 		#:: + Carson McCabe
		quest::faction(230,1); 		#:: + Corrupt Qeynos Guards
		quest::faction(330,1); 		#:: + Freeport Militia			
	}
	plugin::return_items(\%itemcount);
}

sub EVENT_SIGNAL {
	quest::say("Thank you, Brunar. You are some kind of fisherman! I better take this down to the storeroom with your earlier catches before it spoils.. hmm.. a little later.");	
 }
