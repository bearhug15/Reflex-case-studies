theory SmartLighting_VC421
	imports SmartLightingTheory Requirements
begin
lemma
assumes base_inv:"inv(st0)"
	and st1:"st1=(setVarBool st0 ''inp_1'' inp_1)"
	and st2:"st2=(setVarBool st1 ''inp_0'' inp_0)"
	and st2_state:"getPstate st2 ''Init''=''error''"
	and st2_state:"getPstate st2 ''Motion''=''error''"
	and st2_state:"getPstate st2 ''Lighting''=''morningLighting''"
	and st2_condition_538:"(ltime st2 ''Lighting'' \<ge> 1800000)"
	and st3:"st3=(setVarInt st2 ''out_2'' 3)"
	and st4:"st4=setPstate st3 ''Lighting'' ''morningOrDay''"
	and st5:"st5=toEnv st4"
	and st_final:"st_final=st5"
shows "inv(st_final)"
end