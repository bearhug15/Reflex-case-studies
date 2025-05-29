theory SmartLighting_VC223
	imports SmartLightingTheory Requirements
begin
lemma
assumes base_inv:"inv(st0)"
	and st1:"st1=(setVarBool st0 ''inp_1'' inp_1)"
	and st2:"st2=(setVarBool st1 ''inp_0'' inp_0)"
	and st2_state:"getPstate st2 ''Init''=''stop''"
	and st2_state:"getPstate st2 ''Motion''=''movement''"
	and st2_condition_277:"(\<not> (getVarBool st2 ''inp_0''))"
	and st2_condition_278:"(ltime st2 ''Motion'' \<ge> 300000)"
	and st3:"st3=(setVarBool st2 ''_turnedOn'' False)"
	and st4:"st4=setPstate st3 ''Motion'' ''noMovement''"
	and st4_state:"getPstate st4 ''Lighting''=''morningLighting''"
	and st4_condition_287:"(ltime st4 ''Lighting'' \<ge> 1800000)"
	and st5:"st5=(setVarInt st4 ''out_2'' 3)"
	and st6:"st6=setPstate st5 ''Lighting'' ''morningOrDay''"
	and st7:"st7=toEnv st6"
	and st_final:"st_final=st7"
shows "inv(st_final)"
end