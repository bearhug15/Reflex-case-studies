theory Barrier_VC0
	imports BarrierTheory LoopInvariants Requirements
begin
lemma
assumes st0:"st0=emptyState"
	and st1:"st1=(setVarVal st0 ''inp_0'' [] (ValBool inp_0))"
	and st2:"st2=(setVarVal st1 ''inp_1'' [] (ValBool inp_1))"
	and st3:"st3=(setVarVal st2 ''inp_2'' [] (ValBool inp_2))"
	and st4:"st4=(setVarVal st3 ''inp_3'' [] (ValBool inp_3))"
	and st5:"st5=(setVarVal st4 ''#open_time'' [] (ValNat 600000))"
	and st6:"st6=setPstate st5 ''CarController'' ''waitingForCar''"
	and st7:"st7=toEnv st6"
	and st_final:"st_final=st7"
shows "inv(st_final)"
  (* Open: no proof is recorded for this condition in barrier.proofs,
     which says why. *)
  sorry
end
