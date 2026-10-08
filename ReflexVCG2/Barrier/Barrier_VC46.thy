theory Barrier_VC46
	imports BarrierTheory Requirements
begin
lemma
assumes base_inv:"inv(st0)"
	and st1:"st1=(setVarBool st0 ''inp_3'' inp_3)"
	and st2:"st2=(setVarBool st1 ''inp_2'' inp_2)"
	and st3:"st3=(setVarBool st2 ''inp_1'' inp_1)"
	and st4:"st4=(setVarBool st3 ''inp_0'' inp_0)"
	and st4_state:"getPstate st4 ''CarController''=''waitingForCarPassing''"
	and st4_condition_45:"(\<not> (\<not> (getVarBool st4 ''inp_0'')))"
	and st4_state:"getPstate st4 ''Opening''=''closing''"
	and st4_condition_55:"(\<not> (getVarBool st4 ''inp_3''))"
	and st4_condition_59:"(\<not> (getVarBool st4 ''inp_1''))"
	and st5:"st5=toEnv st4"
	and st_final:"st_final=st5"
shows "inv(st_final)"
end