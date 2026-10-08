theory SmartLighting_VC254
	imports SmartLightingTheory Requirements
begin
lemma
assumes base_inv:"inv(st0)"
	and st1:"st1=(setVarBool st0 ''inp_1'' inp_1)"
	and st2:"st2=(setVarBool st1 ''inp_0'' inp_0)"
	and st2_state:"getPstate st2 ''Init''=''stop''"
	and st2_state:"getPstate st2 ''Motion''=''stop''"
	and st2_state:"getPstate st2 ''Lighting''=''night''"
	and st2_condition_325:"(ltime st2 ''Lighting'' < 0t6h)"
	and st3:"st3=toEnv st2"
	and st_final:"st_final=st3"
shows "inv(st_final)"
end