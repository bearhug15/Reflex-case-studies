theory PalletStation_VC24
	imports PalletStationTheory LoopInvariants Requirements
begin
lemma
assumes base_inv:"inv(st0)"
	and st0_boundary:"toEnvP st0"
	and st1:"st1=(setVarVal st0 ''sensors_0'' [] (ValBool sensors_0))"
	and st2:"st2=(setVarVal st1 ''sensors_1'' [] (ValBool sensors_1))"
	and st2_state:"getPstate st2 ''Palletiser''=''sorting''"
	and st3:"st3=(setVarVal st2 ''drives_0'' [] (ValBool True))"
	and st4:"st4=(setVarVal st3 ''drives_1'' [] (ValBool False))"
	and st5:"st5=(setVarVal st4 ''#toLeft'' [] (ValInt 0))"
	and st6:"st6=(setVarVal st5 ''#toRight'' [] (ValInt 0))"
	and st6_assume_0:"(\<forall> k. (((0 \<le> k) \<and> (k < (theInt (getVarVal st6 ''#BAY_COUNT'' [])))) \<longrightarrow> ((theInt (getVarVal st6 ''#bay'' [(AccessIndex (nat k))])) \<ge> 0)))"
	and st7:"st7=(setVarVal st6 ''#i'' [] (ValInt 0))"
	and st8:"toEnvP st8 \<and> substate st7 st8"
	and st8_invariant:"(\<forall> sa102. ((((substate st7 sa102) \<and> (substate sa102 st8)) \<and> ((sa102 = st7) \<or> (toEnvP sa102))) \<longrightarrow> (loopInv1 st7 sa102)))"
	and st8_frame:"((((((((((((((((((((getVarVal st8 ''#BAY_COUNT'' []) = (getVarVal st7 ''#BAY_COUNT'' [])) \<and> ((getVarVal st8 ''#ROWS'' []) = (getVarVal st7 ''#ROWS'' []))) \<and> ((getVarVal st8 ''#COLS'' []) = (getVarVal st7 ''#COLS'' []))) \<and> ((getVarVal st8 ''#FULL'' []) = (getVarVal st7 ''#FULL'' []))) \<and> ((getVarVal st8 ''#bay'' []) = (getVarVal st7 ''#bay'' []))) \<and> ((getVarVal st8 ''#cell'' []) = (getVarVal st7 ''#cell'' []))) \<and> ((getVarVal st8 ''#scanned'' []) = (getVarVal st7 ''#scanned'' []))) \<and> ((getVarVal st8 ''#toRight'' []) = (getVarVal st7 ''#toRight'' []))) \<and> ((getVarVal st8 ''#placed'' []) = (getVarVal st7 ''#placed'' []))) \<and> ((getVarVal st8 ''#j'' []) = (getVarVal st7 ''#j'' []))) \<and> ((getVarVal st8 ''#r'' []) = (getVarVal st7 ''#r'' []))) \<and> ((getVarVal st8 ''#c'' []) = (getVarVal st7 ''#c'' []))) \<and> ((getVarVal st8 ''sensors_0'' []) = (getVarVal st7 ''sensors_0'' []))) \<and> ((getVarVal st8 ''sensors_1'' []) = (getVarVal st7 ''sensors_1'' []))) \<and> ((getVarVal st8 ''drives_0'' []) = (getVarVal st7 ''drives_0'' []))) \<and> ((getVarVal st8 ''drives_1'' []) = (getVarVal st7 ''drives_1'' []))) \<and> ((getVarVal st8 ''drives_2'' []) = (getVarVal st7 ''drives_2'' []))) \<and> ((getPstate st8 ''Palletiser'') = (getPstate st7 ''Palletiser''))) \<and> ((getPstate st8 ''Watchdog'') = (getPstate st7 ''Watchdog'')))"
	and st8_condition_0:"(\<not> ((theInt (getVarVal st8 ''#i'' [])) < (theInt (getVarVal st8 ''#BAY_COUNT'' []))))"
	and st8_assume_1:"((theInt (getVarVal st8 ''#toRight'' [])) = 0)"
	and st9:"st9=(setVarVal st8 ''#j'' [] (ValInt 0))"
	and st10:"toEnvP st10 \<and> substate st9 st10"
	and st10_invariant:"(\<forall> sa114. ((((substate st9 sa114) \<and> (substate sa114 st10)) \<and> ((sa114 = st9) \<or> (toEnvP sa114))) \<longrightarrow> (loopInv2 st9 sa114)))"
	and st10_frame:"((((((((((((((((((((getVarVal st10 ''#BAY_COUNT'' []) = (getVarVal st9 ''#BAY_COUNT'' [])) \<and> ((getVarVal st10 ''#ROWS'' []) = (getVarVal st9 ''#ROWS'' []))) \<and> ((getVarVal st10 ''#COLS'' []) = (getVarVal st9 ''#COLS'' []))) \<and> ((getVarVal st10 ''#FULL'' []) = (getVarVal st9 ''#FULL'' []))) \<and> ((getVarVal st10 ''#bay'' []) = (getVarVal st9 ''#bay'' []))) \<and> ((getVarVal st10 ''#cell'' []) = (getVarVal st9 ''#cell'' []))) \<and> ((getVarVal st10 ''#scanned'' []) = (getVarVal st9 ''#scanned'' []))) \<and> ((getVarVal st10 ''#toLeft'' []) = (getVarVal st9 ''#toLeft'' []))) \<and> ((getVarVal st10 ''#placed'' []) = (getVarVal st9 ''#placed'' []))) \<and> ((getVarVal st10 ''#i'' []) = (getVarVal st9 ''#i'' []))) \<and> ((getVarVal st10 ''#r'' []) = (getVarVal st9 ''#r'' []))) \<and> ((getVarVal st10 ''#c'' []) = (getVarVal st9 ''#c'' []))) \<and> ((getVarVal st10 ''sensors_0'' []) = (getVarVal st9 ''sensors_0'' []))) \<and> ((getVarVal st10 ''sensors_1'' []) = (getVarVal st9 ''sensors_1'' []))) \<and> ((getVarVal st10 ''drives_0'' []) = (getVarVal st9 ''drives_0'' []))) \<and> ((getVarVal st10 ''drives_1'' []) = (getVarVal st9 ''drives_1'' []))) \<and> ((getVarVal st10 ''drives_2'' []) = (getVarVal st9 ''drives_2'' []))) \<and> ((getPstate st10 ''Palletiser'') = (getPstate st9 ''Palletiser''))) \<and> ((getPstate st10 ''Watchdog'') = (getPstate st9 ''Watchdog'')))"
	and st10_condition_1:"(\<not> ((theInt (getVarVal st10 ''#j'' [])) < (theInt (getVarVal st10 ''#BAY_COUNT'' []))))"
	and st11:"st11=setPstate st10 ''Palletiser'' ''packing''"
	and st12:"st12=reset st11 ''Palletiser''"
	and st12_state:"getPstate st12 ''Watchdog''=''watching''"
	and st13:"st13=toEnv st12"
	and st_final:"st_final=st13"
shows "inv(st_final)"
  (* Open: no proof is recorded for this condition in palletStation.proofs,
     which says why. *)
  sorry
end
