theory SmartLighting_VC183
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
	and st5_state:"getPstate st5 ''Lighting''=''earlyMorning''"
	and st5_condition_234:"(getVarBool st5 ''_turnedOn'')"
	and st6:"st6=(setVarBool st5 ''out_1'' True)"
	and st6_condition_235:"(ltime st6 ''Lighting'' \<ge> 0t30m)"
	and st7:"st7=(setVarInt st6 ''out_2'' 2)"
	and st8:"st8=(setVarBool st7 ''out_1'' True)"
	and st9:"st9=setPstate st8 ''Lighting'' ''morningLighting''"
	and st10:"st10=toEnv st9"
	and st_final:"st_final=st10"
shows "inv(st_final)"
end