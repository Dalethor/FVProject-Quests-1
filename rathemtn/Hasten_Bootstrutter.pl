sub EVENT_SPAWN {
	#:: Set a timer for four hours
	quest::settimer("HastenDepop",14400);
}

sub EVENT_TIMER {
	#:: Match the four hour timer
	if ($timer eq "HastenDepop") {
		#:: Stop the timer HastenDepop
		quest::stoptimer("HastenDepop");
		#:: Depop and start the spawn point timer
		quest::depop_withtimer();
	}
}

sub EVENT_SAY {
	if ($text=~ /Hail/i) {
		quest::say("Stopped I have done. Greet you I will. What business do we have? Hmm? Speak up!!");
	}
	if ($text=~ /Journeyman Boots/i) {
		quest::say("Journeyman Boots are what you seek? Ha!! I have those upon my feet and disinigrate will they if my life is taken. Extra pair have I and [" . quest::saylink("rare trade") . "] can we make.");
	}
	if ($text=~ /Rare Trade/i) {
		quest::say("I call for three things and Journeyman Boots are yours. I call for a [" . quest::saylink("Shadowed Rapier") . "], call for the [" . quest::saylink("Ring of the Ancients") . "] and call for Gold.. 3250 Gold Coins!! This the trade that I call.");
	}
	if ($text=~ /Shadowed Rapier/i) {
		quest::say("Shadowed Men, foes to all, have appeared. Many lands do they walk. Invisible are they, but items they wield can be seen. Seek them out and return to me a Shadowed Rapier. Return it with haste before 'poof' goes the rapier!! No time to camp have you.");
	}
	if ($text=~ /Ring of the Ancients/i) {
		quest::say("Ancient cyclops do march the land.  Long have they lived and crafted the rings of the ancients.  I must have one and you shall go and fetch one for me.  Seek the lands of the oldest cyclops clans.  Seek the plains. seek the island in tears and search the dunes for there is one who is last.  His clan was blown from the sands.");
	}
}

sub EVENT_ITEM {
	my $tradestate = 0;
	plugin::mq_process_items(\%itemcount);
	#:: Just Rapier
	if (plugin::check_handin(\%itemcount, 7100 => 1)) {
		plugin::mq_process_items(7100 => 1);
		if ($tradestate == 1) {
			if (plugin::check_mq_handin(12268 => 1)) {
				quest::say("Yay, you did it!");
			} else {
				quest::say("You still owe me a Ring!");
			}
		}
		elsif ($tradestate == 0) {
			if (plugin::check_mq_handin(12268 => 1)) {
				quest::say("You still owe me gold!");
			} else {
				quest::say("You still owe me a Ring and gold!");
			}
		}
	}
	#:: Just Ring
	if (plugin::check_handin(\%itemcount, 12268 => 1)) {
		plugin::mq_process_items(12268 => 1);
		if ($tradestate == 1) {
			if (plugin::check_mq_handin(7100 => 1)) {
				quest::say("Yay, you did it!");
			} else {
				quest::say("You still owe me a Rapier!");
			}
		}
		elsif ($tradestate == 0) {
			if (plugin::check_mq_handin(7100 => 1)) {
				quest::say("You still owe me gold!");
			} else {
				quest::say("You still owe me a Rapier and gold!");
			}
		}
	}
	#:: Just Ring and Rapier
	if (plugin::check_handin(\%itemcount, 7100 => 1, 12268 => 1)) {
		plugin::mq_process_items(7100 => 1);
		plugin::mq_process_items(12268 => 1);
		if ($tradestate == 1) {
			quest::say("Yay, you did it!");
		} else {
			quest::say("Now just give me the gold!");
		}
	}
	#:: Just gold and Rapier
	if (plugin::takeItemsCoin(0,0,3250,0, 7100 => 1)) {
		plugin::mq_process_items(7100 => 1);
		if (plugin::check_mq_handin(12268 => 1)) {
			quest::say("Yay, you did it!");
		} else {
			$tradestate = 1;
			quest::say("You still owe me a Ring!");
		}
	}
	#:: Just gold and Ring
	if (plugin::takeItemsCoin(0,0,3250,0, 12268 => 1)) {
		plugin::mq_process_items(12268 => 1);
		if (plugin::check_mq_handin(7100 => 1)) {
			quest::say("Yay, you did it!");
		} else {
			$tradestate = 1;
			quest::say("You still owe me a Rapier!");
		}
	}
	#:: Gold, Ring and Rapier
	if (plugin::takeItemsCoin(0,0,3250,0, 7100 => 1, 12268 => 1)) {
		quest::say("yay, you did it!");
	}
	#:: Just Gold
	if (plugin::takeCoin(0,0,3250,0)) {
		if (plugin::check_mq_handin(12268 => 1, 7100 => 1)) {
			quest::say("Yay, you did it!");
		}
		elsif (plugin::check_mq_handin(12268 => 1)) {
			$tradestate = 1;
			quest::say("You still owe me a Rapier!");
		}
		elsif (plugin::check_mq_handin(7100 => 1)) {
			$tradestate = 1;
			quest::say("You still owe me a Ring!");
		} else {
			$tradestate = 1;
			quest::say("You still owe me a Ring and a Rapier!");
		}
	}
}
