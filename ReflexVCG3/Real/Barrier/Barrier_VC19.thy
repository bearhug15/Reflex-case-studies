theory Barrier_VC19
	imports BarrierTheory LoopInvariants Requirements
begin
lemma
assumes base_inv:"inv(st0)"
	and st0_boundary:"toEnvP st0"
	and st1:"st1=(setVarVal st0 ''inp_0'' [] (ValBool inp_0))"
	and st2:"st2=(setVarVal st1 ''inp_1'' [] (ValBool inp_1))"
	and st3:"st3=(setVarVal st2 ''inp_2'' [] (ValBool inp_2))"
	and st4:"st4=(setVarVal st3 ''inp_3'' [] (ValBool inp_3))"
	and st4_state:"getPstate st4 ''CarController''=''waitingForCarPassing''"
	and st4_condition_0:"(\<not> (theBool (getVarVal st4 ''inp_0'' [])))"
	and st5:"st5=setPstate st4 ''CarController'' ''waitingForCar''"
	and st6:"st6=reset st5 ''CarController''"
	and st6_state:"getPstate st6 ''Opening''=''closing''"
	and st6_condition_1:"(\<not> (theBool (getVarVal st6 ''inp_3'' [])))"
	and st6_condition_2:"(theBool (getVarVal st6 ''inp_1'' []))"
	and st7:"st7=(setVarVal st6 ''out_1'' [] (ValBool False))"
	and st7_condition_3:"(\<not> (theBool (getVarVal st7 ''inp_2'' [])))"
	and st8:"st8=(setVarVal st7 ''out_0'' [] (ValBool True))"
	and st9:"st9=setPstate st8 ''Opening'' ''opening''"
	and st10:"st10=reset st9 ''Opening''"
	and st11:"st11=toEnv st10"
	and st_final:"st_final=st11"
shows "inv(st_final)"
  (* Open: no proof is recorded for this condition in barrier.proofs,
     which says why. *)
  sorry
end
