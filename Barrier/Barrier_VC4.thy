theory Barrier_VC4
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
	and st7_condition_5:"(ltime st7 ''Opening'' < 600000)"
	and st8:"st8=toEnv st7"
	and st_final:"st_final=st8"
shows "inv(st_final)"
end