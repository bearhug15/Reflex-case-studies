theory WashingMachine_VC75
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
	and st6_condition_67:"(\<not> ((getVarInt st6 ''inp_4'') \<ge> 30))"
	and st6_condition_68:"((getVarInt st6 ''inp_4'') < 40)"
	and st7:"st7=(setVarBool st6 ''out_4'' True)"
	and st7_condition_78:"(ltime st7 ''Washing'' < 1800000)"
	and st7_state:"getPstate st7 ''Drum''=''leftRotation''"
	and st8:"st8=(setVarBool st7 ''out_0'' True)"
	and st8_condition_79:"(ltime st8 ''Drum'' \<ge> 60000)"
	and st9:"st9=(setVarBool st8 ''out_0'' False)"
	and st10:"st10=setPstate st9 ''Drum'' ''leftToRight''"
	and st11:"st11=toEnv st10"
	and st_final:"st_final=st11"
shows "inv(st_final)"
end