sub EVENT_SPAWN {
	#:: Create a timer to trigger every 5 seconds
	quest::settimer("spar1",5);
}

sub EVENT_TIMER {
	#:: Match "Kungfu" every five seconds
	if ($timer eq "spar1") {
	quest::doanim(quest::ChooseRandom (1,5,6,7,11,30,45,46,47));
	}
}
