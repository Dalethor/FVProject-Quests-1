sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Welcome back, $name. Why don't you purchase a few things before you head out into the tundra again?");
	}
}

sub EVENT_ITEM {
	#:: Return unused items
	plugin::returnUnusedItems();
}
