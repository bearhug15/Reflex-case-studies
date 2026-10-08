theory BottleFilling_VC100
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
	and st6_state:"getPstate st6 ''Initialization''=''begin''"
	and st7:"st7=(setVarVal st6 ''out_0'' [] (ValBool (theBool (getVarVal st6 ''#TURNED_ON'' []))))"
	and st8:"st8=(setVarVal st7 ''out_1'' [] (ValBool (theBool (getVarVal st7 ''#TURNED_OFF'' []))))"
	and st8_condition_0:"(\<not> (theBool (getVarVal st8 ''inp_1'' [])))"
	and st8_state:"getPstate st8 ''MainLoop''=''waitForFilling''"
	and st9:"st9=(setVarVal st8 ''out_2'' [] (ValBool (theBool (getVarVal st8 ''#TURNED_ON'' []))))"
	and st9_condition_1:"(theBool (getVarVal st9 ''inp_4'' []))"
	and st10:"st10=(setVarVal st9 ''out_2'' [] (ValBool (theBool (getVarVal st9 ''#TURNED_OFF'' []))))"
	and st10_condition_2:"(\<not> (theBool (getVarVal st10 ''inp_0'' [])))"
	and st11:"st11=setPstate st10 ''Initialization'' ''begin''"
	and st12:"st12=setPstate st11 ''MainLoop'' ''stop''"
	and st13:"st13=reset st12 ''MainLoop''"
	and st13_state:"getPstate st13 ''ForceSterilization''=''sterilizationFor1min''"
	and st13_timeout_3:"(ltime st13 ''ForceSterilization'' \<ge> 60000)"
	and st14:"st14=(setVarVal st13 ''out_1'' [] (ValBool (theBool (getVarVal st13 ''#TURNED_OFF'' []))))"
	and st15:"st15=setPstate st14 ''ForceSterilization'' ''stop''"
	and st16:"st16=reset st15 ''ForceSterilization''"
	and st16_state:"getPstate st16 ''NextBottle''=''begin''"
	and st17:"st17=(setVarVal st16 ''out_3'' [] (ValBool (theBool (getVarVal st16 ''#TURNED_ON'' []))))"
	and st17_condition_4:"(\<not> (theBool (getVarVal st17 ''inp_5'' [])))"
	and st18:"st18=setPstate st17 ''NextBottle'' ''waitBottlePosition''"
	and st19:"st19=reset st18 ''NextBottle''"
	and st20:"st20=toEnv st19"
	and st_final:"st_final=st20"
shows "inv(st_final)"
  (* Open: no proof is recorded for this condition in bottleFilling.proofs,
     which says why. *)
  sorry
end
