theory HandDryer_VC2
	imports HandDryerTheory LoopInvariants Requirements
begin
lemma
assumes base_inv:"inv(st0)"
	and st0_boundary:"toEnvP st0"
	and st1:"st1=(setVarVal st0 ''inp_1'' [] (ValBool inp_1))"
	and st1_state:"getPstate st1 ''Dryer''=''Wait''"
	and st1_condition_0:"(\<not> (theBool (getVarVal st1 ''inp_1'' [])))"
	and st2:"st2=toEnv st1"
	and st_final:"st_final=st2"
shows "inv(st_final)"
  (* Open: no proof is recorded for this condition in handDryer.proofs,
     which says why. *)
  sorry
end
