theory WashingMachine_VC8
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
	and st6_state:"getPstate st6 ''Washing''=''idle''"
	and st6_condition_0:"((getVarBool st6 ''inp_0'') = True)"
	and st7:"st7=(setVarBool st6 ''out_5'' True)"
	and st8:"st8=setPstate st7 ''Washing'' ''locking''"
	and st8_state:"getPstate st8 ''Drum''=''rightToLeft''"
	and st8_condition_8:"(\<not> ((getVarInt st8 ''inp_5'') = 0))"
	and st9:"st9=toEnv st8"
	and st_final:"st_final=st9"
shows "inv(st_final)"
end