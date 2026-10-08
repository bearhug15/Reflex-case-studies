theory BottleFilling_VC232
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
	and st8_condition_2:"(\<not> (theBool (getVarVal st8 ''inp_0'' [])))"
	and st9:"st9=setPstate st8 ''Initialization'' ''begin''"
	and st10:"st10=setPstate st9 ''MainLoop'' ''stop''"
	and st11:"st11=reset st10 ''MainLoop''"
	and st11_state:"getPstate st11 ''ForceSterilization''=''sterilizationFor1min''"
	and st11_timeout_3:"(ltime st11 ''ForceSterilization'' \<ge> 60000)"
	and st12:"st12=(setVarVal st11 ''out_1'' [] (ValBool (theBool (getVarVal st11 ''#TURNED_OFF'' []))))"
	and st13:"st13=setPstate st12 ''ForceSterilization'' ''stop''"
	and st14:"st14=reset st13 ''ForceSterilization''"
	and st14_state:"getPstate st14 ''NextBottle''=''waitBottlePosition''"
	and st14_condition_4:"(theBool (getVarVal st14 ''inp_5'' []))"
	and st15:"st15=(setVarVal st14 ''out_3'' [] (ValBool (theBool (getVarVal st14 ''#TURNED_OFF'' []))))"
	and st16:"st16=setPstate st15 ''NextBottle'' ''stop''"
	and st17:"st17=reset st16 ''NextBottle''"
	and st18:"st18=toEnv st17"
	and st_final:"st_final=st18"
shows "inv(st_final)"
  (* Open: no proof is recorded for this condition in bottleFilling.proofs,
     which says why. *)
  sorry
end
