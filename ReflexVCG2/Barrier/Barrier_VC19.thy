theory Barrier_VC19
	imports BarrierTheory Requirements
begin
lemma
assumes base_inv:"inv(st0)"
	and st1:"st1=(setVarBool st0 ''inp_3'' inp_3)"
	and st2:"st2=(setVarBool st1 ''inp_2'' inp_2)"
	and st3:"st3=(setVarBool st2 ''inp_1'' inp_1)"
	and st4:"st4=(setVarBool st3 ''inp_0'' inp_0)"
	and st4_state:"getPstate st4 ''CarController''=''waitingForCar''"
	and st4_condition_15:"(\<not> (getVarBool st4 ''inp_0''))"
	and st4_state:"getPstate st4 ''Opening''=''closing''"
	and st4_condition_24:"(getVarBool st4 ''inp_3'')"
	and st5:"st5=(setVarBool st4 ''out_1'' False)"
	and st6:"st6=setPstate st5 ''Opening'' ''stop''"
	and st7:"st7=toEnv st6"
	and st_final:"st_final=st7"
shows "inv(st_final)"
end