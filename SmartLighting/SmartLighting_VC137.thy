theory SmartLighting_VC137
	imports SmartLightingTheory Requirements
begin
lemma
assumes base_inv:"inv(st0)"
	and st1:"st1=(setVarBool st0 ''inp_1'' inp_1)"
	and st2:"st2=(setVarBool st1 ''inp_0'' inp_0)"
	and st2_state:"getPstate st2 ''Init''=''init''"
	and st3:"st3=setPstate st2 ''Lighting'' ''night''"
	and st4:"st4=setPstate st3 ''Init'' ''stop''"
	and st4_state:"getPstate st4 ''Motion''=''error''"
	and st4_state:"getPstate st4 ''Lighting''=''morningOrDay''"
	and st5:"st5=(setVarBool st4 ''out_1'' False)"
	and st5_condition_175:"(\<not> (getVarBool st5 ''_turnedOn''))"
	and st6:"st6=(setVarBool st5 ''out_0'' False)"
	and st6_condition_176:"(ltime st6 ''Lighting'' \<ge> 0t11h30m)"
	and st7:"st7=(setVarInt st6 ''out_2'' 4)"
	and st8:"st8=setPstate st7 ''Lighting'' ''evening''"
	and st9:"st9=toEnv st8"
	and st_final:"st_final=st9"
shows "inv(st_final)"
end