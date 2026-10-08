theory SmartLighting_VC129
	imports SmartLightingTheory Requirements
begin
lemma
assumes base_inv:"inv(st0)"
	and st1:"st1=(setVarBool st0 ''inp_1'' inp_1)"
	and st2:"st2=(setVarBool st1 ''inp_0'' inp_0)"
	and st2_state:"getPstate st2 ''Init''=''init''"
	and st3:"st3=setPstate st2 ''Lighting'' ''night''"
	and st4:"st4=setPstate st3 ''Init'' ''stop''"
	and st4_state:"getPstate st4 ''Motion''=''error''"
	and st4_state:"getPstate st4 ''Lighting''=''earlyMorning''"
	and st4_condition_164:"(getVarBool st4 ''_turnedOn'')"
	and st5:"st5=(setVarBool st4 ''out_1'' True)"
	and st5_condition_165:"(ltime st5 ''Lighting'' \<ge> 0t30m)"
	and st6:"st6=(setVarInt st5 ''out_2'' 2)"
	and st7:"st7=(setVarBool st6 ''out_1'' True)"
	and st8:"st8=setPstate st7 ''Lighting'' ''morningLighting''"
	and st9:"st9=toEnv st8"
	and st_final:"st_final=st9"
shows "inv(st_final)"
end