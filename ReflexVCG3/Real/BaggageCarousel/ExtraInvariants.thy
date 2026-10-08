theory ExtraInvariants
	imports BaggageCarouselTheory
begin
(* Carousel is only ever found in turnedOff, turnedOn
   [kind=PROCESS_STATES, priority=HIGH, process=Carousel] *)
definition extra_states_Carousel :: "state \<Rightarrow> bool" where
"extra_states_Carousel s =
(\<forall> s1. (((toEnvP s1) \<and> (substate s1 s)) \<longrightarrow> (((getPstate s1 ''Carousel'') = ''turnedOff'') \<or> ((getPstate s1 ''Carousel'') = ''turnedOn''))))"

(* The mid and low priority invariants asked for, which every cycle proves
   in a condition of its own. The high ones are part of inv. *)
definition extraInv :: "state \<Rightarrow> bool" where
"extraInv s =
(True)"

end