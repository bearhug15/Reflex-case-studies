theory PalletStation_LOOPENTRY14
	imports PalletStationTheory LoopInvariants Requirements
begin
(* loop invariant on entry, loopInv0 *)
lemma
assumes base_inv:"inv(st0)"
	and st0_boundary:"toEnvP st0"
	and st1:"st1=(setVarVal st0 ''sensors_0'' [] (ValBool sensors_0))"
	and st2:"st2=(setVarVal st1 ''sensors_1'' [] (ValBool sensors_1))"
	and st2_state:"getPstate st2 ''Palletiser''=''scanning''"
	and st3:"st3=(setVarVal st2 ''drives_2'' [] (ValBool False))"
	and st4:"st4=(setVarVal st3 ''#scanned'' [] (ValInt 0))"
	and st4_assume_0:"(\<forall> k. (((0 \<le> k) \<and> (k < (theInt (getVarVal st4 ''#BAY_COUNT'' [])))) \<longrightarrow> ((theInt (getVarVal st4 ''#bay'' [(AccessIndex (nat k))])) \<ge> 0)))"
	and st5:"st5=(setVarVal st4 ''#i'' [] (ValInt 0))"
shows "(loopInv0 st5 st5)"
  using assms by (auto simp add: setVarVal_def constants_def inv_def substate_refl loopInv0_def loopInv1_def loopInv2_def loopInv3_def loopInv4_def)
end
