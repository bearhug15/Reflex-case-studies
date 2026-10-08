theory ExtraInvariants
	imports BottleFillingTheory
begin
(* Initialization is only ever found in begin, waitForSterilization, keepSterilization
   [kind=PROCESS_STATES, priority=HIGH, process=Initialization] *)
definition extra_states_Initialization :: "state \<Rightarrow> bool" where
"extra_states_Initialization s =
(\<forall> s1. (((toEnvP s1) \<and> (substate s1 s)) \<longrightarrow> ((((getPstate s1 ''Initialization'') = ''begin'') \<or> ((getPstate s1 ''Initialization'') = ''waitForSterilization'')) \<or> ((getPstate s1 ''Initialization'') = ''keepSterilization''))))"

(* MainLoop is only ever found in begin, waitForNextBottle, waitForFilling, stop
   [kind=PROCESS_STATES, priority=HIGH, process=MainLoop] *)
definition extra_states_MainLoop :: "state \<Rightarrow> bool" where
"extra_states_MainLoop s =
(\<forall> s1. (((toEnvP s1) \<and> (substate s1 s)) \<longrightarrow> (((((getPstate s1 ''MainLoop'') = ''begin'') \<or> ((getPstate s1 ''MainLoop'') = ''waitForNextBottle'')) \<or> ((getPstate s1 ''MainLoop'') = ''waitForFilling'')) \<or> ((getPstate s1 ''MainLoop'') = ''stop''))))"

(* ForceSterilization is only ever found in heatUp, sterilizationFor1min, stop
   [kind=PROCESS_STATES, priority=HIGH, process=ForceSterilization] *)
definition extra_states_ForceSterilization :: "state \<Rightarrow> bool" where
"extra_states_ForceSterilization s =
(\<forall> s1. (((toEnvP s1) \<and> (substate s1 s)) \<longrightarrow> ((((getPstate s1 ''ForceSterilization'') = ''heatUp'') \<or> ((getPstate s1 ''ForceSterilization'') = ''sterilizationFor1min'')) \<or> ((getPstate s1 ''ForceSterilization'') = ''stop''))))"

(* NextBottle is only ever found in begin, waitBottlePosition, stop
   [kind=PROCESS_STATES, priority=HIGH, process=NextBottle] *)
definition extra_states_NextBottle :: "state \<Rightarrow> bool" where
"extra_states_NextBottle s =
(\<forall> s1. (((toEnvP s1) \<and> (substate s1 s)) \<longrightarrow> ((((getPstate s1 ''NextBottle'') = ''begin'') \<or> ((getPstate s1 ''NextBottle'') = ''waitBottlePosition'')) \<or> ((getPstate s1 ''NextBottle'') = ''stop''))))"

(* The mid and low priority invariants asked for, which every cycle proves
   in a condition of its own. The high ones are part of inv. *)
definition extraInv :: "state \<Rightarrow> bool" where
"extraInv s =
(True)"

end