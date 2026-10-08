theory PalletStation_ASSERT10
	imports PalletStationTheory LoopInvariants Requirements
begin
(* assert at line 168: [assert: jam ==> !moving] *)
lemma
assumes base_inv:"inv(st0)"
	and st0_boundary:"toEnvP st0"
	and st1:"st1=(setVarVal st0 ''sensors_0'' [] (ValBool sensors_0))"
	and st2:"st2=(setVarVal st1 ''sensors_1'' [] (ValBool sensors_1))"
	and st2_state:"getPstate st2 ''Palletiser''=''idle''"
	and st3:"st3=(setVarVal st2 ''drives_2'' [] (ValBool True))"
	and st4:"st4=(setVarVal st3 ''drives_0'' [] (ValBool False))"
	and st5:"st5=(setVarVal st4 ''drives_1'' [] (ValBool False))"
	and st5_assume_0:"(\<not> (theBool (getVarVal st5 ''sensors_1'' [])))"
	and st5_condition_0:"(\<not> (theBool (getVarVal st5 ''sensors_0'' [])))"
	and st5_state:"getPstate st5 ''Watchdog''=''watching''"
shows "((theBool (getVarVal st5 ''sensors_1'' [])) \<longrightarrow> (\<not> ((theBool (getVarVal st5 ''drives_0'' [])) \<or> (theBool (getVarVal st5 ''drives_1'' [])))))"
  using assms by (simp add: setVarVal_def constants_def inv_def)
end
