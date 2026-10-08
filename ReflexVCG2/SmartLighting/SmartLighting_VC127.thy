theory SmartLighting_VC127
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
	and st4_state:"getPstate st4 ''Lighting''=''night''"
	and st4_condition_162:"(ltime st4 ''Lighting'' \<ge> 0t6h)"
	and st5:"st5=(setVarInt st4 ''out_2'' 1)"
	and st6:"st6=setPstate st5 ''Motion'' ''noMovement''"
	and st7:"st7=setPstate st6 ''Lighting'' ''earlyMorning''"
	and st8:"st8=toEnv st7"
	and st_final:"st_final=st8"
shows "inv(st_final)"
end