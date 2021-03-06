sub EVENT_SPAWN {
	#:: Create a proximity, 100 units across, 100 units tall, without proximity say
	quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50, $z - 50, $z + 50, 0);
}

sub EVENT_ENTER {
	#:: Match a 18715 - Tattered Note
	if (plugin::check_hasitem($client, 18715)) {
		$client->Message(15,"As you glance about the room, Renic Losaren greets you. 'Why hello there. Are you perhaps a new recruit? If you wish to follow the ways of Karana and become a cleric, read the note in your inventory and hand me your note to start your training.'");
	}
}

sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Welcome, $name.  Please feel at ease here in the Temple of Thunder.  We, the Knights of Thunder, are here to guide and serve.");
	}
	elsif ($text=~/trades/i) {
		quest::say("I thought you might be one who was interested in the various different trades, but which one would suit you? Ahh, alas, it would be better to let you decide for yourself, perhaps you would even like to master them all! That would be quite a feat. Well, lets not get ahead of ourselves, here, take this book. When you have finished reading it, ask me for the [second book], and I shall give it to you. Inside them you will find the most basic recipes for each trade. These recipes are typically used as a base for more advanced crafting, for instance, if you wished to be a smith, one would need to find some ore and smelt it into something usable. Good luck!");
		#:: Give a 51121 - Tradeskill Basics : Volume I
		quest::summonitem(51121);
	}
	elsif ($text=~/second book/i) { 
		quest::say("Here is the second volume of the book you requested, may it serve you well!");
		#:: Give a 51122 - Tradeskill Basics : Volume II
		quest::summonitem(51122);
	}
}

sub EVENT_ITEM {
	#:: Match a 18715 - Tattered Note
	if (plugin::takeItems(18715 => 1)) {
		quest::say("Welcome, friend, to the Temple of Thunder. Here, you can practice your skills and learn the ways of Karana. Take this tunic and wear it with pride, for you are now a Priest of Thunder. Guild Trainer Daedet Losaren will begin your tutoring, see him when you are ready. Once you are ready to begin your hunting training please see Vansted Rohenga, he will assist you in some tasks for your early adventures. Return to me when you have become more experienced in our art, I will be able to further instruct you on how to progress through your early ranks, as well as in some of the various [trades] you will have available for you.");
		#:: Give a 13505 - Old Gray Tunic*
		quest::summonitem(13505);
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(280, 100);	#:: + Knights of Thunder
		quest::faction(221, -100);	#:: - Bloodsabers
		quest::faction(341, 75);	#:: + Priests of Life
		quest::faction(262, 75);	#:: + Guards of Qeynos
		#:: Grant a small amount of experience
		quest::exp(100);
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
