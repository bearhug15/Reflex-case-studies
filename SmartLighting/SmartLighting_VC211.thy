theory SmartLighting_VC211
	imports SmartLightingTheory Requirements
begin
lemma
assumes base_inv:"inv(st0)"
	and st1:"st1=(setVarBool st0 ''inp_1'' inp_1)"
	and st2:"st2=(setVarBool st1 ''inp_0'' inp_0)"
	and st2_state:"getPstate st2 ''Init''=''stop''"
	and st2_state:"getPstate st2 ''Motion''=''movement''"
	and st2_condition_230:"(getVarBool st2 ''inp_0'')"
	and st3:"st3=reset st2"
	and st3_condition_254:"(ltime st3 ''Motion'' < 300000)"
	and st3_state:"getPstate st3 ''Lighting''=''evening''"
	and st4:"st4=(setVarBool st3 ''out_0'' False)"
	and st4_condition_271:"(getVarBool st4 ''_turnedOn'')"
	and st5:"st5=(setVarBool st4 ''out_1'' True)"
	and st5_condition_272:"(ltime st5 ''Lighting'' \<ge> 0t6h)"
	and st6:"st6=(setVarBool st5 ''out_1'' False)"
	and st7:"st7=(setVarInt st6 ''out_2'' 0)"
	and st8:"st8=(setVarBool st7 ''_turnedOn'' False)"
	and st9:"st9=setPstate st8 ''Motion'' ''stop''"
	and st10:"st10=setPstate st9 ''Lighting'' ''night''"
	and st11:"st11=toEnv st10"
	and st_final:"st_final=st11"
shows "inv(st_final)"
end