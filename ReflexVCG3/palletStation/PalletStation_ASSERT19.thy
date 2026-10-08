theory PalletStation_ASSERT19
	imports PalletStationTheory LoopInvariants Requirements
begin
(* assert at line 168: [assert: jam ==> !moving] *)
lemma
assumes base_inv:"inv(st0)"
	and st0_boundary:"toEnvP st0"
	and st1:"st1=(setVarVal st0 ''sensors_0'' [] (ValBool sensors_0))"
	and st2:"st2=(setVarVal st1 ''sensors_1'' [] (ValBool sensors_1))"
	and st2_state:"getPstate st2 ''Palletiser''=''scanning''"
	and st3:"st3=(setVarVal st2 ''drives_2'' [] (ValBool False))"
	and st4:"st4=(setVarVal st3 ''#scanned'' [] (ValInt 0))"
	and st4_assume_0:"(\<forall> k. (((0 \<le> k) \<and> (k < (theInt (getVarVal st4 ''#BAY_COUNT'' [])))) \<longrightarrow> ((theInt (getVarVal st4 ''#bay'' [(AccessIndex (nat k))])) \<ge> 0)))"
	and st5:"st5=(setVarVal st4 ''#i'' [] (ValInt 0))"
	and st6:"toEnvP st6 \<and> substate st5 st6"
	and st6_invariant:"(\<forall> sa61. ((((substate st5 sa61) \<and> (substate sa61 st6)) \<and> ((sa61 = st5) \<or> (toEnvP sa61))) \<longrightarrow> (loopInv0 st5 sa61)))"
	and st6_frame:"((((((((((((((((((((getVarVal st6 ''#BAY_COUNT'' []) = (getVarVal st5 ''#BAY_COUNT'' [])) \<and> ((getVarVal st6 ''#ROWS'' []) = (getVarVal st5 ''#ROWS'' []))) \<and> ((getVarVal st6 ''#COLS'' []) = (getVarVal st5 ''#COLS'' []))) \<and> ((getVarVal st6 ''#FULL'' []) = (getVarVal st5 ''#FULL'' []))) \<and> ((getVarVal st6 ''#bay'' []) = (getVarVal st5 ''#bay'' []))) \<and> ((getVarVal st6 ''#cell'' []) = (getVarVal st5 ''#cell'' []))) \<and> ((getVarVal st6 ''#toLeft'' []) = (getVarVal st5 ''#toLeft'' []))) \<and> ((getVarVal st6 ''#toRight'' []) = (getVarVal st5 ''#toRight'' []))) \<and> ((getVarVal st6 ''#placed'' []) = (getVarVal st5 ''#placed'' []))) \<and> ((getVarVal st6 ''#j'' []) = (getVarVal st5 ''#j'' []))) \<and> ((getVarVal st6 ''#r'' []) = (getVarVal st5 ''#r'' []))) \<and> ((getVarVal st6 ''#c'' []) = (getVarVal st5 ''#c'' []))) \<and> ((getVarVal st6 ''sensors_0'' []) = (getVarVal st5 ''sensors_0'' []))) \<and> ((getVarVal st6 ''sensors_1'' []) = (getVarVal st5 ''sensors_1'' []))) \<and> ((getVarVal st6 ''drives_0'' []) = (getVarVal st5 ''drives_0'' []))) \<and> ((getVarVal st6 ''drives_1'' []) = (getVarVal st5 ''drives_1'' []))) \<and> ((getVarVal st6 ''drives_2'' []) = (getVarVal st5 ''drives_2'' []))) \<and> ((getPstate st6 ''Palletiser'') = (getPstate st5 ''Palletiser''))) \<and> ((getPstate st6 ''Watchdog'') = (getPstate st5 ''Watchdog'')))"
	and st6_condition_0:"(\<not> ((theInt (getVarVal st6 ''#i'' [])) < (theInt (getVarVal st6 ''#BAY_COUNT'' []))))"
	and st6_condition_1:"((theInt (getVarVal st6 ''#scanned'' [])) > 0)"
	and st7:"st7=setPstate st6 ''Palletiser'' ''sorting''"
	and st8:"st8=reset st7 ''Palletiser''"
	and st8_state:"getPstate st8 ''Watchdog''=''watching''"
shows "((theBool (getVarVal st8 ''sensors_1'' [])) \<longrightarrow> (\<not> ((theBool (getVarVal st8 ''drives_0'' [])) \<or> (theBool (getVarVal st8 ''drives_1'' [])))))"
  (* Open: no proof is recorded for this condition in palletStation.proofs,
     which says why. *)
  sorry
end
