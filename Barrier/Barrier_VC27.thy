theory Barrier_VC27
	imports BarrierTheory Requirements
begin
lemma
assumes base_inv:"inv(st0)"
	and st1:"st1=(setVarBool st0 ''inp_3'' inp_3)"
	and st2:"st2=(setVarBool st1 ''inp_2'' inp_2)"
	and st3:"st3=(setVarBool st2 ''inp_1'' inp_1)"
	and st4:"st4=(setVarBool st3 ''inp_0'' inp_0)"
	and st4_state:"getPstate st4 ''CarController''=''waitingForCarPassing''"
	and st4_condition_30:"(\<not> (getVarBool st4 ''inp_0''))"
	and st5:"st5=setPstate st4 ''CarController'' ''waitingForCar''"
	and st5_state:"getPstate st5 ''Opening''=''open''"
	and st5_condition_33:"(getVarBool st5 ''inp_1'')"
	and st6:"st6=reset st5"
	and st6_condition_34:"(ltime st6 ''Opening'' \<ge> 600000)"
	and st7:"st7=(setVarBool st6 ''out_1'' True)"
	and st8:"st8=(setVarBool st7 ''out_2'' False)"
	and st9:"st9=(setVarBool st8 ''out_3'' True)"
	and st10:"st10=setPstate st9 ''Opening'' ''closing''"
	and st11:"st11=toEnv st10"
	and st_final:"st_final=st11"
shows "inv(st_final)"
end