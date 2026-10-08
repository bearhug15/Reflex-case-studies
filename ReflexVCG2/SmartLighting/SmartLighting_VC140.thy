theory SmartLighting_VC140
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
	and st4_state:"getPstate st4 ''Lighting''=''evening''"
	and st5:"st5=(setVarBool st4 ''out_0'' False)"
	and st5_condition_178:"(getVarBool st5 ''_turnedOn'')"
	and st6:"st6=(setVarBool st5 ''out_1'' True)"
	and st6_condition_180:"(ltime st6 ''Lighting'' < 0t6h)"
	and st7:"st7=toEnv st6"
	and st_final:"st_final=st7"
shows "inv(st_final)"
end