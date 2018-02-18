sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Greetings! I am the operator of this scrapyard. If you have any scrap metal, I would be glad to purchase it from you in loads of four. The Gemchoppers no longer allow me to accept blackbox fragments and micro servos.");
	}
	if ($text=~/princess joleena/i) {
		quest::say("No!! You cannot have my magic Fairie Wing!! I need it. I read somewhere within the great library that the magic wing from a fairie princess will restore my full head of hair. Look at me!! I am bald!! I have no [" . quest::saylink("friends") . "] at all.");
	}
	if ($text=~/friends/i) {
		quest::say("Oh. You are just saying that so you can get my fairie wing. I will make you a deal. I cannot rely on this wing forever. I will trade it with you if you could get me a case of hair tonic. If you are a true friend you [" . quest::saylink("will fetch the hair tonic") . "] for me.");
	}
	if ($text=~/will fetch the hair tonic/i) {
		quest::say("Great!! Here you go, my friend. Take this crate and within you shall fill each slot with hair tonic. When all are combined within the crate, return it to me for your wing. I am not sure what the tonic was or where I got it. There is some writing on the crate, but I could not identify it.");
		#:: Give a 17979 - Crate for Tonics
		quest::summonitem(17979);
		#:: Ding!
		quest::ding();
	}
}

sub EVENT_ITEM {
	#:: Turn in for the Scrap Metal Quest - Scrap Metal x4
	if (plugin::check_handin(\%itemcount, 13198=> 4)) {
		quest::say("Grand! We always need more scraps to melt down. Here you are, then... Some coins for supporting Ak'Anon and a salvaged item from the scrapyard.");
		#:: Randomly choose one of various rusty weapons, gnome glow rod, and Tinmizer's Stupendous Contraption
		quest::summonitem(quest::ChooseRandom(5013,5013,5013,5014,5014,5014,5015,5015,5015,5016,5016,5016,5019,5019,5019,5020,5020,5020,12340,12340,17033));
		#:: Give a little xp
		quest::exp(1000);
		#:: Ding!
		quest::ding();
		#:: Set faction
		quest::faction(115,3); 		#:: + Gem Cutters
		quest::faction(210,3); 		#:: + Merchants of Ak'Anon
		quest::faction(176,3); 		#:: + King Ak'Anon
		quest::faction(71,-3); 		#:: - Dark Reflection
		quest::faction(39,-3); 		#:: - Clan Grikbar
		quest::givecash(4,5,1,1);	#:: Give a small amount of cash
	}
	#:: Turn in for the Aid Fimli Quest (POP) Bundle of Super Conductive Wires, Gold Tipped Boar Horn, Shard of Pure Energy, Silicorrosive Grease
	#if (plugin::check_handin(\%itemcount, 9426 => 1, 28618 => 1, 29906 =>1, 28165 +>1)) {
		#quest::say("I've been waiting for those.  Thank you, please take this!");
		#:: 15980 - Note to Fimli
		#quest::summonitem(15980); 
		#:: Ding!
		#quest::ding();
	#:: Turn in for the Rain Caller Quest - Crate of Tonic
	if (plugin::check_handin(\%itemcount, 12336 => 1)) {
		quest::say("Huzzah!! You are my friend. Now you can take my old toupee and get it repaired. Just go to Freeport and ask Ping to [repair the toupee]. Hey!! You know what? He is the guy who sells the hair tonic!! I remember now. Well,.. Get my toupee repaired and I will give you the fairie wing.");
		#:: 12337 - Tattered Toupee
		quest::summonitem(12337); 
		#:: Ding!
		quest::ding();
	}
	#:: Turn in for the Rain Caller Quest - Mane Attraction
	if (plugin::check_handin(\%itemcount, 12254 => 1)) {
		quest::say("Double Huzzah!! You are a good friend $name. Now mayhaps I shall find myself a wife. Here pal, the fairy wing. I hope it can give you a great head of hair. You need it.");
		#:: 12339 - Glimmering Fairie Wing
		quest::summonitem(12339); 
		#:: Ding!
		quest::ding();
	}
	#:: Turn in for the Duster Models Quest - Scrap Metal(Duster V Scrap Metal) and Scrap Metal (Duster X Scrap Metal)
	if (plugin::check_handin(\%itemcount, 13216 => 1, 13217 =>1)) {
		quest::say("Good. The citizens of Ak'Anon are safe from those little critters. They may have injured someone; that is why they were deactivated. Here is something I found in the scrapyard. I hope you can find a purpose for it.");
		#:: Randomly choose one of Bootstrutter's Framed Pack or Forging Hammer
		quest::summonitem(quest::ChooseRandom(17981, 17981, 6027));
		#:: Give a little xp
		quest::exp(1000);
		#:: Ding!
		quest::ding();
		#:: Set faction
		quest::faction(115,3); 		#:: + Gem Cutters
		quest::faction(210,3); 		#:: + Merchants of Ak'Anon
		quest::faction(176,3); 		#:: + King Ak'Anon
		quest::faction(71,-3); 		#:: - Dark Reflection
		quest::faction(39,-3); 		#:: - Clan Grikbar
	}
	plugin::return_items(\%itemcount);
}
