theory PalletStation_LOOPDECREASE31
	imports PalletStationTheory LoopInvariants Requirements
begin
(* loop variant decreases, loopInv1 *)
lemma
assumes st0_constants:"(constants st0)"
	and st0_boundary:"((substate t0 st0) \<and> ((st0 = t0) \<or> (toEnvP st0)))"
	and loop_invariant:"(\<forall> sa95. ((((substate t0 sa95) \<and> (substate sa95 st0)) \<and> ((sa95 = t0) \<or> (toEnvP sa95))) \<longrightarrow> (loopInv1 t0 sa95)))"
	and st0_condition_0:"((theInt (getVarVal st0 ''#i'' [])) < (theInt (getVarVal st0 ''#BAY_COUNT'' [])))"
	and st0_condition_1:"(\<not> ((theInt (getVarVal st0 ''#bay'' [AccessIndex (nat (theInt (getVarVal st0 ''#i'' [])))])) > 0))"
	and st1:"st1=(setVarVal st0 ''#i'' [] (ValInt ((theInt (getVarVal st0 ''#i'' [])) + 1)))"
	and st_final:"st_final=st1"
shows "(((theInt (getVarVal st0 ''#BAY_COUNT'' [])) - (theInt (getVarVal st0 ''#i'' []))) > ((theInt (getVarVal (toEnv st1) ''#BAY_COUNT'' [])) - (theInt (getVarVal (toEnv st1) ''#i'' []))))"
  using assms by (simp add: setVarVal_def constants_def inv_def)
end
