theory SmartLighting_VC345
	imports SmartLightingTheory Requirements
begin
lemma
assumes base_inv:"inv(st0)"
	and st1:"st1=(setVarBool st0 ''inp_1'' inp_1)"
	and st2:"st2=(setVarBool st1 ''inp_0'' inp_0)"
	and st2_state:"getPstate st2 ''Init''=''error''"
	and st2_state:"getPstate st2 ''Motion''=''movement''"
	and st2_condition_414:"(getVarBool st2 ''inp_0'')"
	and st3:"st3=reset st2"
	and st3_condition_438:"(ltime st3 ''Motion'' < 300000)"
	and st3_state:"getPstate st3 ''Lighting''=''earlyMorning''"
	and st3_condition_441:"(getVarBool st3 ''_turnedOn'')"
	and st4:"st4=(setVarBool st3 ''out_1'' True)"
	and st4_condition_442:"(ltime st4 ''Lighting'' \<ge> 0t30m)"
	and st5:"st5=(setVarInt st4 ''out_2'' 2)"
	and st6:"st6=(setVarBool st5 ''out_1'' True)"
	and st7:"st7=setPstate st6 ''Lighting'' ''morningLighting''"
	and st8:"st8=toEnv st7"
	and st_final:"st_final=st8"
shows "inv(st_final)"
end