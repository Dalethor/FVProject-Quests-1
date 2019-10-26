sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Greetings, $class! Join in the [celebration]! Have a few drinks. Alas, there are no [Tumpy Tonics], $name");
	}
	if ($text=~/celebration/i) {
		quest::say("The Freeport Militia now has a bar to themselves. Luckily, it is not this one. Ahh... I tell you, I just don't feel up to much right now. I have had so much grog, my great grandma could best me!");
	}
	if ($text=~/ariska/i) {
		quest::say("Ariska Zimel was my best friend. He and I learned our knowledge of metal from such places as Halas and Kaladim. When he disappeared, it seemed to involve foul play. He must be alive somewhere in the city. I pray this is not the work of [Pietro Zarn].");
	}
	if ($text=~/pietro zarn/i) {
		quest::say("While we were traveling through the Lavastorm Mountains, we happened upon a caravan. They wore emblems in honor of the evil god, Innoruuk. They did not see us, but we saw them. And most importantly of all, Ariska saw the apparent leader's sword. It was glowing with great energy. Suddenly, the evil knights were in a battle. The knights gave chase, leaving their camp unattended. The knight who owned the sword left it behind, opting to fight with another, leading me to believe it was not his to begin with. It was at this point that Ariska ran down and grabbed the sword. A few weeks later, we were to learn that the knight was a powerful man by the name of Pietro Zarn and that he was looking for a sword stolen from him. He called it .. Soulfire. I believe Zarn must have finally found Ariska.");
	}
	if ($text=~/tumpy tonics/i) {
		quest::say("Ah a tumpy tonic, good drink indeed. They are made. Lets see if I can rememeber how to make them.  Ahh yes, ye take a kiola nut and stir it with water, wait a while and ya got it.  If you plan to make some then please by all means bring me one to try as I sure do miss them.");
	}
}

sub EVENT_ITEM {
	#:: Match a 18818 - Tattered Flier
	if (plugin::takeItems(18818 => 1)) {
		quest::say("This used to be hanging in Zimel's Blades. It is the price list. It is badly faded though. There was a fire in Zimel's Blades and I was on the scene just afterward. I did not see this hanging. I wonder who took it . . . Hmmmm.. oh, yes.. the markings on the list! It is a code! Here. I will fill it in. Read it. You probably do not even know who [Ariska] is.");
		#:: Give item 18818 - Tattered Flier
		quest::summonitem(18818);
		#:: Give a small amount of xp
		quest::exp(15);
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(229,1); 		#:: + Coalition of Trade Folk
		quest::faction(336,1); 		#:: + Coalition of Tradefolk Underground
		quest::faction(281,1); 		#:: + Knights of Truth
		quest::faction(291,1); 		#:: + Merchants of Qeynos
	}
	#:: Match four 12114 - Trumpy Tonic
	if (plugin::takeItems(12114 => 4)) {
		quest::say("Ahh! I missed those. I was just telling myself the other... Uh oh! I have to use the little dwarf's facilities. Excuse me.' ");
		#:: Give a small amount of xp
		quest::exp(60);
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(229,4); 		#:: + Coalition of Trade Folk
		quest::faction(336,4); 		#:: + Coalition of Tradefolk Underground
		quest::faction(281,4); 		#:: + Knights of Truth
		quest::faction(291,4); 		#:: + Merchants of Qeynos
		#:: Create a hash for storing cash - 200 to 400cp
		my %cash = plugin::RandomCash(200,400);
		#:: Grant a random cash reward
		quest::givecash($cash{copper},$cash{silver},$cash{gold},$cash{platinum});
	}
	#:: Match three 12114 - Trumpy Tonic
	if (plugin::takeItems(12114 => 3)) {
		quest::say("Ahh! I missed those. I was just telling myself the other... Uh oh! I have to use the little dwarf's facilities. Excuse me.");
		#:: Give a small amount of xp
		quest::exp(45);
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(229,3); 		#:: + Coalition of Trade Folk
		quest::faction(336,3); 		#:: + Coalition of Tradefolk Underground
		quest::faction(281,3); 		#:: + Knights of Truth
		quest::faction(291,3); 		#:: + Merchants of Qeynos
		#:: Create a hash for storing cash - 100 to 300cp
		my %cash = plugin::RandomCash(100,300);
		#:: Grant a random cash reward
		quest::givecash($cash{copper},$cash{silver},$cash{gold},$cash{platinum});	
	}	
	#:: Match two 12114 - Trumpy Tonic
	if (plugin::takeItems(12114 => 2)) {
		quest::say("Ahh! I missed those. I was just telling myself the other... Uh oh! I have to use the little dwarf's facilities. Excuse me. ");
		#:: Give a small amount of xp
		quest::exp(30);
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(229,2); 		#:: + Coalition of Trade Folk
		quest::faction(336,2); 		#:: + Coalition of Tradefolk Underground
		quest::faction(281,2); 		#:: + Knights of Truth
		quest::faction(291,2); 		#:: + Merchants of Qeynos
		#:: Create a hash for storing cash - 50 to 200cp
		my %cash = plugin::RandomCash(50,200);
		#:: Grant a random cash reward
		quest::givecash($cash{copper},$cash{silver},$cash{gold},$cash{platinum});	
	}	
	#:: Match a 12114 - Trumpy Tonic
	if (plugin::takeItems(12114 => 1)) {
		quest::say("Ahh! I missed those. I was just telling myself the other... Uh oh! I have to use the little dwarf's facilities. Excuse me.");
		#:: Give a small amount of xp
		quest::exp(15);
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(229,1); 		#:: + Coalition of Trade Folk
		quest::faction(336,1); 		#:: + Coalition of Tradefolk Underground
		quest::faction(281,1); 		#:: + Knights of Truth
		quest::faction(291,1); 		#:: + Merchants of Qeynos
		#:: Create a hash for storing cash - 1 to 100cp
		my %cash = plugin::RandomCash(1,100);
		#:: Grant a random cash reward
		quest::givecash($cash{copper},$cash{silver},$cash{gold},$cash{platinum});
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
