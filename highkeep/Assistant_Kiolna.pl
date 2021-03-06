sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Hello! I am Jaylin's new assistant, Kiolna. If you wish to hand in your keys, please give them to me and I will be happy to assist you! It is a pleasure doing business with you.");
	}
} 

sub EVENT_ITEM {
	#:: Turn in for 12143 - H.K. 102
	if (plugin::takeItems(12143 => 1 )) {
		quest::say("I am sorry to see you check out. Here is all you had in your box. We hope to serve you again. Have a nice day!! Next!");
		#:: Give item 18936 - A Sealed Note *Zimels Letter from Hayle
		quest::summonitem(18936);
		#:: Ding!
		quest::ding();
	}
	#:: Turn in for 12193 - H.K. 106  *Highkeep Strongbox 106
	if (plugin::takeItems(12193 => 1 )) {
		quest::say("I am sorry to see you check out. Here is all you had in your box. We hope to serve you again. Have a nice day!! Next!");
		#:: Give item 13323 - Emerald Shard *Shard of Stormhammer II
		quest::summonitem(13323);
		#:: Give a small amount of xp
		quest::exp(500);
		#:: Ding!
		quest::ding();
		#:: Create a hash for storing cash - 900 to 2000cp
		my %cash = plugin::RandomCash(900,2000);
		#:: Grant a random cash reward
		quest::givecash($cash{copper},$cash{silver},$cash{gold},$cash{platinum});
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
