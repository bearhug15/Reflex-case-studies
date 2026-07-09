theory WaterHeater_VC1
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
	and st6_state:"getPstate st6 ''Controller''=''turnedOff''"
	and st6_condition_0:"((getVarBool st6 ''inp_0'') = True)"
	and st7:"st7=setPstate st6 ''Filling'' ''turnedOn''"
	and st8:"st8=setPstate st7 ''Heating'' ''noWater''"
	and st9:"st9=setPstate st8 ''Controller'' ''turnedOn''"
	and st9_state:"getPstate st9 ''Filling''=''turnedOn''"
	and st10:"st10=(setVarBool st9 ''out_0'' True)"
	and st10_condition_1:"(getVarBool st10 ''inp_1'')"
	and st11:"st11=(setVarBool st10 ''out_0'' False)"
	and st12:"st12=setPstate st11 ''Filling'' ''turnedOff''"
	and st12_state:"getPstate st12 ''Heating''=''noWater''"
	and st12_condition_2:"(getVarBool st12 ''inp_3'')"
	and st13:"st13=(setVarBool st12 ''out_1'' True)"
	and st14:"st14=setPstate st13 ''Heating'' ''turnedOn''"
	and st15:"st15=toEnv st14"
	and st_final:"st_final=st15"
shows "inv(st_final)"
end