theory PalletStation_LOOPSTEP30
	imports PalletStationTheory LoopInvariants Requirements
begin
(* loop invariant preserved, loopInv1 *)
lemma
assumes st0_constants:"(constants st0)"
	and st0_boundary:"((substate t0 st0) \<and> ((st0 = t0) \<or> (toEnvP st0)))"
	and loop_invariant:"(\<forall> sa95. ((((substate t0 sa95) \<and> (substate sa95 st0)) \<and> ((sa95 = t0) \<or> (toEnvP sa95))) \<longrightarrow> (loopInv1 t0 sa95)))"
	and st0_condition_0:"((theInt (getVarVal st0 ''#i'' [])) < (theInt (getVarVal st0 ''#BAY_COUNT'' [])))"
	and st0_condition_1:"(\<not> ((theInt (getVarVal st0 ''#bay'' [AccessIndex (nat (theInt (getVarVal st0 ''#i'' [])))])) > 0))"
	and st1:"st1=(setVarVal st0 ''#i'' [] (ValInt ((theInt (getVarVal st0 ''#i'' [])) + 1)))"
	and st_final:"st_final=st1"
shows "(\<forall> sa99. ((((substate t0 sa99) \<and> (substate sa99 (toEnv st1))) \<and> ((sa99 = t0) \<or> (toEnvP sa99))) \<longrightarrow> (loopInv1 t0 sa99)))"
  using assms by (auto simp add: setVarVal_def constants_def inv_def substate_refl loopInv0_def loopInv1_def loopInv2_def loopInv3_def loopInv4_def)
end
