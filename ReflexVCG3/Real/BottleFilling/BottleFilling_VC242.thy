theory BottleFilling_VC242
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
	and st6_state:"getPstate st6 ''MainLoop''=''waitForFilling''"
	and st7:"st7=(setVarVal st6 ''out_2'' [] (ValBool (theBool (getVarVal st6 ''#TURNED_ON'' []))))"
	and st7_condition_1:"(theBool (getVarVal st7 ''inp_4'' []))"
	and st8:"st8=(setVarVal st7 ''out_2'' [] (ValBool (theBool (getVarVal st7 ''#TURNED_OFF'' []))))"
	and st8_condition_2:"(\<not> (\<not> (theBool (getVarVal st8 ''inp_0'' []))))"
	and st9:"st9=setPstate st8 ''MainLoop'' ''begin''"
	and st10:"st10=reset st9 ''MainLoop''"
	and st10_state:"getPstate st10 ''ForceSterilization''=''heatUp''"
	and st11:"st11=(setVarVal st10 ''out_1'' [] (ValBool (theBool (getVarVal st10 ''#TURNED_ON'' []))))"
	and st11_condition_3:"(theBool (getVarVal st11 ''inp_3'' []))"
	and st12:"st12=setPstate st11 ''ForceSterilization'' ''sterilizationFor1min''"
	and st13:"st13=reset st12 ''ForceSterilization''"
	and st13_state:"getPstate st13 ''NextBottle''=''waitBottlePosition''"
	and st13_condition_4:"(theBool (getVarVal st13 ''inp_5'' []))"
	and st14:"st14=(setVarVal st13 ''out_3'' [] (ValBool (theBool (getVarVal st13 ''#TURNED_OFF'' []))))"
	and st15:"st15=setPstate st14 ''NextBottle'' ''stop''"
	and st16:"st16=reset st15 ''NextBottle''"
	and st17:"st17=toEnv st16"
	and st_final:"st_final=st17"
shows "inv(st_final)"
  (* Open: no proof is recorded for this condition in bottleFilling.proofs,
     which says why. *)
  sorry
end
