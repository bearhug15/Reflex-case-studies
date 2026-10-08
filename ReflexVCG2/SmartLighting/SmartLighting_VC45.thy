theory SmartLighting_VC45
	imports SmartLightingTheory Requirements
begin
lemma
assumes base_inv:"inv(st0)"
	and st1:"st1=(setVarBool st0 ''inp_1'' inp_1)"
	and st2:"st2=(setVarBool st1 ''inp_0'' inp_0)"
	and st2_state:"getPstate st2 ''Init''=''init''"
	and st3:"st3=setPstate st2 ''Lighting'' ''night''"
	and st4:"st4=setPstate st3 ''Init'' ''stop''"
	and st4_state:"getPstate st4 ''Motion''=''movement''"
	and st4_condition_46:"(getVarBool st4 ''inp_0'')"
	and st5:"st5=reset st4"
	and st5_condition_47:"(ltime st5 ''Motion'' \<ge> 300000)"
	and st6:"st6=(setVarBool st5 ''_turnedOn'' False)"
	and st7:"st7=setPstate st6 ''Motion'' ''noMovement''"
	and st7_state:"getPstate st7 ''Lighting''=''morningOrDay''"
	and st8:"st8=(setVarBool st7 ''out_1'' False)"
	and st8_condition_58:"(getVarBool st8 ''_turnedOn'')"
	and st9:"st9=(setVarBool st8 ''out_0'' True)"
	and st9_condition_59:"(ltime st9 ''Lighting'' \<ge> 0t11h30m)"
	and st10:"st10=(setVarInt st9 ''out_2'' 4)"
	and st11:"st11=setPstate st10 ''Lighting'' ''evening''"
	and st12:"st12=toEnv st11"
	and st_final:"st_final=st12"
shows "inv(st_final)"
end