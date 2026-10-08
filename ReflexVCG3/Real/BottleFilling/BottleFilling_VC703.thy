theory BottleFilling_VC703
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
	and st6_condition_0:"(\<not> (\<not> (theBool (getVarVal st6 ''inp_2'' []))))"
	and st6_condition_1:"(\<not> (theBool (getVarVal st6 ''inp_3'' [])))"
	and st6_state:"getPstate st6 ''MainLoop''=''stop''"
	and st6_state:"getPstate st6 ''ForceSterilization''=''stop''"
	and st6_state:"getPstate st6 ''NextBottle''=''waitBottlePosition''"
	and st6_condition_2:"(\<not> (theBool (getVarVal st6 ''inp_5'' [])))"
	and st7:"st7=toEnv st6"
	and st_final:"st_final=st7"
shows "inv(st_final)"
  (* Open: no proof is recorded for this condition in bottleFilling.proofs,
     which says why. *)
  sorry
end
