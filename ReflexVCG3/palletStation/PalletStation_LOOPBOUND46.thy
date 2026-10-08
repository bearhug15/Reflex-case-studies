theory PalletStation_LOOPBOUND46
	imports PalletStationTheory LoopInvariants Requirements
begin
(* loop variant stays at or above zero, loopInv3 *)
lemma
assumes st0_constants:"(constants st0)"
	and st0_boundary:"((substate t0 st0) \<and> ((st0 = t0) \<or> (toEnvP st0)))"
	and loop_invariant:"(\<forall> sa142. ((((substate t0 sa142) \<and> (substate sa142 st0)) \<and> ((sa142 = t0) \<or> (toEnvP sa142))) \<longrightarrow> (loopInv3 t0 sa142)))"
	and st0_condition_0:"((theInt (getVarVal st0 ''#r'' [])) < (theInt (getVarVal st0 ''#ROWS'' [])))"
shows "(((theInt (getVarVal st0 ''#ROWS'' [])) - (theInt (getVarVal st0 ''#r'' []))) \<ge> 0)"
  using assms by (simp add: setVarVal_def constants_def inv_def)
end
