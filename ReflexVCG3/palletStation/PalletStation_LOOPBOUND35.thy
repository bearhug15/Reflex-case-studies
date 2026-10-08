theory PalletStation_LOOPBOUND35
	imports PalletStationTheory LoopInvariants Requirements
begin
(* loop variant stays at or above zero, loopInv2 *)
lemma
assumes st0_constants:"(constants st0)"
	and st0_boundary:"((substate t0 st0) \<and> ((st0 = t0) \<or> (toEnvP st0)))"
	and loop_invariant:"(\<forall> sa105. ((((substate t0 sa105) \<and> (substate sa105 st0)) \<and> ((sa105 = t0) \<or> (toEnvP sa105))) \<longrightarrow> (loopInv2 t0 sa105)))"
	and st0_condition_0:"((theInt (getVarVal st0 ''#j'' [])) < (theInt (getVarVal st0 ''#BAY_COUNT'' [])))"
shows "(((theInt (getVarVal st0 ''#BAY_COUNT'' [])) - (theInt (getVarVal st0 ''#j'' []))) \<ge> 0)"
  using assms by (simp add: setVarVal_def constants_def inv_def)
end
