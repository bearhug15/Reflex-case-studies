theory ExtraInvariants
	imports HandDryerTheory
begin
(* Dryer is only ever found in Wait, Work
   [kind=PROCESS_STATES, priority=HIGH, process=Dryer] *)
definition extra_states_Dryer :: "state \<Rightarrow> bool" where
"extra_states_Dryer s =
(\<forall> s1. (((toEnvP s1) \<and> (substate s1 s)) \<longrightarrow> (((getPstate s1 ''Dryer'') = ''Wait'') \<or> ((getPstate s1 ''Dryer'') = ''Work''))))"

(* The mid and low priority invariants asked for, which every cycle proves
   in a condition of its own. The high ones are part of inv. *)
definition extraInv :: "state \<Rightarrow> bool" where
"extraInv s =
(True)"

end