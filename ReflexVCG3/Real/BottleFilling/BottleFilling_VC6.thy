theory BottleFilling_VC6
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
	and st12_state:"getPstate st12 ''MainLoop''=''waitForNextBottle''"
	and st12_condition_1:"(getPstate st12 ''NextBottle'' = ''stop'' \<or> getPstate st12 ''NextBottle'' = ''error'')"
	and st13:"st13=setPstate st12 ''MainLoop'' ''waitForFilling''"
	and st14:"st14=reset st13 ''MainLoop''"
	and st14_state:"getPstate st14 ''ForceSterilization''=''heatUp''"
	and st15:"st15=(setVarVal st14 ''out_1'' [] (ValBool (theBool (getVarVal st14 ''#TURNED_ON'' []))))"
	and st15_condition_2:"(\<not> (theBool (getVarVal st15 ''inp_3'' [])))"
	and st15_state:"getPstate st15 ''NextBottle''=''stop''"
	and st16:"st16=toEnv st15"
	and st_final:"st_final=st16"
shows "inv(st_final)"
  (* Open: no proof is recorded for this condition in bottleFilling.proofs,
     which says why. *)
  sorry
end
