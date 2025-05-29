theory Barrier_VC1
	imports BarrierTheory Requirements
begin
lemma
assumes base_inv:"inv(st0)"
	and st1:"st1=(setVarBool st0 ''inp_3'' inp_3)"
	and st2:"st2=(setVarBool st1 ''inp_2'' inp_2)"
	and st3:"st3=(setVarBool st2 ''inp_1'' inp_1)"
	and st4:"st4=(setVarBool st3 ''inp_0'' inp_0)"
	and st4_state:"getPstate st4 ''CarController''=''waitingForCar''"
	and st4_condition_0:"(getVarBool st4 ''inp_0'')"
	and st5:"st5=setPstate st4 ''Opening'' ''opening''"
	and st6:"st6=setPstate st5 ''CarController'' ''waitingForCarPassing''"
	and st6_state:"getPstate st6 ''Opening''=''opening''"
	and st7:"st7=(setVarBool st6 ''out_0'' True)"
	and st8:"st8=(setVarBool st7 ''out_1'' False)"
	and st8_condition_1:"(getVarBool st8 ''inp_2'')"
	and st9:"st9=(setVarBool st8 ''out_0'' False)"
	and st10:"st10=(setVarBool st9 ''out_3'' False)"
	and st11:"st11=(setVarBool st10 ''out_2'' True)"
	and st12:"st12=setPstate st11 ''Opening'' ''open''"
	and st13:"st13=toEnv st12"
	and st_final:"st_final=st13"
shows "inv(st_final)"
end