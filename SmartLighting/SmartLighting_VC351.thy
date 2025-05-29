theory SmartLighting_VC351
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
	and st3_state:"getPstate st3 ''Lighting''=''morningOrDay''"
	and st4:"st4=(setVarBool st3 ''out_1'' False)"
	and st4_condition_449:"(getVarBool st4 ''_turnedOn'')"
	and st5:"st5=(setVarBool st4 ''out_0'' True)"
	and st5_condition_450:"(ltime st5 ''Lighting'' \<ge> 0t11h30m)"
	and st6:"st6=(setVarInt st5 ''out_2'' 4)"
	and st7:"st7=setPstate st6 ''Lighting'' ''evening''"
	and st8:"st8=toEnv st7"
	and st_final:"st_final=st8"
shows "inv(st_final)"
end