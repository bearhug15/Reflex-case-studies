theory SmartLighting_VC82
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
	and st4_condition_93:"(\<not> (getVarBool st4 ''inp_0''))"
	and st4_condition_94:"(ltime st4 ''Motion'' \<ge> 300000)"
	and st5:"st5=(setVarBool st4 ''_turnedOn'' False)"
	and st6:"st6=setPstate st5 ''Motion'' ''noMovement''"
	and st6_state:"getPstate st6 ''Lighting''=''morningOrDay''"
	and st7:"st7=(setVarBool st6 ''out_1'' False)"
	and st7_condition_105:"(getVarBool st7 ''_turnedOn'')"
	and st8:"st8=(setVarBool st7 ''out_0'' True)"
	and st8_condition_107:"(ltime st8 ''Lighting'' < 0t11h30m)"
	and st9:"st9=toEnv st8"
	and st_final:"st_final=st9"
shows "inv(st_final)"
end