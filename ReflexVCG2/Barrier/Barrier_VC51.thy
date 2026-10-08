theory Barrier_VC51
	imports BarrierTheory Requirements
begin
lemma
assumes base_inv:"inv(st0)"
	and st1:"st1=(setVarBool st0 ''inp_3'' inp_3)"
	and st2:"st2=(setVarBool st1 ''inp_2'' inp_2)"
	and st3:"st3=(setVarBool st2 ''inp_1'' inp_1)"
	and st4:"st4=(setVarBool st3 ''inp_0'' inp_0)"
	and st4_state:"getPstate st4 ''CarController''=''stop''"
	and st4_state:"getPstate st4 ''Opening''=''open''"
	and st4_condition_62:"(getVarBool st4 ''inp_1'')"
	and st5:"st5=reset st4"
	and st5_condition_63:"(ltime st5 ''Opening'' \<ge> 600000)"
	and st6:"st6=(setVarBool st5 ''out_1'' True)"
	and st7:"st7=(setVarBool st6 ''out_2'' False)"
	and st8:"st8=(setVarBool st7 ''out_3'' True)"
	and st9:"st9=setPstate st8 ''Opening'' ''closing''"
	and st10:"st10=toEnv st9"
	and st_final:"st_final=st10"
shows "inv(st_final)"
end