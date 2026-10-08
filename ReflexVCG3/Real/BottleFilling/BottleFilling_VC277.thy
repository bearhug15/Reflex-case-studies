theory BottleFilling_VC277
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
	and st7_condition_1:"(\<not> (theBool (getVarVal st7 ''inp_4'' [])))"
	and st7_state:"getPstate st7 ''ForceSterilization''=''sterilizationFor1min''"
	and st7_timeout_2:"(ltime st7 ''ForceSterilization'' < 60000)"
	and st7_state:"getPstate st7 ''NextBottle''=''waitBottlePosition''"
	and st7_condition_3:"(theBool (getVarVal st7 ''inp_5'' []))"
	and st8:"st8=(setVarVal st7 ''out_3'' [] (ValBool (theBool (getVarVal st7 ''#TURNED_OFF'' []))))"
	and st9:"st9=setPstate st8 ''NextBottle'' ''stop''"
	and st10:"st10=reset st9 ''NextBottle''"
	and st11:"st11=toEnv st10"
	and st_final:"st_final=st11"
shows "inv(st_final)"
  (* Open: no proof is recorded for this condition in bottleFilling.proofs,
     which says why. *)
  sorry
end
