sub EVENT_SPAWN {
	#:: Set up a 50 unit distance
	$x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
}

sub EVENT_ENTER {
	#:: Check for 18724 - Tattered Note
	if (plugin::check_hasitem($client, 18724)) {
		$client->Message(15,"A commanding, yet kind looking Erudite turns towards you as you attempt to get your bearings. 'Do not be startled. I am Gans Paust, Guild Master of the Deepwater Knights and you are to become one of us. Read the note in your inventory and hand it to me when you are ready to begin your training. I look forward to working with you.'");
	}
}

sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::emote("glances at you and hurriedly makes a gesture of religious meaning before you and says, 'Yes, yes, I hereby bless you in the name of Prexus. May your catch be plentiful and your nets never snag. Are there any other fishermen seeking a blessing? I'm very busy.'");
	}
	if ($text=~/your brother/i) {
		quest::say("What? How do you know fo my brother? Ahh I assume Breya told you. He's been gone for quite some time with no word sent on his progress or his wellbeing. I need to find someone to [" . quest::saylink("check on him") . "].");
	}
	if ($text=~/check on him/i) {
		quest::say("Thank you, $name. He's one of our people's most knowledgeable geologists and has left to survey an island out in Erud's Crossing. He was sending monthly reports until two weeks ago when his report never showed up. I'm worried something may have happened to him. Take this note to Yelesom and bring back something to assure me of his safety. A reward fitting a Deepwater Knight shall be yours upon your success..");
		#:: Give item 18173 - Gans's note to Yelesom
		quest::summonitem(18173);
	}
	if ($text=~/trades/i) {
		quest::say("I thought you might be one who was interested in the various different trades, but which one would suit you? Ahh, alas, it would be better to let you decide for yourself, perhaps you would even like to master them all! That would be quite a feat. Well, lets not get ahead of ourselves, here, take this book. When you have finished reading it, ask me for the [" . quest::saylink("second book") . "], and I shall give it to you. Inside them you will find the most basic recipes for each trade. These recipes are typically used as a base for more advanced crafting, for instance, if you wished to be a smith, one would need to find some ore and smelt it into something usable. Good luck!");
		#:: Give item 51121 - Tradeskill Basics : Volume I
		quest::summonitem(51121);
	}
	if ($text=~/trades/i) {
		quest::say("Here is the second volume of the book you requested, may it serve you well!");
		#:: Give item 51122 - Tradeskill Basics : Volume II
		quest::summonitem(51122);
	}
}

sub EVENT_ITEM {
	#:: Match turn in for 18724 - Tattered Note
	if (plugin::check_handin(\%itemcount, 18724 => 1)) {
		quest::say("Yes. welcome friend! Here is your guild tunic. You'll make a fine addition to the Deepwater Knights.  Go see Lumi Stergnon, he will get you started in your studies. Return to me when you have become more experienced in our art, I will be able to further instruct you on how to progress through your early ranks, as well as in some of the various [" . quest::saylink("trades") . "] you will have available to you.");
		#:: Give item 13544 - Old Blue Tunic*
		quest::summonitem(13544);
		#:: Give a small amount of xp
		quest::exp(100);
		#:: Ding!
		quest::ding();
		#:: Set faction
		quest::faction(79,100);		#:: + Deepwater Knights
		quest::faction(145,15);		#:: + High Council of Erudin
		quest::faction(143,-15);	#:: - Heretics
	}
	#:: Match turn in for 1771 - Yelesom's Reports
	if (plugin::check_handin(\%itemcount, 1771 => 1)) {
		quest::say("Excellent! Thank you for checking on my brother, I am glad to hear that he is well.  Here is something that shall help you on your way.");
		#:: Give item 1763 - Midnight Sea Mail Sleeves
		quest::summonitem(1763);
		#:: Give a small amount of xp
		quest::exp(100);
		#:: Ding!
		quest::ding();
	}
	plugin::return_items(\%itemcount);
}
