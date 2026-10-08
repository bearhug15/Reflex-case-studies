theory BottleFilling_VC1
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
	and st8_condition_0:"(theBool (getVarVal st8 ''inp_1'' []))"
	and st9:"st9=(setVarVal st8 ''out_0'' [] (ValBool (theBool (getVarVal st8 ''#TURNED_OFF'' []))))"
	and st10:"st10=setPstate st9 ''ForceSterilization'' ''heatUp''"
	and st11:"st11=setPstate st10 ''Initialization'' ''waitForSterilization''"
	and st12:"st12=reset st11 ''Initialization''"
	and st12_state:"getPstate st12 ''MainLoop''=''begin''"
	and st13:"st13=setPstate st12 ''NextBottle'' ''begin''"
	and st14:"st14=setPstate st13 ''MainLoop'' ''waitForNextBottle''"
	and st15:"st15=reset st14 ''MainLoop''"
	and st15_state:"getPstate st15 ''ForceSterilization''=''heatUp''"
	and st16:"st16=(setVarVal st15 ''out_1'' [] (ValBool (theBool (getVarVal st15 ''#TURNED_ON'' []))))"
	and st16_condition_1:"(theBool (getVarVal st16 ''inp_3'' []))"
	and st17:"st17=setPstate st16 ''ForceSterilization'' ''sterilizationFor1min''"
	and st18:"st18=reset st17 ''ForceSterilization''"
	and st18_state:"getPstate st18 ''NextBottle''=''begin''"
	and st19:"st19=(setVarVal st18 ''out_3'' [] (ValBool (theBool (getVarVal st18 ''#TURNED_ON'' []))))"
	and st19_condition_2:"(\<not> (theBool (getVarVal st19 ''inp_5'' [])))"
	and st20:"st20=setPstate st19 ''NextBottle'' ''waitBottlePosition''"
	and st21:"st21=reset st20 ''NextBottle''"
	and st22:"st22=toEnv st21"
	and st_final:"st_final=st22"
shows "inv(st_final)"
  (* Open: no proof is recorded for this condition in bottleFilling.proofs,
     which says why. *)
  sorry
end
