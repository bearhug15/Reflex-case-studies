theory BottleFilling_VC193
	imports BottleFillingTheory LoopInvariants Requirements
begin
lemma
assumes base_inv:"inv(st0)"
	and st0_boundary:"toEnvP st0"
	and st1:"st1=(setVarVal st0 ''inp_0'' [] (ValBool inp_0))"
	and st2:"st2=(setVarVal st1 ''inp_1'' [] (ValBool inp_1))"
	and st3:"st3=(setVarVal st2 ''inp_2'' [] (ValBool inp_2))"
	and st4:"st4=(setVarVal st3 ''inp_3'' [] (ValBool inp_3))"
	and st5:"st5=(setVarVal st4 ''inp_4'' [] (ValBool inp_4))"
	and st6:"st6=(setVarVal st5 ''inp_5'' [] (ValBool inp_5))"
	and st6_state:"getPstate st6 ''Initialization''=''waitForSterilization''"
	and st6_condition_0:"(\<not> (getPstate st6 ''ForceSterilization'' = ''stop'' \<or> getPstate st6 ''ForceSterilization'' = ''error''))"
	and st6_state:"getPstate st6 ''MainLoop''=''begin''"
	and st7:"st7=setPstate st6 ''NextBottle'' ''begin''"
	and st8:"st8=setPstate st7 ''MainLoop'' ''waitForNextBottle''"
	and st9:"st9=reset st8 ''MainLoop''"
	and st9_state:"getPstate st9 ''ForceSterilization''=''heatUp''"
	and st10:"st10=(setVarVal st9 ''out_1'' [] (ValBool (theBool (getVarVal st9 ''#TURNED_ON'' []))))"
	and st10_condition_1:"(theBool (getVarVal st10 ''inp_3'' []))"
	and st11:"st11=setPstate st10 ''ForceSterilization'' ''sterilizationFor1min''"
	and st12:"st12=reset st11 ''ForceSterilization''"
	and st12_state:"getPstate st12 ''NextBottle''=''begin''"
	and st13:"st13=(setVarVal st12 ''out_3'' [] (ValBool (theBool (getVarVal st12 ''#TURNED_ON'' []))))"
	and st13_condition_2:"(\<not> (\<not> (theBool (getVarVal st13 ''inp_5'' []))))"
	and st14:"st14=toEnv st13"
	and st_final:"st_final=st14"
shows "inv(st_final)"
  (* Open: no proof is recorded for this condition in bottleFilling.proofs,
     which says why. *)
  sorry
end
