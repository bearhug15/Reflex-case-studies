theory PalletStation_LOOPDECREASE39
	imports PalletStationTheory LoopInvariants Requirements
begin
(* loop variant decreases, loopInv2 *)
lemma
assumes st0_constants:"(constants st0)"
	and st0_boundary:"((substate t0 st0) \<and> ((st0 = t0) \<or> (toEnvP st0)))"
	and loop_invariant:"(\<forall> sa107. ((((substate t0 sa107) \<and> (substate sa107 st0)) \<and> ((sa107 = t0) \<or> (toEnvP sa107))) \<longrightarrow> (loopInv2 t0 sa107)))"
	and st0_condition_0:"((theInt (getVarVal st0 ''#j'' [])) < (theInt (getVarVal st0 ''#BAY_COUNT'' [])))"
	and st0_condition_1:"(\<not> ((theInt (getVarVal st0 ''#bay'' [AccessIndex (nat (theInt (getVarVal st0 ''#j'' [])))])) = 0))"
	and st1:"st1=(setVarVal st0 ''#j'' [] (ValInt ((theInt (getVarVal st0 ''#j'' [])) + 1)))"
	and st_final:"st_final=st1"
shows "(((theInt (getVarVal st0 ''#BAY_COUNT'' [])) - (theInt (getVarVal st0 ''#j'' []))) > ((theInt (getVarVal (toEnv st1) ''#BAY_COUNT'' [])) - (theInt (getVarVal (toEnv st1) ''#j'' []))))"
  using assms by (simp add: setVarVal_def constants_def inv_def)
end
