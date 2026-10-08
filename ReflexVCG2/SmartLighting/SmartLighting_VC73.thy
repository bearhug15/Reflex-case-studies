theory SmartLighting_VC73
	imports SmartLightingTheory Requirements
begin
lemma
assumes base_inv:"inv(st0)"
	and st1:"st1=(setVarBool st0 ''inp_1'' inp_1)"
	and st2:"st2=(setVarBool st1 ''inp_0'' inp_0)"
	and st2_state:"getPstate st2 ''Init''=''init''"
	and st3:"st3=setPstate st2 ''Lighting'' ''night''"
	and st4:"st4=setPstate st3 ''Init'' ''stop''"
	and st4_state:"getPstate st4 ''Motion''=''movement''"
	and st4_condition_93:"(\<not> (getVarBool st4 ''inp_0''))"
	and st4_condition_94:"(ltime st4 ''Motion'' \<ge> 300000)"
	and st5:"st5=(setVarBool st4 ''_turnedOn'' False)"
	and st6:"st6=setPstate st5 ''Motion'' ''noMovement''"
	and st6_state:"getPstate st6 ''Lighting''=''night''"
	and st6_condition_95:"(ltime st6 ''Lighting'' \<ge> 0t6h)"
	and st7:"st7=(setVarInt st6 ''out_2'' 1)"
	and st8:"st8=setPstate st7 ''Motion'' ''noMovement''"
	and st9:"st9=setPstate st8 ''Lighting'' ''earlyMorning''"
	and st10:"st10=toEnv st9"
	and st_final:"st_final=st10"
shows "inv(st_final)"
end