theory Requirements
	imports ExtraInvariants
begin
definition inv where
"inv s =
((constants s)
\<and> (\<forall> sa1. (((toEnvP sa1) \<and> (substate sa1 s)) \<longrightarrow> (\<not> ((theBool (getVarVal sa1 ''out_0'' [])) \<and> (theBool (getVarVal sa1 ''out_1'' []))))))
\<and> (\<forall> sa3. (((toEnvP sa3) \<and> (substate sa3 s)) \<longrightarrow> (\<not> ((theBool (getVarVal sa3 ''out_2'' [])) \<and> (theBool (getVarVal sa3 ''out_3'' []))))))
\<and> (\<forall> sa7. (((toEnvP sa7) \<and> (substate sa7 s)) \<longrightarrow> (((\<exists> sa5. ((((substate sa5 sa7) \<and> (sa5 \<noteq> sa7)) \<and> (toEnvP sa5)) \<and> (\<forall> sa6. ((((substate sa5 sa6) \<and> (sa5 \<noteq> sa6)) \<and> ((substate sa6 sa7) \<and> (sa6 \<noteq> sa7))) \<longrightarrow> (\<not> (toEnvP sa6)))))) \<and> (theBool (getVarVal sa7 ''inp_0'' []))) \<longrightarrow> (theBool (getVarVal sa7 ''out_3'' [])))))
\<and> (\<forall> sa9. (((toEnvP sa9) \<and> (substate sa9 s)) \<longrightarrow> ((theBool (getVarVal sa9 ''inp_0'' [])) \<longrightarrow> (\<not> (theBool (getVarVal sa9 ''out_0'' []))))))
\<and> (\<forall> sa13. (((toEnvP sa13) \<and> (substate sa13 s)) \<longrightarrow> (((\<exists> sa11. (((((substate sa11 sa13) \<and> (sa11 \<noteq> sa13)) \<and> (toEnvP sa11)) \<and> (\<forall> sa12. ((((substate sa11 sa12) \<and> (sa11 \<noteq> sa12)) \<and> ((substate sa12 sa13) \<and> (sa12 \<noteq> sa13))) \<longrightarrow> (\<not> (toEnvP sa12))))) \<and> ((getPstate sa11 ''Control'') = ''openned''))) \<and> (theBool (getVarVal sa13 ''inp_0'' []))) \<longrightarrow> (theBool (getVarVal sa13 ''out_1'' [])))))
\<and> (\<forall> sa15. ((((toEnvP sa15) \<and> (substate sa15 s)) \<and> ((getPstate sa15 ''Control'') = ''openned'')) \<longrightarrow> (((\<not> (theBool (getVarVal sa15 ''out_0'' []))) \<and> (\<not> (theBool (getVarVal sa15 ''out_1'' [])))) \<and> (\<not> (theBool (getVarVal sa15 ''out_3'' []))))))
\<and> (\<forall> sa17. ((((toEnvP sa17) \<and> (substate sa17 s)) \<and> ((getPstate sa17 ''Control'') = ''closing'')) \<longrightarrow> ((((\<not> (theBool (getVarVal sa17 ''out_0'' []))) \<and> (theBool (getVarVal sa17 ''out_1'' []))) \<and> (\<not> (theBool (getVarVal sa17 ''out_2'' [])))) \<and> (theBool (getVarVal sa17 ''out_3'' [])))))
\<and> (\<forall> sa19. ((((toEnvP sa19) \<and> (substate sa19 s)) \<and> ((getPstate sa19 ''Control'') = ''closed'')) \<longrightarrow> ((((\<not> (theBool (getVarVal sa19 ''out_0'' []))) \<and> (\<not> (theBool (getVarVal sa19 ''out_1'' [])))) \<and> (\<not> (theBool (getVarVal sa19 ''out_2'' [])))) \<and> (theBool (getVarVal sa19 ''out_3'' [])))))
\<and> (\<forall> sa21. ((((toEnvP sa21) \<and> (substate sa21 s)) \<and> ((getPstate sa21 ''Control'') = ''openning'')) \<longrightarrow> ((((theBool (getVarVal sa21 ''out_0'' [])) \<and> (\<not> (theBool (getVarVal sa21 ''out_1'' [])))) \<and> (\<not> (theBool (getVarVal sa21 ''out_2'' [])))) \<and> (theBool (getVarVal sa21 ''out_3'' [])))))
\<and> (extra_states_Control s))
"

end