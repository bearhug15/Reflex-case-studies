theory Barrier_VC53
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
	and st4_condition_65:"(\<not> (getVarBool st4 ''inp_1''))"
	and st4_condition_66:"(ltime st4 ''Opening'' \<ge> 600000)"
	and st5:"st5=(setVarBool st4 ''out_1'' True)"
	and st6:"st6=(setVarBool st5 ''out_2'' False)"
	and st7:"st7=(setVarBool st6 ''out_3'' True)"
	and st8:"st8=setPstate st7 ''Opening'' ''closing''"
	and st9:"st9=toEnv st8"
	and st_final:"st_final=st9"
shows "inv(st_final)"
end