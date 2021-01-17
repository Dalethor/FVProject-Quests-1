sub EVENT_ITEM {
	#:: Flavor Text
	sub EVENT_AGGRO {
    quest::say("Rele.. ase.. me.. from.. this.. tor.. ment.. ARGH! You will die for entering the domain of the Bloodsabers!! Karana.. help.. me?");
}
	#:: Return unused items
	plugin::returnUnusedItems();
}

sub EVENT_DEATH_COMPLETE {
	quest::say("ARGH!!!!!.. Thank.. you..");
}
