theory SmartLighting_VC236
	imports SmartLightingTheory Requirements
begin
lemma
assumes base_inv:"inv(st0)"
	and st1:"st1=(setVarBool st0 ''inp_1'' inp_1)"
	and st2:"st2=(setVarBool st1 ''inp_0'' inp_0)"
	and st2_state:"getPstate st2 ''Init''=''stop''"
	and st2_state:"getPstate st2 ''Motion''=''movement''"
	and st2_condition_277:"(\<not> (getVarBool st2 ''inp_0''))"
	and st2_condition_301:"(ltime st2 ''Motion'' < 300000)"
	and st2_state:"getPstate st2 ''Lighting''=''night''"
	and st2_condition_303:"(ltime st2 ''Lighting'' < 0t6h)"
	and st3:"st3=toEnv st2"
	and st_final:"st_final=st3"
shows "inv(st_final)"
end