theory SmartLighting_VC70
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
	and st4_condition_46:"(getVarBool st4 ''inp_0'')"
	and st5:"st5=reset st4"
	and st5_condition_70:"(ltime st5 ''Motion'' < 300000)"
	and st5_state:"getPstate st5 ''Lighting''=''evening''"
	and st6:"st6=(setVarBool st5 ''out_0'' False)"
	and st6_condition_90:"(\<not> (getVarBool st6 ''_turnedOn''))"
	and st7:"st7=(setVarBool st6 ''out_1'' False)"
	and st7_condition_92:"(ltime st7 ''Lighting'' < 0t6h)"
	and st8:"st8=toEnv st7"
	and st_final:"st_final=st8"
shows "inv(st_final)"
end