theory WaterHeater_VC148
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
	and st6_state:"getPstate st6 ''Controller''=''turnedOn''"
	and st6_condition_130:"((getVarBool st6 ''inp_0'') = False)"
	and st7:"st7=(setVarBool st6 ''out_0'' False)"
	and st8:"st8=(setVarBool st7 ''out_1'' False)"
	and st9:"st9=setPstate st8 ''Controller'' ''turnedOff''"
	and st10:"st10=setPstate st9 ''Filling'' ''stop''"
	and st11:"st11=setPstate st10 ''Heating'' ''stop''"
	and st11_state:"getPstate st11 ''Filling''=''turnedOff''"
	and st11_condition_153:"(\<not> (getVarBool st11 ''inp_2''))"
	and st12:"st12=(setVarBool st11 ''out_0'' True)"
	and st13:"st13=setPstate st12 ''Filling'' ''turnedOn''"
	and st13_state:"getPstate st13 ''Heating''=''turnedOff''"
	and st13_condition_161:"(\<not> (\<not> (getVarBool st13 ''inp_3'')))"
	and st13_condition_163:"(\<not> (\<not> (getVarBool st13 ''inp_5'')))"
	and st14:"st14=toEnv st13"
	and st_final:"st_final=st14"
shows "inv(st_final)"
end