theory PalletStation_VC61
	imports PalletStationTheory LoopInvariants Requirements
begin
lemma
assumes base_inv:"inv(st0)"
	and st0_boundary:"toEnvP st0"
	and st1:"st1=(setVarVal st0 ''sensors_0'' [] (ValBool sensors_0))"
	and st2:"st2=(setVarVal st1 ''sensors_1'' [] (ValBool sensors_1))"
	and st2_state:"getPstate st2 ''Palletiser''=''packing''"
	and st3:"st3=(setVarVal st2 ''drives_0'' [] (ValBool False))"
	and st4:"st4=(setVarVal st3 ''drives_1'' [] (ValBool True))"
	and st5:"st5=(setVarVal st4 ''#placed'' [] (ValInt 0))"
	and st5_assume_0:"(((theInt (getVarVal st5 ''#FULL'' [])) - (theInt (getVarVal st5 ''#placed'' []))) > 0)"
	and st6:"st6=(setVarVal st5 ''#r'' [] (ValInt 0))"
	and st7:"toEnvP st7 \<and> substate st6 st7"
	and st7_invariant:"(\<forall> sa231. ((((substate st6 sa231) \<and> (substate sa231 st7)) \<and> ((sa231 = st6) \<or> (toEnvP sa231))) \<longrightarrow> (loopInv3 st6 sa231)))"
	and st7_frame:"((((((((((((((((((getVarVal st7 ''#BAY_COUNT'' []) = (getVarVal st6 ''#BAY_COUNT'' [])) \<and> ((getVarVal st7 ''#ROWS'' []) = (getVarVal st6 ''#ROWS'' []))) \<and> ((getVarVal st7 ''#COLS'' []) = (getVarVal st6 ''#COLS'' []))) \<and> ((getVarVal st7 ''#FULL'' []) = (getVarVal st6 ''#FULL'' []))) \<and> ((getVarVal st7 ''#bay'' []) = (getVarVal st6 ''#bay'' []))) \<and> ((getVarVal st7 ''#scanned'' []) = (getVarVal st6 ''#scanned'' []))) \<and> ((getVarVal st7 ''#toLeft'' []) = (getVarVal st6 ''#toLeft'' []))) \<and> ((getVarVal st7 ''#toRight'' []) = (getVarVal st6 ''#toRight'' []))) \<and> ((getVarVal st7 ''#i'' []) = (getVarVal st6 ''#i'' []))) \<and> ((getVarVal st7 ''#j'' []) = (getVarVal st6 ''#j'' []))) \<and> ((getVarVal st7 ''sensors_0'' []) = (getVarVal st6 ''sensors_0'' []))) \<and> ((getVarVal st7 ''sensors_1'' []) = (getVarVal st6 ''sensors_1'' []))) \<and> ((getVarVal st7 ''drives_0'' []) = (getVarVal st6 ''drives_0'' []))) \<and> ((getVarVal st7 ''drives_1'' []) = (getVarVal st6 ''drives_1'' []))) \<and> ((getVarVal st7 ''drives_2'' []) = (getVarVal st6 ''drives_2'' []))) \<and> ((getPstate st7 ''Palletiser'') = (getPstate st6 ''Palletiser''))) \<and> ((getPstate st7 ''Watchdog'') = (getPstate st6 ''Watchdog'')))"
	and st7_condition_0:"(\<not> ((theInt (getVarVal st7 ''#r'' [])) < (theInt (getVarVal st7 ''#ROWS'' []))))"
	and st7_condition_1:"(\<not> ((theInt (getVarVal st7 ''#placed'' [])) \<ge> (theInt (getVarVal st7 ''#FULL'' []))))"
	and st7_state:"getPstate st7 ''Watchdog''=''stop''"
	and st8:"st8=toEnv st7"
	and st_final:"st_final=st8"
shows "inv(st_final)"
  using assms by (auto simp add: setVarVal_def constants_def inv_def substate_refl loopInv0_def loopInv1_def loopInv2_def loopInv3_def loopInv4_def)
end
