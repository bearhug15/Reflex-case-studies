theory SmartLighting_VC426
	imports SmartLightingTheory Requirements
begin
lemma
assumes base_inv:"inv(st0)"
	and st1:"st1=(setVarBool st0 ''inp_1'' inp_1)"
	and st2:"st2=(setVarBool st1 ''inp_0'' inp_0)"
	and st2_state:"getPstate st2 ''Init''=''error''"
	and st2_state:"getPstate st2 ''Motion''=''error''"
	and st2_state:"getPstate st2 ''Lighting''=''morningOrDay''"
	and st3:"st3=(setVarBool st2 ''out_1'' False)"
	and st3_condition_543:"(\<not> (getVarBool st3 ''_turnedOn''))"
	and st4:"st4=(setVarBool st3 ''out_0'' False)"
	and st4_condition_545:"(ltime st4 ''Lighting'' < 0t11h30m)"
	and st5:"st5=toEnv st4"
	and st_final:"st_final=st5"
shows "inv(st_final)"
end