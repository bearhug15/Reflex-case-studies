theory SmartLighting_VC195
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
	and st3_condition_231:"(ltime st3 ''Motion'' \<ge> 300000)"
	and st4:"st4=(setVarBool st3 ''_turnedOn'' False)"
	and st5:"st5=setPstate st4 ''Motion'' ''noMovement''"
	and st5_state:"getPstate st5 ''Lighting''=''evening''"
	and st6:"st6=(setVarBool st5 ''out_0'' False)"
	and st6_condition_251:"(\<not> (getVarBool st6 ''_turnedOn''))"
	and st7:"st7=(setVarBool st6 ''out_1'' False)"
	and st7_condition_252:"(ltime st7 ''Lighting'' \<ge> 0t6h)"
	and st8:"st8=(setVarBool st7 ''out_1'' False)"
	and st9:"st9=(setVarInt st8 ''out_2'' 0)"
	and st10:"st10=(setVarBool st9 ''_turnedOn'' False)"
	and st11:"st11=setPstate st10 ''Motion'' ''stop''"
	and st12:"st12=setPstate st11 ''Lighting'' ''night''"
	and st13:"st13=toEnv st12"
	and st_final:"st_final=st13"
shows "inv(st_final)"
end