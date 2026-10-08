theory PalletStation_ASSERT3
	imports PalletStationTheory LoopInvariants Requirements
begin
(* assert at line 64: [assert: previously(true) ==> !(beltLeft.scope(prev) && beltRight.scope(prev))] *)
lemma
assumes base_inv:"inv(st0)"
	and st0_boundary:"toEnvP st0"
	and st1:"st1=(setVarVal st0 ''sensors_0'' [] (ValBool sensors_0))"
	and st2:"st2=(setVarVal st1 ''sensors_1'' [] (ValBool sensors_1))"
	and st2_state:"getPstate st2 ''Palletiser''=''idle''"
	and st3:"st3=(setVarVal st2 ''drives_2'' [] (ValBool True))"
	and st4:"st4=(setVarVal st3 ''drives_0'' [] (ValBool False))"
	and st5:"st5=(setVarVal st4 ''drives_1'' [] (ValBool False))"
shows "((\<exists> sa4. ((((substate sa4 st5) \<and> (sa4 \<noteq> st5)) \<and> (toEnvP sa4)) \<and> (\<forall> sa5. ((((substate sa4 sa5) \<and> (sa4 \<noteq> sa5)) \<and> ((substate sa5 st5) \<and> (sa5 \<noteq> st5))) \<longrightarrow> (\<not> (toEnvP sa5)))))) \<longrightarrow> (\<not> ((theBool (getVarVal (SOME sa6. ((((substate sa6 st5) \<and> (sa6 \<noteq> st5)) \<and> (toEnvP sa6)) \<and> (\<forall> sa7. ((((substate sa6 sa7) \<and> (sa6 \<noteq> sa7)) \<and> ((substate sa7 st5) \<and> (sa7 \<noteq> st5))) \<longrightarrow> (\<not> (toEnvP sa7)))))) ''drives_0'' [])) \<and> (theBool (getVarVal (SOME sa8. ((((substate sa8 st5) \<and> (sa8 \<noteq> st5)) \<and> (toEnvP sa8)) \<and> (\<forall> sa9. ((((substate sa8 sa9) \<and> (sa8 \<noteq> sa9)) \<and> ((substate sa9 st5) \<and> (sa9 \<noteq> st5))) \<longrightarrow> (\<not> (toEnvP sa9)))))) ''drives_1'' [])))))"
  (* Open: no proof is recorded for this condition in palletStation.proofs,
     which says why. *)
  sorry
end
