theory BottleFilling_VC317
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
	and st6_state:"getPstate st6 ''Initialization''=''keepSterilization''"
	and st6_condition_0:"(\<not> (theBool (getVarVal st6 ''inp_2'' [])))"
	and st7:"st7=(setVarVal st6 ''out_1'' [] (ValBool (theBool (getVarVal st6 ''#TURNED_ON'' []))))"
	and st7_state:"getPstate st7 ''MainLoop''=''waitForNextBottle''"
	and st7_condition_1:"(\<not> (getPstate st7 ''NextBottle'' = ''stop'' \<or> getPstate st7 ''NextBottle'' = ''error''))"
	and st7_state:"getPstate st7 ''ForceSterilization''=''heatUp''"
	and st8:"st8=(setVarVal st7 ''out_1'' [] (ValBool (theBool (getVarVal st7 ''#TURNED_ON'' []))))"
	and st8_condition_2:"(theBool (getVarVal st8 ''inp_3'' []))"
	and st9:"st9=setPstate st8 ''ForceSterilization'' ''sterilizationFor1min''"
	and st10:"st10=reset st9 ''ForceSterilization''"
	and st10_state:"getPstate st10 ''NextBottle''=''waitBottlePosition''"
	and st10_condition_3:"(theBool (getVarVal st10 ''inp_5'' []))"
	and st11:"st11=(setVarVal st10 ''out_3'' [] (ValBool (theBool (getVarVal st10 ''#TURNED_OFF'' []))))"
	and st12:"st12=setPstate st11 ''NextBottle'' ''stop''"
	and st13:"st13=reset st12 ''NextBottle''"
	and st14:"st14=toEnv st13"
	and st_final:"st_final=st14"
shows "inv(st_final)"
  (* Open: no proof is recorded for this condition in bottleFilling.proofs,
     which says why. *)
  sorry
end
