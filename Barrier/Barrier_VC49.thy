theory Barrier_VC49
	imports BarrierTheory Requirements
begin
lemma
assumes base_inv:"inv(st0)"
	and st1:"st1=(setVarBool st0 ''inp_3'' inp_3)"
	and st2:"st2=(setVarBool st1 ''inp_2'' inp_2)"
	and st3:"st3=(setVarBool st2 ''inp_1'' inp_1)"
	and st4:"st4=(setVarBool st3 ''inp_0'' inp_0)"
	and st4_state:"getPstate st4 ''CarController''=''stop''"
	and st4_state:"getPstate st4 ''Opening''=''opening''"
	and st5:"st5=(setVarBool st4 ''out_0'' True)"
	and st6:"st6=(setVarBool st5 ''out_1'' False)"
	and st6_condition_60:"(getVarBool st6 ''inp_2'')"
	and st7:"st7=(setVarBool st6 ''out_0'' False)"
	and st8:"st8=(setVarBool st7 ''out_3'' False)"
	and st9:"st9=(setVarBool st8 ''out_2'' True)"
	and st10:"st10=setPstate st9 ''Opening'' ''open''"
	and st11:"st11=toEnv st10"
	and st_final:"st_final=st11"
shows "inv(st_final)"
end