sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Greetings, fellow fisherman. You must be a fisherman. You have the stench of one. If you are not, might I suggest this new pastime I have heard of? A bath!!");
	}
	if ($text=~/Prexus/i) {
		quest::say("Oh no!! Not another Prexus freak!! Listen up aqua man, if you think a man named Marlin has any chance of giving up fishing, you have got another think coming. Go night diving in the north pond, you might find some bait for your Prexus blessing.");
	}
}
