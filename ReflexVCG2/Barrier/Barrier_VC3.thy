theory Barrier_VC3
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
	and st6_state:"getPstate st6 ''Opening''=''open''"
	and st6_condition_3:"(getVarBool st6 ''inp_1'')"
	and st7:"st7=reset st6"
	and st7_condition_4:"(ltime st7 ''Opening'' \<ge> 600000)"
	and st8:"st8=(setVarBool st7 ''out_1'' True)"
	and st9:"st9=(setVarBool st8 ''out_2'' False)"
	and st10:"st10=(setVarBool st9 ''out_3'' True)"
	and st11:"st11=setPstate st10 ''Opening'' ''closing''"
	and st12:"st12=toEnv st11"
	and st_final:"st_final=st12"
shows "inv(st_final)"
end