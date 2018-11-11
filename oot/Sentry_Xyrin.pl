sub EVENT_SPAWN {
	#:: Set a timer for 1 hour
	quest::settimer("depop", 3600);
}

sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Shhhh!! Keep quiet! Can you not tell this island is inhabited by undead? I wish to take the fight to them, but I am weak from the [" . quest::saylink("boat disaster") . "].");
	}
	if ($text=~/boat disaster/i) {
		quest::say("I was returning to my temple in Freeport in a small boat when the storm hit. I soon found myself shipwrecked on this evil island of undead. The words of Marr tell me to destroy these beings, but I am far too weak. If I only had a sip of the [" . quest::saylink("Potion of Marr") . "].");
	}
	if ($text=~/potion of marr/i) {
		quest::say("The Potion of Marr was created for the Sentries of Passion. It makes us alert and energetic. It will work only on sentries such as myself. It is distributed by Serna Tasknon of the Temple of Marr in Freeport.");
	}			
}

sub EVENT_WAYPOINT_ARRIVE {
	if ($wp == 4) {
		quest::shout("Long live Marr!!");
	}
	if ($wp == 5) {
		quest::say("Many thanks to all who aided in this battle. I offer you this, a weapon I found on a slain Erudite paladin. May Marr watch over his soul and may Marr guide yours. Now I must go.");
		#:: Depop
		quest::depop();
		#:: Ground spawn a 5414 - Deepwater Harpoon
		quest::creategroundobject(5414,-6963,-886,139,0,1800000);			
	}
}

sub EVENT_COMBAT {
	if ($combat_state == 1) {
		quest::say("Let the fury of passion smite thee!");
	}
}

sub EVENT_TIMER {
	#:: Match timer named "depop"
	if ($timer eq "depop") {
		#:: Depop
		quest::depop();
	}
}

sub EVENT_ITEM {
	#:: Match a 12134 - Last of Potion of Marr
	if (plugin::takeItems(12134 => 1)) {
		quest::say("Ahhhh! I am energized! Come! Let us show these undead the greatness of Erollisi Marr!");
		#:: give a 12135 - Empty Potion of Marr
		quest::summonitem(12135);
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(258,5);		#:: + Priests of Marr
		quest::faction(105,-10);	#:: - Freeport Militia
		quest::faction(184,5);		#:: + Knights of Truth
		#:: Set running to true
		quest::SetRunning(1);
		#:: Start grid 62
		quest::start(62);
		#:: Hate on the spectres
		my @npcslist = $entity_list->GetNPCList();
        	foreach my $npc_on_list (@npcslist) {
			if ($npc_on_list->GetCleanName()=~/a_spectre/i) {
				$npc->AddToHateList($npc_on_list, 1);
			}
		}
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
