theory ExtraInvariants
	imports TrainBarrierTheory
begin
(* Control is only ever found in openned, closing, closed, openning
   [kind=PROCESS_STATES, priority=HIGH, process=Control] *)
definition extra_states_Control :: "state \<Rightarrow> bool" where
"extra_states_Control s =
(\<forall> s1. (((toEnvP s1) \<and> (substate s1 s)) \<longrightarrow> (((((getPstate s1 ''Control'') = ''openned'') \<or> ((getPstate s1 ''Control'') = ''closing'')) \<or> ((getPstate s1 ''Control'') = ''closed'')) \<or> ((getPstate s1 ''Control'') = ''openning''))))"

(* The mid and low priority invariants asked for, which every cycle proves
   in a condition of its own. The high ones are part of inv. *)
definition extraInv :: "state \<Rightarrow> bool" where
"extraInv s =
(True)"

end