theory SmartLighting_VC24
	imports SmartLightingTheory Requirements
begin
lemma
assumes base_inv:"inv(st0)"
	and st1:"st1=(setVarBool st0 ''inp_1'' inp_1)"
	and st2:"st2=(setVarBool st1 ''inp_0'' inp_0)"
	and st2_state:"getPstate st2 ''Init''=''init''"
	and st3:"st3=setPstate st2 ''Lighting'' ''night''"
	and st4:"st4=setPstate st3 ''Init'' ''stop''"
	and st4_state:"getPstate st4 ''Motion''=''noMovement''"
	and st4_condition_23:"(\<not> ((getVarBool (setVarBool st4 ''inp_1'' False) ''inp_0'') \<and> (getVarBool (setVarBool st4 ''inp_1'' False) ''inp_1'')))"
	and st5:"st5=(setVarBool st4 ''inp_1'' False)"
	and st5_state:"getPstate st5 ''Lighting''=''earlyMorning''"
	and st5_condition_29:"(\<not> (getVarBool st5 ''_turnedOn''))"
	and st6:"st6=(setVarBool st5 ''out_1'' False)"
	and st6_condition_31:"(ltime st6 ''Lighting'' < 0t30m)"
	and st7:"st7=toEnv st6"
	and st_final:"st_final=st7"
shows "inv(st_final)"
end