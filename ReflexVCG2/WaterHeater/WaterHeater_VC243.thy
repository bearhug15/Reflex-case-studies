theory WaterHeater_VC243
	imports WaterHeaterTheory Requirements
begin
lemma
assumes base_inv:"inv(st0)"
	and st1:"st1=(setVarBool st0 ''inp_3'' inp_3)"
	and st2:"st2=(setVarBool st1 ''inp_2'' inp_2)"
	and st3:"st3=(setVarBool st2 ''inp_1'' inp_1)"
	and st4:"st4=(setVarBool st3 ''inp_0'' inp_0)"
	and st5:"st5=(setVarBool st4 ''inp_5'' inp_5)"
	and st6:"st6=(setVarBool st5 ''inp_4'' inp_4)"
	and st6_state:"getPstate st6 ''Controller''=''stop''"
	and st6_state:"getPstate st6 ''Filling''=''turnedOn''"
	and st7:"st7=(setVarBool st6 ''out_0'' True)"
	and st7_condition_260:"(getVarBool st7 ''inp_1'')"
	and st8:"st8=(setVarBool st7 ''out_0'' False)"
	and st9:"st9=setPstate st8 ''Filling'' ''turnedOff''"
	and st9_state:"getPstate st9 ''Heating''=''turnedOn''"
	and st9_condition_263:"(\<not> (getVarBool st9 ''inp_3''))"
	and st10:"st10=(setVarBool st9 ''out_1'' False)"
	and st11:"st11=setPstate st10 ''Heating'' ''noWater''"
	and st12:"st12=toEnv st11"
	and st_final:"st_final=st12"
shows "inv(st_final)"
end