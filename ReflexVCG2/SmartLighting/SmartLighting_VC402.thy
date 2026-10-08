theory SmartLighting_VC402
	imports SmartLightingTheory Requirements
begin
lemma
assumes base_inv:"inv(st0)"
	and st1:"st1=(setVarBool st0 ''inp_1'' inp_1)"
	and st2:"st2=(setVarBool st1 ''inp_0'' inp_0)"
	and st2_state:"getPstate st2 ''Init''=''error''"
	and st2_state:"getPstate st2 ''Motion''=''stop''"
	and st2_state:"getPstate st2 ''Lighting''=''earlyMorning''"
	and st2_condition_513:"(\<not> (getVarBool st2 ''_turnedOn''))"
	and st3:"st3=(setVarBool st2 ''out_1'' False)"
	and st3_condition_515:"(ltime st3 ''Lighting'' < 0t30m)"
	and st4:"st4=toEnv st3"
	and st_final:"st_final=st4"
shows "inv(st_final)"
end