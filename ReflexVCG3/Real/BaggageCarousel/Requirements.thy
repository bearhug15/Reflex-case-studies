theory Requirements
	imports ExtraInvariants
begin
definition inv where
"inv s =
((constants s)
\<and> (\<forall> sa1. (((toEnvP sa1) \<and> (substate sa1 s)) \<longrightarrow> (((theBool (getVarVal sa1 ''inp_2'' [])) \<or> (theBool (getVarVal sa1 ''inp_3'' []))) \<longrightarrow> (\<not> (theBool (getVarVal sa1 ''out_0'' []))))))
\<and> (\<forall> sa5. (((toEnvP sa5) \<and> (substate sa5 s)) \<longrightarrow> (((\<exists> sa3. (((((substate sa3 sa5) \<and> (sa3 \<noteq> sa5)) \<and> (toEnvP sa3)) \<and> (\<forall> sa4. ((((substate sa3 sa4) \<and> (sa3 \<noteq> sa4)) \<and> ((substate sa4 sa5) \<and> (sa4 \<noteq> sa5))) \<longrightarrow> (\<not> (toEnvP sa4))))) \<and> (\<not> (theBool (getVarVal sa3 ''out_0'' []))))) \<and> (theBool (getVarVal sa5 ''out_0'' []))) \<longrightarrow> (((theBool (getVarVal sa5 ''inp_0'' [])) \<and> (\<not> (theBool (getVarVal sa5 ''inp_2'' [])))) \<and> (\<not> (theBool (getVarVal sa5 ''inp_3'' [])))))))
\<and> (\<forall> sa10. (((toEnvP sa10) \<and> (substate sa10 s)) \<longrightarrow> ((theBool (getVarVal sa10 ''out_0'' [])) \<longrightarrow> (\<exists> sa7. ((((substate sa7 sa10) \<and> (toEnvP sa7)) \<and> ((theBool (getVarVal sa7 ''inp_1'' [])) \<or> (\<exists> sa8. (((((substate sa8 sa7) \<and> (sa8 \<noteq> sa7)) \<and> (toEnvP sa8)) \<and> (\<forall> sa9. ((((substate sa8 sa9) \<and> (sa8 \<noteq> sa9)) \<and> ((substate sa9 sa7) \<and> (sa9 \<noteq> sa7))) \<longrightarrow> (\<not> (toEnvP sa9))))) \<and> (\<not> (theBool (getVarVal sa8 ''out_0'' []))))))) \<and> (((toEnvNum sa7 sa10) * 100) < 30000))))))
\<and> (\<forall> sa12. ((((toEnvP sa12) \<and> (substate sa12 s)) \<and> ((getPstate sa12 ''Carousel'') = ''turnedOff'')) \<longrightarrow> (\<not> (theBool (getVarVal sa12 ''out_0'' [])))))
\<and> (\<forall> sa14. ((((toEnvP sa14) \<and> (substate sa14 s)) \<and> ((getPstate sa14 ''Carousel'') = ''turnedOn'')) \<longrightarrow> (theBool (getVarVal sa14 ''out_0'' []))))
\<and> (\<forall> sa16. ((((toEnvP sa16) \<and> (substate sa16 s)) \<and> ((getPstate sa16 ''Carousel'') = ''turnedOn'')) \<longrightarrow> ((ltime sa16 ''Carousel'') \<le> 30000)))
\<and> (extra_states_Carousel s))
"

end