theory PalletStation_LOOPDECREASE53
	imports PalletStationTheory LoopInvariants Requirements
begin
(* loop variant decreases, loopInv4 *)
lemma
assumes st0_constants:"(constants st0)"
	and st0_boundary:"((substate t0 st0) \<and> ((st0 = t0) \<or> (toEnvP st0)))"
	and loop_invariant:"(\<forall> sa148. ((((substate t0 sa148) \<and> (substate sa148 st0)) \<and> ((sa148 = t0) \<or> (toEnvP sa148))) \<longrightarrow> (loopInv4 t0 sa148)))"
	and st0_condition_0:"((theInt (getVarVal st0 ''#c'' [])) < (theInt (getVarVal st0 ''#COLS'' [])))"
	and st1:"st1=(setVarVal st0 ''#cell'' [AccessIndex (nat (((theInt (getVarVal st0 ''#r'' [])) * (theInt (getVarVal st0 ''#COLS'' []))) + (theInt (getVarVal st0 ''#c'' []))))] (ValInt 1))"
	and st2:"st2=(setVarVal st1 ''#placed'' [] (ValInt ((theInt (getVarVal st1 ''#placed'' [])) + 1)))"
	and st3:"st3=(setVarVal st2 ''#c'' [] (ValInt ((theInt (getVarVal st2 ''#c'' [])) + 1)))"
	and st_final:"st_final=st3"
shows "(((theInt (getVarVal st0 ''#COLS'' [])) - (theInt (getVarVal st0 ''#c'' []))) > ((theInt (getVarVal (toEnv st3) ''#COLS'' [])) - (theInt (getVarVal (toEnv st3) ''#c'' []))))"
  using assms by (simp add: setVarVal_def constants_def inv_def)
end
