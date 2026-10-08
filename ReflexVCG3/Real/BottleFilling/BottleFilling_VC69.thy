theory BottleFilling_VC69
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
	and st8_state:"getPstate st8 ''MainLoop''=''waitForNextBottle''"
	and st8_condition_1:"(getPstate st8 ''NextBottle'' = ''stop'' \<or> getPstate st8 ''NextBottle'' = ''error'')"
	and st9:"st9=setPstate st8 ''MainLoop'' ''waitForFilling''"
	and st10:"st10=reset st9 ''MainLoop''"
	and st10_state:"getPstate st10 ''ForceSterilization''=''stop''"
	and st10_state:"getPstate st10 ''NextBottle''=''stop''"
	and st11:"st11=toEnv st10"
	and st_final:"st_final=st11"
shows "inv(st_final)"
  (* Open: no proof is recorded for this condition in bottleFilling.proofs,
     which says why. *)
  sorry
end
