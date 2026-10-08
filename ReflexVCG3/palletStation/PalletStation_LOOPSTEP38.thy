theory PalletStation_LOOPSTEP38
	imports PalletStationTheory LoopInvariants Requirements
begin
(* loop invariant preserved, loopInv2 *)
lemma
assumes st0_constants:"(constants st0)"
	and st0_boundary:"((substate t0 st0) \<and> ((st0 = t0) \<or> (toEnvP st0)))"
	and loop_invariant:"(\<forall> sa107. ((((substate t0 sa107) \<and> (substate sa107 st0)) \<and> ((sa107 = t0) \<or> (toEnvP sa107))) \<longrightarrow> (loopInv2 t0 sa107)))"
	and st0_condition_0:"((theInt (getVarVal st0 ''#j'' [])) < (theInt (getVarVal st0 ''#BAY_COUNT'' [])))"
	and st0_condition_1:"(\<not> ((theInt (getVarVal st0 ''#bay'' [AccessIndex (nat (theInt (getVarVal st0 ''#j'' [])))])) = 0))"
	and st1:"st1=(setVarVal st0 ''#j'' [] (ValInt ((theInt (getVarVal st0 ''#j'' [])) + 1)))"
	and st_final:"st_final=st1"
shows "(\<forall> sa111. ((((substate t0 sa111) \<and> (substate sa111 (toEnv st1))) \<and> ((sa111 = t0) \<or> (toEnvP sa111))) \<longrightarrow> (loopInv2 t0 sa111)))"
  using assms by (auto simp add: setVarVal_def constants_def inv_def substate_refl loopInv0_def loopInv1_def loopInv2_def loopInv3_def loopInv4_def)
end
