theory WashingMachine_VC129
	imports WashingMachineTheory Requirements
begin
lemma
assumes base_inv:"inv(st0)"
	and st1:"st1=(setVarBool st0 ''inp_3'' inp_3)"
	and st2:"st2=(setVarBool st1 ''inp_2'' inp_2)"
	and st3:"st3=(setVarBool st2 ''inp_1'' inp_1)"
	and st4:"st4=(setVarBool st3 ''inp_0'' inp_0)"
	and st5:"st5=(setVarInt st4 ''inp_5'' inp_5)"
	and st6:"st6=(setVarInt st5 ''inp_4'' inp_4)"
	and st6_state:"getPstate st6 ''Washing''=''draining''"
	and st6_condition_112:"((getVarBool st6 ''inp_3'') = False)"
	and st7:"st7=(setVarBool st6 ''out_3'' False)"
	and st8:"st8=(setVarBool st7 ''out_5'' False)"
	and st9:"st9=(setVarBool st8 ''out_0'' False)"
	and st10:"st10=(setVarBool st9 ''out_1'' False)"
	and st11:"st11=setPstate st10 ''Drum'' ''stop''"
	and st12:"st12=setPstate st11 ''Washing'' ''idle''"
	and st12_state:"getPstate st12 ''Drum''=''stop''"
	and st13:"st13=toEnv st12"
	and st_final:"st_final=st13"
shows "inv(st_final)"
end