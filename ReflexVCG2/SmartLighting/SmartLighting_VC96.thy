theory SmartLighting_VC96
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
	and st4_condition_117:"(ltime st4 ''Motion'' < 300000)"
	and st4_state:"getPstate st4 ''Lighting''=''earlyMorning''"
	and st4_condition_123:"(\<not> (getVarBool st4 ''_turnedOn''))"
	and st5:"st5=(setVarBool st4 ''out_1'' False)"
	and st5_condition_125:"(ltime st5 ''Lighting'' < 0t30m)"
	and st6:"st6=toEnv st5"
	and st_final:"st_final=st6"
shows "inv(st_final)"
end