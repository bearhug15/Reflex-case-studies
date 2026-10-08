theory SmartLighting_VC376
	imports SmartLightingTheory Requirements
begin
lemma
assumes base_inv:"inv(st0)"
	and st1:"st1=(setVarBool st0 ''inp_1'' inp_1)"
	and st2:"st2=(setVarBool st1 ''inp_0'' inp_0)"
	and st2_state:"getPstate st2 ''Init''=''error''"
	and st2_state:"getPstate st2 ''Motion''=''movement''"
	and st2_condition_461:"(\<not> (getVarBool st2 ''inp_0''))"
	and st2_condition_462:"(ltime st2 ''Motion'' \<ge> 300000)"
	and st3:"st3=(setVarBool st2 ''_turnedOn'' False)"
	and st4:"st4=setPstate st3 ''Motion'' ''noMovement''"
	and st4_state:"getPstate st4 ''Lighting''=''evening''"
	and st5:"st5=(setVarBool st4 ''out_0'' False)"
	and st5_condition_482:"(\<not> (getVarBool st5 ''_turnedOn''))"
	and st6:"st6=(setVarBool st5 ''out_1'' False)"
	and st6_condition_484:"(ltime st6 ''Lighting'' < 0t6h)"
	and st7:"st7=toEnv st6"
	and st_final:"st_final=st7"
shows "inv(st_final)"
end