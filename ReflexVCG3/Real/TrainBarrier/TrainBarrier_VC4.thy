theory TrainBarrier_VC4
	imports TrainBarrierTheory LoopInvariants Requirements
begin
lemma
assumes base_inv:"inv(st0)"
	and st0_boundary:"toEnvP st0"
	and st1:"st1=(setVarVal st0 ''inp_0'' [] (ValBool inp_0))"
	and st2:"st2=(setVarVal st1 ''inp_1'' [] (ValBool inp_1))"
	and st3:"st3=(setVarVal st2 ''inp_2'' [] (ValBool inp_2))"
	and st3_state:"getPstate st3 ''Control''=''closing''"
	and st3_condition_0:"(\<not> (\<not> (theBool (getVarVal st3 ''inp_0'' []))))"
	and st3_condition_1:"(theBool (getVarVal st3 ''inp_2'' []))"
	and st4:"st4=(setVarVal st3 ''out_1'' [] (ValBool False))"
	and st5:"st5=setPstate st4 ''Control'' ''closed''"
	and st6:"st6=reset st5 ''Control''"
	and st7:"st7=toEnv st6"
	and st_final:"st_final=st7"
shows "inv(st_final)"
  (* Open: no proof is recorded for this condition in trainBarrier.proofs,
     which says why. *)
  sorry
end
