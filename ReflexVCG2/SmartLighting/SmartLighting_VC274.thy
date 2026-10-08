theory SmartLighting_VC274
	imports SmartLightingTheory Requirements
begin
lemma
assumes base_inv:"inv(st0)"
	and st1:"st1=(setVarBool st0 ''inp_1'' inp_1)"
	and st2:"st2=(setVarBool st1 ''inp_0'' inp_0)"
	and st2_state:"getPstate st2 ''Init''=''stop''"
	and st2_state:"getPstate st2 ''Motion''=''error''"
	and st2_state:"getPstate st2 ''Lighting''=''earlyMorning''"
	and st2_condition_348:"(getVarBool st2 ''_turnedOn'')"
	and st3:"st3=(setVarBool st2 ''out_1'' True)"
	and st3_condition_350:"(ltime st3 ''Lighting'' < 0t30m)"
	and st4:"st4=toEnv st3"
	and st_final:"st_final=st4"
shows "inv(st_final)"
end