theory SmartLighting_VC405
	imports SmartLightingTheory Requirements
begin
lemma
assumes base_inv:"inv(st0)"
	and st1:"st1=(setVarBool st0 ''inp_1'' inp_1)"
	and st2:"st2=(setVarBool st1 ''inp_0'' inp_0)"
	and st2_state:"getPstate st2 ''Init''=''error''"
	and st2_state:"getPstate st2 ''Motion''=''stop''"
	and st2_state:"getPstate st2 ''Lighting''=''morningOrDay''"
	and st3:"st3=(setVarBool st2 ''out_1'' False)"
	and st3_condition_518:"(getVarBool st3 ''_turnedOn'')"
	and st4:"st4=(setVarBool st3 ''out_0'' True)"
	and st4_condition_519:"(ltime st4 ''Lighting'' \<ge> 0t11h30m)"
	and st5:"st5=(setVarInt st4 ''out_2'' 4)"
	and st6:"st6=setPstate st5 ''Lighting'' ''evening''"
	and st7:"st7=toEnv st6"
	and st_final:"st_final=st7"
shows "inv(st_final)"
end