theory WashingMachine_VC48
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
	and st6_state:"getPstate st6 ''Washing''=''wash''"
	and st6_condition_48:"((getVarInt st6 ''inp_4'') \<ge> 30)"
	and st7:"st7=(setVarBool st6 ''out_4'' False)"
	and st7_condition_49:"(ltime st7 ''Washing'' \<ge> 1800000)"
	and st8:"st8=(setVarBool st7 ''out_6'' False)"
	and st9:"st9=(setVarBool st8 ''out_3'' True)"
	and st10:"st10=(setVarBool st9 ''out_4'' False)"
	and st11:"st11=setPstate st10 ''Washing'' ''draining''"
	and st11_state:"getPstate st11 ''Drum''=''leftRotation''"
	and st12:"st12=(setVarBool st11 ''out_0'' True)"
	and st12_condition_50:"(ltime st12 ''Drum'' \<ge> 60000)"
	and st13:"st13=(setVarBool st12 ''out_0'' False)"
	and st14:"st14=setPstate st13 ''Drum'' ''leftToRight''"
	and st15:"st15=toEnv st14"
	and st_final:"st_final=st15"
shows "inv(st_final)"
end