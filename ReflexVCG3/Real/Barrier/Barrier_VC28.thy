theory Barrier_VC28
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
	and st4_condition_0:"(\<not> (\<not> (theBool (getVarVal st4 ''inp_0'' []))))"
	and st4_state:"getPstate st4 ''Opening''=''closing''"
	and st4_condition_1:"(theBool (getVarVal st4 ''inp_3'' []))"
	and st5:"st5=(setVarVal st4 ''out_1'' [] (ValBool False))"
	and st6:"st6=setPstate st5 ''Opening'' ''stop''"
	and st7:"st7=reset st6 ''Opening''"
	and st8:"st8=toEnv st7"
	and st_final:"st_final=st8"
shows "inv(st_final)"
  (* Open: no proof is recorded for this condition in barrier.proofs,
     which says why. *)
  sorry
end
