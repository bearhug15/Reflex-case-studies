theory Requirements
	imports ExtraInvariants
begin
definition inv where
"inv s =
((constants s)
\<and> (\<forall> sa1. (((toEnvP sa1) \<and> (substate sa1 s)) \<longrightarrow> (\<not> ((theBool (getVarVal sa1 ''out_0'' [])) \<and> (theBool (getVarVal sa1 ''out_1'' []))))))
\<and> (\<forall> sa3. (((toEnvP sa3) \<and> (substate sa3 s)) \<longrightarrow> (\<not> ((theBool (getVarVal sa3 ''out_2'' [])) \<and> (theBool (getVarVal sa3 ''out_3'' []))))))
\<and> (\<forall> sa5. (((toEnvP sa5) \<and> (substate sa5 s)) \<longrightarrow> ((theBool (getVarVal sa5 ''inp_1'' [])) \<longrightarrow> (\<not> (theBool (getVarVal sa5 ''out_1'' []))))))
\<and> (\<forall> sa7. (((toEnvP sa7) \<and> (substate sa7 s)) \<longrightarrow> ((theBool (getVarVal sa7 ''out_2'' [])) \<longrightarrow> ((getPstate sa7 ''Opening'') = ''open''))))
\<and> (\<forall> sa11. (((toEnvP sa11) \<and> (substate sa11 s)) \<longrightarrow> (((\<exists> sa9. (((((substate sa9 sa11) \<and> (sa9 \<noteq> sa11)) \<and> (toEnvP sa9)) \<and> (\<forall> sa10. ((((substate sa9 sa10) \<and> (sa9 \<noteq> sa10)) \<and> ((substate sa10 sa11) \<and> (sa10 \<noteq> sa11))) \<longrightarrow> (\<not> (toEnvP sa10))))) \<and> ((getPstate sa9 ''Opening'') = ''open''))) \<and> (theBool (getVarVal sa11 ''inp_1'' []))) \<longrightarrow> ((getPstate sa11 ''Opening'') = ''open''))))
\<and> (\<forall> sa13. (((toEnvP sa13) \<and> (substate sa13 s)) \<longrightarrow> ((theBool (getVarVal sa13 ''out_1'' [])) \<longrightarrow> ((getPstate sa13 ''Opening'') = ''closing''))))
\<and> (\<forall> sa15. ((((toEnvP sa15) \<and> (substate sa15 s)) \<and> ((getPstate sa15 ''Opening'') = ''opening'')) \<longrightarrow> (\<not> (theBool (getVarVal sa15 ''out_1'' [])))))
\<and> (\<forall> sa17. ((((toEnvP sa17) \<and> (substate sa17 s)) \<and> ((getPstate sa17 ''Opening'') = ''open'')) \<longrightarrow> ((((\<not> (theBool (getVarVal sa17 ''out_0'' []))) \<and> (\<not> (theBool (getVarVal sa17 ''out_1'' [])))) \<and> (theBool (getVarVal sa17 ''out_2'' []))) \<and> (\<not> (theBool (getVarVal sa17 ''out_3'' []))))))
\<and> (\<forall> sa19. ((((toEnvP sa19) \<and> (substate sa19 s)) \<and> ((getPstate sa19 ''Opening'') = ''closing'')) \<longrightarrow> (((\<not> (theBool (getVarVal sa19 ''out_0'' []))) \<and> (\<not> (theBool (getVarVal sa19 ''out_2'' [])))) \<and> (theBool (getVarVal sa19 ''out_3'' [])))))
\<and> (extra_states_CarController s)
\<and> (extra_states_Opening s))
"

end