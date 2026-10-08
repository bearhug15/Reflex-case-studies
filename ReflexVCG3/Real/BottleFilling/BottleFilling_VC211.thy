theory BottleFilling_VC211
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
	and st6_state:"getPstate st6 ''MainLoop''=''waitForNextBottle''"
	and st6_condition_1:"(\<not> (getPstate st6 ''NextBottle'' = ''stop'' \<or> getPstate st6 ''NextBottle'' = ''error''))"
	and st6_state:"getPstate st6 ''ForceSterilization''=''heatUp''"
	and st7:"st7=(setVarVal st6 ''out_1'' [] (ValBool (theBool (getVarVal st6 ''#TURNED_ON'' []))))"
	and st7_condition_2:"(\<not> (theBool (getVarVal st7 ''inp_3'' [])))"
	and st7_state:"getPstate st7 ''NextBottle''=''waitBottlePosition''"
	and st7_condition_3:"(\<not> (theBool (getVarVal st7 ''inp_5'' [])))"
	and st8:"st8=toEnv st7"
	and st_final:"st_final=st8"
shows "inv(st_final)"
  (* Open: no proof is recorded for this condition in bottleFilling.proofs,
     which says why. *)
  sorry
end
