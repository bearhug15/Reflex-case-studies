theory Barrier_VC1
	imports BarrierTheory LoopInvariants Requirements
begin
lemma
assumes base_inv:"inv(st0)"
	and st0_boundary:"toEnvP st0"
	and st1:"st1=(setVarVal st0 ''inp_0'' [] (ValBool inp_0))"
	and st2:"st2=(setVarVal st1 ''inp_1'' [] (ValBool inp_1))"
	and st3:"st3=(setVarVal st2 ''inp_2'' [] (ValBool inp_2))"
	and st4:"st4=(setVarVal st3 ''inp_3'' [] (ValBool inp_3))"
	and st4_state:"getPstate st4 ''CarController''=''waitingForCar''"
	and st4_condition_0:"(theBool (getVarVal st4 ''inp_0'' []))"
	and st5:"st5=setPstate st4 ''Opening'' ''opening''"
	and st6:"st6=setPstate st5 ''CarController'' ''waitingForCarPassing''"
	and st7:"st7=reset st6 ''CarController''"
	and st7_state:"getPstate st7 ''Opening''=''opening''"
	and st8:"st8=(setVarVal st7 ''out_0'' [] (ValBool True))"
	and st9:"st9=(setVarVal st8 ''out_1'' [] (ValBool False))"
	and st9_condition_1:"(theBool (getVarVal st9 ''inp_2'' []))"
	and st10:"st10=(setVarVal st9 ''out_0'' [] (ValBool False))"
	and st11:"st11=(setVarVal st10 ''out_3'' [] (ValBool False))"
	and st12:"st12=(setVarVal st11 ''out_2'' [] (ValBool True))"
	and st13:"st13=setPstate st12 ''Opening'' ''open''"
	and st14:"st14=reset st13 ''Opening''"
	and st15:"st15=toEnv st14"
	and st_final:"st_final=st15"
shows "inv(st_final)"
  (* Open: no proof is recorded for this condition in barrier.proofs,
     which says why. *)
  sorry
end
