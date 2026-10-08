theory BottleFilling_VC180
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
	and st8_state:"getPstate st8 ''MainLoop''=''stop''"
	and st8_state:"getPstate st8 ''ForceSterilization''=''sterilizationFor1min''"
	and st8_timeout_1:"(ltime st8 ''ForceSterilization'' < 60000)"
	and st8_state:"getPstate st8 ''NextBottle''=''begin''"
	and st9:"st9=(setVarVal st8 ''out_3'' [] (ValBool (theBool (getVarVal st8 ''#TURNED_ON'' []))))"
	and st9_condition_2:"(\<not> (theBool (getVarVal st9 ''inp_5'' [])))"
	and st10:"st10=setPstate st9 ''NextBottle'' ''waitBottlePosition''"
	and st11:"st11=reset st10 ''NextBottle''"
	and st12:"st12=toEnv st11"
	and st_final:"st_final=st12"
shows "inv(st_final)"
  (* Open: no proof is recorded for this condition in bottleFilling.proofs,
     which says why. *)
  sorry
end
