theory ExtraInvariants
	imports TrafficLightsTheory
begin
(* Controller is only ever found in minimalRed, redAfterMinimalRed, redToGreen, green
   [kind=PROCESS_STATES, priority=HIGH, process=Controller] *)
definition extra_states_Controller :: "state \<Rightarrow> bool" where
"extra_states_Controller s =
(\<forall> s1. (((toEnvP s1) \<and> (substate s1 s)) \<longrightarrow> (((((getPstate s1 ''Controller'') = ''minimalRed'') \<or> ((getPstate s1 ''Controller'') = ''redAfterMinimalRed'')) \<or> ((getPstate s1 ''Controller'') = ''redToGreen'')) \<or> ((getPstate s1 ''Controller'') = ''green''))))"

(* The mid and low priority invariants asked for, which every cycle proves
   in a condition of its own. The high ones are part of inv. *)
definition extraInv :: "state \<Rightarrow> bool" where
"extraInv s =
(True)"

end