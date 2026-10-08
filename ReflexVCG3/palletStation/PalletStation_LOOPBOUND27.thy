theory PalletStation_LOOPBOUND27
	imports PalletStationTheory LoopInvariants Requirements
begin
(* loop variant stays at or above zero, loopInv1 *)
lemma
assumes st0_constants:"(constants st0)"
	and st0_boundary:"((substate t0 st0) \<and> ((st0 = t0) \<or> (toEnvP st0)))"
	and loop_invariant:"(\<forall> sa93. ((((substate t0 sa93) \<and> (substate sa93 st0)) \<and> ((sa93 = t0) \<or> (toEnvP sa93))) \<longrightarrow> (loopInv1 t0 sa93)))"
	and st0_condition_0:"((theInt (getVarVal st0 ''#i'' [])) < (theInt (getVarVal st0 ''#BAY_COUNT'' [])))"
shows "(((theInt (getVarVal st0 ''#BAY_COUNT'' [])) - (theInt (getVarVal st0 ''#i'' []))) \<ge> 0)"
  using assms by (simp add: setVarVal_def constants_def inv_def)
end
