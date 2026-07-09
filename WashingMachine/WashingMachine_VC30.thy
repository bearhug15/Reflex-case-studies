theory WashingMachine_VC30
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
	and st6_state:"getPstate st6 ''Washing''=''waterSupply''"
	and st6_condition_30:"((getVarBool st6 ''inp_2'') = True)"
	and st7:"st7=(setVarBool st6 ''out_2'' False)"
	and st8:"st8=(setVarBool st7 ''out_6'' True)"
	and st9:"st9=setPstate st8 ''Washing'' ''wash''"
	and st9_state:"getPstate st9 ''Drum''=''leftRotation''"
	and st10:"st10=(setVarBool st9 ''out_0'' True)"
	and st10_condition_31:"(ltime st10 ''Drum'' \<ge> 60000)"
	and st11:"st11=(setVarBool st10 ''out_0'' False)"
	and st12:"st12=setPstate st11 ''Drum'' ''leftToRight''"
	and st13:"st13=toEnv st12"
	and st_final:"st_final=st13"
shows "inv(st_final)"
end