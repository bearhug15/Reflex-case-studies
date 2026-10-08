theory BottleFilling_VC16
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
	and st12_state:"getPstate st12 ''MainLoop''=''waitForFilling''"
	and st13:"st13=(setVarVal st12 ''out_2'' [] (ValBool (theBool (getVarVal st12 ''#TURNED_ON'' []))))"
	and st13_condition_1:"(theBool (getVarVal st13 ''inp_4'' []))"
	and st14:"st14=(setVarVal st13 ''out_2'' [] (ValBool (theBool (getVarVal st13 ''#TURNED_OFF'' []))))"
	and st14_condition_2:"(\<not> (theBool (getVarVal st14 ''inp_0'' [])))"
	and st15:"st15=setPstate st14 ''Initialization'' ''begin''"
	and st16:"st16=setPstate st15 ''MainLoop'' ''stop''"
	and st17:"st17=reset st16 ''MainLoop''"
	and st17_state:"getPstate st17 ''ForceSterilization''=''heatUp''"
	and st18:"st18=(setVarVal st17 ''out_1'' [] (ValBool (theBool (getVarVal st17 ''#TURNED_ON'' []))))"
	and st18_condition_3:"(theBool (getVarVal st18 ''inp_3'' []))"
	and st19:"st19=setPstate st18 ''ForceSterilization'' ''sterilizationFor1min''"
	and st20:"st20=reset st19 ''ForceSterilization''"
	and st20_state:"getPstate st20 ''NextBottle''=''begin''"
	and st21:"st21=(setVarVal st20 ''out_3'' [] (ValBool (theBool (getVarVal st20 ''#TURNED_ON'' []))))"
	and st21_condition_4:"(\<not> (\<not> (theBool (getVarVal st21 ''inp_5'' []))))"
	and st22:"st22=toEnv st21"
	and st_final:"st_final=st22"
shows "inv(st_final)"
  (* Open: no proof is recorded for this condition in bottleFilling.proofs,
     which says why. *)
  sorry
end
