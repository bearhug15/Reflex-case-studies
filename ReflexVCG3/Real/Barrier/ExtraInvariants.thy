theory ExtraInvariants
	imports BarrierTheory
begin
(* CarController is only ever found in waitingForCar, waitingForCarPassing
   [kind=PROCESS_STATES, priority=HIGH, process=CarController] *)
definition extra_states_CarController :: "state \<Rightarrow> bool" where
"extra_states_CarController s =
(\<forall> s1. (((toEnvP s1) \<and> (substate s1 s)) \<longrightarrow> (((getPstate s1 ''CarController'') = ''waitingForCar'') \<or> ((getPstate s1 ''CarController'') = ''waitingForCarPassing''))))"

(* Opening is only ever found in opening, open, closing, stop
   [kind=PROCESS_STATES, priority=HIGH, process=Opening] *)
definition extra_states_Opening :: "state \<Rightarrow> bool" where
"extra_states_Opening s =
(\<forall> s1. (((toEnvP s1) \<and> (substate s1 s)) \<longrightarrow> (((((getPstate s1 ''Opening'') = ''opening'') \<or> ((getPstate s1 ''Opening'') = ''open'')) \<or> ((getPstate s1 ''Opening'') = ''closing'')) \<or> ((getPstate s1 ''Opening'') = ''stop''))))"

(* The mid and low priority invariants asked for, which every cycle proves
   in a condition of its own. The high ones are part of inv. *)
definition extraInv :: "state \<Rightarrow> bool" where
"extraInv s =
(True)"

end