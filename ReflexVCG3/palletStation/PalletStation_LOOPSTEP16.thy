theory PalletStation_LOOPSTEP16
	imports PalletStationTheory LoopInvariants Requirements
begin
(* loop invariant preserved, loopInv0 *)
lemma
assumes st0_constants:"(constants st0)"
	and st0_boundary:"((substate t0 st0) \<and> ((st0 = t0) \<or> (toEnvP st0)))"
	and loop_invariant:"(\<forall> sa57. ((((substate t0 sa57) \<and> (substate sa57 st0)) \<and> ((sa57 = t0) \<or> (toEnvP sa57))) \<longrightarrow> (loopInv0 t0 sa57)))"
	and st0_condition_0:"((theInt (getVarVal st0 ''#i'' [])) < (theInt (getVarVal st0 ''#BAY_COUNT'' [])))"
	and st1:"st1=(setVarVal st0 ''#scanned'' [] (ValInt ((theInt (getVarVal st0 ''#scanned'' [])) + (theInt (getVarVal st0 ''#bay'' [AccessIndex (nat (theInt (getVarVal st0 ''#i'' [])))])))))"
	and st2:"st2=(setVarVal st1 ''#i'' [] (ValInt ((theInt (getVarVal st1 ''#i'' [])) + 1)))"
	and st_final:"st_final=st2"
shows "(\<forall> sa58. ((((substate t0 sa58) \<and> (substate sa58 (toEnv st2))) \<and> ((sa58 = t0) \<or> (toEnvP sa58))) \<longrightarrow> (loopInv0 t0 sa58)))"
  using assms by (auto simp add: setVarVal_def constants_def inv_def substate_refl loopInv0_def loopInv1_def loopInv2_def loopInv3_def loopInv4_def)
end
