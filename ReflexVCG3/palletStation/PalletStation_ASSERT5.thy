theory PalletStation_ASSERT5
	imports PalletStationTheory LoopInvariants Requirements
begin
(* assert at line 70: [assert: scanned <= scanned.scope(pre) + BAY_COUNT] *)
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
	and st5_condition_0:"(theBool (getVarVal st5 ''sensors_0'' []))"
	and st6:"st6=(setVarVal st5 ''#scanned'' [] (ValInt 0))"
shows "((theInt (getVarVal st6 ''#scanned'' [])) \<le> ((theInt (getVarVal st6 ''#scanned'' [])) + (theInt (getVarVal st6 ''#BAY_COUNT'' []))))"
  using assms by (simp add: setVarVal_def constants_def inv_def)
end
