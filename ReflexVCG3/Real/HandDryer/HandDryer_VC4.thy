theory HandDryer_VC4
	imports HandDryerTheory LoopInvariants Requirements
begin
lemma
assumes base_inv:"inv(st0)"
	and st0_boundary:"toEnvP st0"
	and st1:"st1=(setVarVal st0 ''inp_1'' [] (ValBool inp_1))"
	and st1_state:"getPstate st1 ''Dryer''=''Work''"
	and st1_condition_0:"(\<not> (theBool (getVarVal st1 ''inp_1'' [])))"
	and st1_timeout_1:"(ltime st1 ''Dryer'' \<ge> (theNat (getVarVal st_final ''#TIMEOUT'' [])))"
	and st2:"st2=(setVarVal st1 ''out_1'' [] (ValBool (theBool (getVarVal st1 ''#OFF'' []))))"
	and st3:"st3=setPstate st2 ''Dryer'' ''Wait''"
	and st4:"st4=reset st3 ''Dryer''"
	and st5:"st5=toEnv st4"
	and st_final:"st_final=st5"
shows "inv(st_final)"
  (* Open: no proof is recorded for this condition in handDryer.proofs,
     which says why. *)
  sorry
end
