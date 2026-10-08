theory Requirements
	imports ExtraInvariants
begin
definition inv where
"inv s =
((constants s)
\<and> (\<forall> sa1. (((toEnvP sa1) \<and> (substate sa1 s)) \<longrightarrow> ((theBool (getVarVal sa1 ''out_0'' [])) \<longrightarrow> (\<not> (theBool (getVarVal sa1 ''out_1'' []))))))
\<and> (\<forall> sa3. (((toEnvP sa3) \<and> (substate sa3 s)) \<longrightarrow> (\<not> ((theBool (getVarVal sa3 ''out_2'' [])) \<and> (theBool (getVarVal sa3 ''out_3'' []))))))
\<and> (\<forall> sa6. (((toEnvP sa6) \<and> (substate sa6 s)) \<longrightarrow> ((theBool (getVarVal sa6 ''out_2'' [])) \<longrightarrow> (\<exists> sa5. (((substate sa5 sa6) \<and> (toEnvP sa5)) \<and> ((getPstate sa5 ''ForceSterilization'') = ''sterilizationFor1min''))))))
\<and> (\<forall> sa8. ((((toEnvP sa8) \<and> (substate sa8 s)) \<and> ((getPstate sa8 ''Initialization'') = ''begin'')) \<longrightarrow> (\<not> (theBool (getVarVal sa8 ''out_2'' [])))))
\<and> (\<forall> sa10. ((((toEnvP sa10) \<and> (substate sa10 s)) \<and> ((getPstate sa10 ''Initialization'') = ''waitForSterilization'')) \<longrightarrow> ((\<not> (theBool (getVarVal sa10 ''out_0'' []))) \<and> (\<not> (theBool (getVarVal sa10 ''out_2'' []))))))
\<and> (\<forall> sa12. ((((toEnvP sa12) \<and> (substate sa12 s)) \<and> ((getPstate sa12 ''Initialization'') = ''keepSterilization'')) \<longrightarrow> (\<not> (theBool (getVarVal sa12 ''out_0'' [])))))
\<and> (\<forall> sa14. ((((toEnvP sa14) \<and> (substate sa14 s)) \<and> ((getPstate sa14 ''MainLoop'') = ''begin'')) \<longrightarrow> (\<not> (theBool (getVarVal sa14 ''out_2'' [])))))
\<and> (\<forall> sa16. ((((toEnvP sa16) \<and> (substate sa16 s)) \<and> ((getPstate sa16 ''MainLoop'') = ''waitForNextBottle'')) \<longrightarrow> (\<not> (theBool (getVarVal sa16 ''out_2'' [])))))
\<and> (\<forall> sa18. ((((toEnvP sa18) \<and> (substate sa18 s)) \<and> ((getPstate sa18 ''MainLoop'') = ''waitForFilling'')) \<longrightarrow> (\<not> (theBool (getVarVal sa18 ''out_3'' [])))))
\<and> (\<forall> sa20. ((((toEnvP sa20) \<and> (substate sa20 s)) \<and> ((getPstate sa20 ''ForceSterilization'') = ''heatUp'')) \<longrightarrow> (\<not> (theBool (getVarVal sa20 ''out_0'' [])))))
\<and> (\<forall> sa22. ((((toEnvP sa22) \<and> (substate sa22 s)) \<and> ((getPstate sa22 ''ForceSterilization'') = ''sterilizationFor1min'')) \<longrightarrow> (\<not> (theBool (getVarVal sa22 ''out_0'' [])))))
\<and> (\<forall> sa24. ((((toEnvP sa24) \<and> (substate sa24 s)) \<and> ((getPstate sa24 ''NextBottle'') = ''begin'')) \<longrightarrow> (\<not> (theBool (getVarVal sa24 ''out_2'' [])))))
\<and> (\<forall> sa26. ((((toEnvP sa26) \<and> (substate sa26 s)) \<and> ((getPstate sa26 ''NextBottle'') = ''waitBottlePosition'')) \<longrightarrow> (\<not> (theBool (getVarVal sa26 ''out_2'' [])))))
\<and> (extra_states_Initialization s)
\<and> (extra_states_MainLoop s)
\<and> (extra_states_ForceSterilization s)
\<and> (extra_states_NextBottle s))
"

end