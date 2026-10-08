theory SmartLighting_VC393
	imports SmartLightingTheory Requirements
begin
lemma
assumes base_inv:"inv(st0)"
	and st1:"st1=(setVarBool st0 ''inp_1'' inp_1)"
	and st2:"st2=(setVarBool st1 ''inp_0'' inp_0)"
	and st2_state:"getPstate st2 ''Init''=''error''"
	and st2_state:"getPstate st2 ''Motion''=''movement''"
	and st2_condition_461:"(\<not> (getVarBool st2 ''inp_0''))"
	and st2_condition_485:"(ltime st2 ''Motion'' < 300000)"
	and st2_state:"getPstate st2 ''Lighting''=''evening''"
	and st3:"st3=(setVarBool st2 ''out_0'' False)"
	and st3_condition_505:"(\<not> (getVarBool st3 ''_turnedOn''))"
	and st4:"st4=(setVarBool st3 ''out_1'' False)"
	and st4_condition_506:"(ltime st4 ''Lighting'' \<ge> 0t6h)"
	and st5:"st5=(setVarBool st4 ''out_1'' False)"
	and st6:"st6=(setVarInt st5 ''out_2'' 0)"
	and st7:"st7=(setVarBool st6 ''_turnedOn'' False)"
	and st8:"st8=setPstate st7 ''Motion'' ''stop''"
	and st9:"st9=setPstate st8 ''Lighting'' ''night''"
	and st10:"st10=toEnv st9"
	and st_final:"st_final=st10"
shows "inv(st_final)"
end