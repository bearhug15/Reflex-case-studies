theory Barrier_VC16
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
	and st6_state:"getPstate st6 ''Opening''=''open''"
	and st6_condition_1:"(\<not> (theBool (getVarVal st6 ''inp_1'' [])))"
	and st6_timeout_2:"(ltime st6 ''Opening'' \<ge> (theNat (getVarVal st_final ''#open_time'' [])))"
	and st7:"st7=(setVarVal st6 ''out_1'' [] (ValBool True))"
	and st8:"st8=(setVarVal st7 ''out_2'' [] (ValBool False))"
	and st9:"st9=(setVarVal st8 ''out_3'' [] (ValBool True))"
	and st10:"st10=setPstate st9 ''Opening'' ''closing''"
	and st11:"st11=reset st10 ''Opening''"
	and st12:"st12=toEnv st11"
	and st_final:"st_final=st12"
shows "inv(st_final)"
  (* Open: no proof is recorded for this condition in barrier.proofs,
     which says why. *)
  sorry
end
