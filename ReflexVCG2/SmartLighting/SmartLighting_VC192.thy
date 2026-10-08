theory SmartLighting_VC192
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
	and st3_condition_231:"(ltime st3 ''Motion'' \<ge> 300000)"
	and st4:"st4=(setVarBool st3 ''_turnedOn'' False)"
	and st5:"st5=setPstate st4 ''Motion'' ''noMovement''"
	and st5_state:"getPstate st5 ''Lighting''=''morningOrDay''"
	and st6:"st6=(setVarBool st5 ''out_1'' False)"
	and st6_condition_245:"(\<not> (getVarBool st6 ''_turnedOn''))"
	and st7:"st7=(setVarBool st6 ''out_0'' False)"
	and st7_condition_247:"(ltime st7 ''Lighting'' < 0t11h30m)"
	and st8:"st8=toEnv st7"
	and st_final:"st_final=st8"
shows "inv(st_final)"
end