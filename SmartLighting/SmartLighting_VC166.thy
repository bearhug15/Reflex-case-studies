theory SmartLighting_VC166
	imports SmartLightingTheory Requirements
begin
lemma
assumes base_inv:"inv(st0)"
	and st1:"st1=(setVarBool st0 ''inp_1'' inp_1)"
	and st2:"st2=(setVarBool st1 ''inp_0'' inp_0)"
	and st2_state:"getPstate st2 ''Init''=''stop''"
	and st2_state:"getPstate st2 ''Motion''=''noMovement''"
	and st2_condition_207:"(\<not> ((getVarBool (setVarBool st2 ''inp_1'' False) ''inp_0'') \<and> (getVarBool (setVarBool st2 ''inp_1'' False) ''inp_1'')))"
	and st3:"st3=(setVarBool st2 ''inp_1'' False)"
	and st3_state:"getPstate st3 ''Lighting''=''earlyMorning''"
	and st3_condition_210:"(getVarBool st3 ''_turnedOn'')"
	and st4:"st4=(setVarBool st3 ''out_1'' True)"
	and st4_condition_212:"(ltime st4 ''Lighting'' < 0t30m)"
	and st5:"st5=toEnv st4"
	and st_final:"st_final=st5"
shows "inv(st_final)"
end