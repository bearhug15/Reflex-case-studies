theory SmartLighting_VC346
	imports SmartLightingTheory Requirements
begin
lemma
assumes base_inv:"inv(st0)"
	and st1:"st1=(setVarBool st0 ''inp_1'' inp_1)"
	and st2:"st2=(setVarBool st1 ''inp_0'' inp_0)"
	and st2_state:"getPstate st2 ''Init''=''error''"
	and st2_state:"getPstate st2 ''Motion''=''movement''"
	and st2_condition_414:"(getVarBool st2 ''inp_0'')"
	and st3:"st3=reset st2"
	and st3_condition_438:"(ltime st3 ''Motion'' < 300000)"
	and st3_state:"getPstate st3 ''Lighting''=''earlyMorning''"
	and st3_condition_441:"(getVarBool st3 ''_turnedOn'')"
	and st4:"st4=(setVarBool st3 ''out_1'' True)"
	and st4_condition_443:"(ltime st4 ''Lighting'' < 0t30m)"
	and st5:"st5=toEnv st4"
	and st_final:"st_final=st5"
shows "inv(st_final)"
end