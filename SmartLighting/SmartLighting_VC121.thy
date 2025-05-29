theory SmartLighting_VC121
	imports SmartLightingTheory Requirements
begin
lemma
assumes base_inv:"inv(st0)"
	and st1:"st1=(setVarBool st0 ''inp_1'' inp_1)"
	and st2:"st2=(setVarBool st1 ''inp_0'' inp_0)"
	and st2_state:"getPstate st2 ''Init''=''init''"
	and st3:"st3=setPstate st2 ''Lighting'' ''night''"
	and st4:"st4=setPstate st3 ''Init'' ''stop''"
	and st4_state:"getPstate st4 ''Motion''=''stop''"
	and st4_state:"getPstate st4 ''Lighting''=''evening''"
	and st5:"st5=(setVarBool st4 ''out_0'' False)"
	and st5_condition_156:"(getVarBool st5 ''_turnedOn'')"
	and st6:"st6=(setVarBool st5 ''out_1'' True)"
	and st6_condition_157:"(ltime st6 ''Lighting'' \<ge> 0t6h)"
	and st7:"st7=(setVarBool st6 ''out_1'' False)"
	and st8:"st8=(setVarInt st7 ''out_2'' 0)"
	and st9:"st9=(setVarBool st8 ''_turnedOn'' False)"
	and st10:"st10=setPstate st9 ''Motion'' ''stop''"
	and st11:"st11=setPstate st10 ''Lighting'' ''night''"
	and st12:"st12=toEnv st11"
	and st_final:"st_final=st12"
shows "inv(st_final)"
end