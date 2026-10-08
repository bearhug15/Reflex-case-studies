theory PalletStation_LOOPSTEP47
	imports PalletStationTheory LoopInvariants Requirements
begin
(* loop invariant preserved, loopInv3 *)
lemma
assumes st0_constants:"(constants st0)"
	and st0_boundary:"((substate t0 st0) \<and> ((st0 = t0) \<or> (toEnvP st0)))"
	and loop_invariant:"(\<forall> sa144. ((((substate t0 sa144) \<and> (substate sa144 st0)) \<and> ((sa144 = t0) \<or> (toEnvP sa144))) \<longrightarrow> (loopInv3 t0 sa144)))"
	and st0_condition_0:"((theInt (getVarVal st0 ''#r'' [])) < (theInt (getVarVal st0 ''#ROWS'' [])))"
	and st0_assume_0:"((theInt (getVarVal st0 ''#placed'' [])) \<ge> ((theInt (getVarVal st0 ''#r'' [])) * (theInt (getVarVal st0 ''#COLS'' []))))"
	and st1:"st1=(setVarVal st0 ''#c'' [] (ValInt 0))"
	and st2:"toEnvP st2 \<and> substate st1 st2"
	and st2_invariant:"(\<forall> sa152. ((((substate st1 sa152) \<and> (substate sa152 st2)) \<and> ((sa152 = st1) \<or> (toEnvP sa152))) \<longrightarrow> (loopInv4 st1 sa152)))"
	and st2_frame:"(((((((((((((((((((getVarVal st2 ''#BAY_COUNT'' []) = (getVarVal st1 ''#BAY_COUNT'' [])) \<and> ((getVarVal st2 ''#ROWS'' []) = (getVarVal st1 ''#ROWS'' []))) \<and> ((getVarVal st2 ''#COLS'' []) = (getVarVal st1 ''#COLS'' []))) \<and> ((getVarVal st2 ''#FULL'' []) = (getVarVal st1 ''#FULL'' []))) \<and> ((getVarVal st2 ''#bay'' []) = (getVarVal st1 ''#bay'' []))) \<and> ((getVarVal st2 ''#scanned'' []) = (getVarVal st1 ''#scanned'' []))) \<and> ((getVarVal st2 ''#toLeft'' []) = (getVarVal st1 ''#toLeft'' []))) \<and> ((getVarVal st2 ''#toRight'' []) = (getVarVal st1 ''#toRight'' []))) \<and> ((getVarVal st2 ''#i'' []) = (getVarVal st1 ''#i'' []))) \<and> ((getVarVal st2 ''#j'' []) = (getVarVal st1 ''#j'' []))) \<and> ((getVarVal st2 ''#r'' []) = (getVarVal st1 ''#r'' []))) \<and> ((getVarVal st2 ''sensors_0'' []) = (getVarVal st1 ''sensors_0'' []))) \<and> ((getVarVal st2 ''sensors_1'' []) = (getVarVal st1 ''sensors_1'' []))) \<and> ((getVarVal st2 ''drives_0'' []) = (getVarVal st1 ''drives_0'' []))) \<and> ((getVarVal st2 ''drives_1'' []) = (getVarVal st1 ''drives_1'' []))) \<and> ((getVarVal st2 ''drives_2'' []) = (getVarVal st1 ''drives_2'' []))) \<and> ((getPstate st2 ''Palletiser'') = (getPstate st1 ''Palletiser''))) \<and> ((getPstate st2 ''Watchdog'') = (getPstate st1 ''Watchdog'')))"
	and st2_condition_1:"(\<not> ((theInt (getVarVal st2 ''#c'' [])) < (theInt (getVarVal st2 ''#COLS'' []))))"
	and st3:"st3=(setVarVal st2 ''#r'' [] (ValInt ((theInt (getVarVal st2 ''#r'' [])) + 1)))"
	and st_final:"st_final=st3"
shows "(\<forall> sa154. ((((substate t0 sa154) \<and> (substate sa154 (toEnv st3))) \<and> ((sa154 = t0) \<or> (toEnvP sa154))) \<longrightarrow> (loopInv3 t0 sa154)))"
  (* Open: no proof is recorded for this condition in palletStation.proofs,
     which says why. *)
  sorry
end
