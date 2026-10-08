theory PalletStation_ASSERT2
	imports PalletStationTheory LoopInvariants Requirements
begin
(* assert at line 63: [assert: previously(idleLamp) ==> idleLamp] *)
lemma
assumes base_inv:"inv(st0)"
	and st0_boundary:"toEnvP st0"
	and st1:"st1=(setVarVal st0 ''sensors_0'' [] (ValBool sensors_0))"
	and st2:"st2=(setVarVal st1 ''sensors_1'' [] (ValBool sensors_1))"
	and st2_state:"getPstate st2 ''Palletiser''=''idle''"
	and st3:"st3=(setVarVal st2 ''drives_2'' [] (ValBool True))"
	and st4:"st4=(setVarVal st3 ''drives_0'' [] (ValBool False))"
	and st5:"st5=(setVarVal st4 ''drives_1'' [] (ValBool False))"
shows "((\<exists> sa1. (((((substate sa1 st5) \<and> (sa1 \<noteq> st5)) \<and> (toEnvP sa1)) \<and> (\<forall> sa2. ((((substate sa1 sa2) \<and> (sa1 \<noteq> sa2)) \<and> ((substate sa2 st5) \<and> (sa2 \<noteq> st5))) \<longrightarrow> (\<not> (toEnvP sa2))))) \<and> (theBool (getVarVal sa1 ''drives_2'' [])))) \<longrightarrow> (theBool (getVarVal st5 ''drives_2'' [])))"
  using assms by (simp add: setVarVal_def constants_def inv_def)
end
