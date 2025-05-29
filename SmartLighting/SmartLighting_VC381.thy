theory SmartLighting_VC381
	imports SmartLightingTheory Requirements
begin
lemma
assumes base_inv:"inv(st0)"
	and st1:"st1=(setVarBool st0 ''inp_1'' inp_1)"
	and st2:"st2=(setVarBool st1 ''inp_0'' inp_0)"
	and st2_state:"getPstate st2 ''Init''=''error''"
	and st2_state:"getPstate st2 ''Motion''=''movement''"
	and st2_condition_461:"(\<not> (getVarBool st2 ''inp_0''))"
	and st2_condition_485:"(ltime st2 ''Motion'' < 300000)"
	and st2_state:"getPstate st2 ''Lighting''=''earlyMorning''"
	and st2_condition_488:"(getVarBool st2 ''_turnedOn'')"
	and st3:"st3=(setVarBool st2 ''out_1'' True)"
	and st3_condition_489:"(ltime st3 ''Lighting'' \<ge> 0t30m)"
	and st4:"st4=(setVarInt st3 ''out_2'' 2)"
	and st5:"st5=(setVarBool st4 ''out_1'' True)"
	and st6:"st6=setPstate st5 ''Lighting'' ''morningLighting''"
	and st7:"st7=toEnv st6"
	and st_final:"st_final=st7"
shows "inv(st_final)"
end