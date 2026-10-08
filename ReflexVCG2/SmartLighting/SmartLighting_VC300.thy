theory SmartLighting_VC300
	imports SmartLightingTheory Requirements
begin
lemma
assumes base_inv:"inv(st0)"
	and st1:"st1=(setVarBool st0 ''inp_1'' inp_1)"
	and st2:"st2=(setVarBool st1 ''inp_0'' inp_0)"
	and st2_state:"getPstate st2 ''Init''=''error''"
	and st2_state:"getPstate st2 ''Motion''=''noMovement''"
	and st2_condition_368:"((getVarBool (setVarBool st2 ''inp_1'' False) ''inp_0'') \<and> (getVarBool (setVarBool st2 ''inp_1'' False) ''inp_1''))"
	and st3:"st3=(setVarBool st2 ''inp_1'' False)"
	and st4:"st4=(setVarBool st3 ''_turnedOn'' True)"
	and st5:"st5=setPstate st4 ''Motion'' ''movement''"
	and st5_state:"getPstate st5 ''Lighting''=''morningOrDay''"
	and st6:"st6=(setVarBool st5 ''out_1'' False)"
	and st6_condition_382:"(\<not> (getVarBool st6 ''_turnedOn''))"
	and st7:"st7=(setVarBool st6 ''out_0'' False)"
	and st7_condition_384:"(ltime st7 ''Lighting'' < 0t11h30m)"
	and st8:"st8=toEnv st7"
	and st_final:"st_final=st8"
shows "inv(st_final)"
end