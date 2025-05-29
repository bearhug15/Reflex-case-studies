theory SmartLighting_VC199
	imports SmartLightingTheory Requirements
begin
lemma
assumes base_inv:"inv(st0)"
	and st1:"st1=(setVarBool st0 ''inp_1'' inp_1)"
	and st2:"st2=(setVarBool st1 ''inp_0'' inp_0)"
	and st2_state:"getPstate st2 ''Init''=''stop''"
	and st2_state:"getPstate st2 ''Motion''=''movement''"
	and st2_condition_230:"(getVarBool st2 ''inp_0'')"
	and st3:"st3=reset st2"
	and st3_condition_254:"(ltime st3 ''Motion'' < 300000)"
	and st3_state:"getPstate st3 ''Lighting''=''night''"
	and st3_condition_255:"(ltime st3 ''Lighting'' \<ge> 0t6h)"
	and st4:"st4=(setVarInt st3 ''out_2'' 1)"
	and st5:"st5=setPstate st4 ''Motion'' ''noMovement''"
	and st6:"st6=setPstate st5 ''Lighting'' ''earlyMorning''"
	and st7:"st7=toEnv st6"
	and st_final:"st_final=st7"
shows "inv(st_final)"
end