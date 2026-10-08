theory PalletStation_LOOPENTRY50
	imports PalletStationTheory LoopInvariants Requirements
begin
(* loop invariant on entry, loopInv4 *)
lemma
assumes st0_constants:"(constants st0)"
	and st0_boundary:"((substate t0 st0) \<and> ((st0 = t0) \<or> (toEnvP st0)))"
	and loop_invariant:"(\<forall> sa144. ((((substate t0 sa144) \<and> (substate sa144 st0)) \<and> ((sa144 = t0) \<or> (toEnvP sa144))) \<longrightarrow> (loopInv3 t0 sa144)))"
	and st0_condition_0:"((theInt (getVarVal st0 ''#r'' [])) < (theInt (getVarVal st0 ''#ROWS'' [])))"
	and st0_assume_0:"((theInt (getVarVal st0 ''#placed'' [])) \<ge> ((theInt (getVarVal st0 ''#r'' [])) * (theInt (getVarVal st0 ''#COLS'' []))))"
	and st1:"st1=(setVarVal st0 ''#c'' [] (ValInt 0))"
shows "(loopInv4 st1 st1)"
  using assms by (auto simp add: setVarVal_def constants_def inv_def substate_refl loopInv0_def loopInv1_def loopInv2_def loopInv3_def loopInv4_def)
end
