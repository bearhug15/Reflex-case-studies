theory SmartLighting_VC366
	imports SmartLightingTheory Requirements
begin
lemma
assumes base_inv:"inv(st0)"
	and st1:"st1=(setVarBool st0 ''inp_1'' inp_1)"
	and st2:"st2=(setVarBool st1 ''inp_0'' inp_0)"
	and st2_state:"getPstate st2 ''Init''=''error''"
	and st2_state:"getPstate st2 ''Motion''=''movement''"
	and st2_condition_461:"(\<not> (getVarBool st2 ''inp_0''))"
	and st2_condition_462:"(ltime st2 ''Motion'' \<ge> 300000)"
	and st3:"st3=(setVarBool st2 ''_turnedOn'' False)"
	and st4:"st4=setPstate st3 ''Motion'' ''noMovement''"
	and st4_state:"getPstate st4 ''Lighting''=''earlyMorning''"
	and st4_condition_468:"(\<not> (getVarBool st4 ''_turnedOn''))"
	and st5:"st5=(setVarBool st4 ''out_1'' False)"
	and st5_condition_470:"(ltime st5 ''Lighting'' < 0t30m)"
	and st6:"st6=toEnv st5"
	and st_final:"st_final=st6"
shows "inv(st_final)"
end