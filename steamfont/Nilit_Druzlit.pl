sub EVENT_SAY { 
	if ($text=~/Hail/i) {
		quest::say("Eh?  Eh?!  Talk not now!  My [" . quest::saylink("creation") . "] is running wild!  Destroy it for me. please!  If you do you can keep whatever parts you want from it.");
	}
	if ($text=~/creation/i) {
		quest::say("Did you kill it yet? What?  Bah!  Yes. I made it.  Nilit's clockwork it is.  I made it to carry my toys to and from Ak'Anon but now it's gone wild and started attacking people.  Please. destroy it!");
	}
}
