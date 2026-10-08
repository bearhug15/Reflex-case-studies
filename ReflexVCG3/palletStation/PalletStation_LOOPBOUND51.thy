theory PalletStation_LOOPBOUND51
	imports PalletStationTheory LoopInvariants Requirements
begin
(* loop variant stays at or above zero, loopInv4 *)
lemma
assumes st0_constants:"(constants st0)"
	and st0_boundary:"((substate t0 st0) \<and> ((st0 = t0) \<or> (toEnvP st0)))"
	and loop_invariant:"(\<forall> sa146. ((((substate t0 sa146) \<and> (substate sa146 st0)) \<and> ((sa146 = t0) \<or> (toEnvP sa146))) \<longrightarrow> (loopInv4 t0 sa146)))"
	and st0_condition_0:"((theInt (getVarVal st0 ''#c'' [])) < (theInt (getVarVal st0 ''#COLS'' [])))"
shows "(((theInt (getVarVal st0 ''#COLS'' [])) - (theInt (getVarVal st0 ''#c'' []))) \<ge> 0)"
  using assms by (simp add: setVarVal_def constants_def inv_def)
end
