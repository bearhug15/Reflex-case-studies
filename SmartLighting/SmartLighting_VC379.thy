theory SmartLighting_VC379
	imports SmartLightingTheory Requirements
begin
lemma
assumes base_inv:"inv(st0)"
	and st1:"st1=(setVarBool st0 ''inp_1'' inp_1)"
	and st2:"st2=(setVarBool st1 ''inp_0'' inp_0)"
	and st2_state:"getPstate st2 ''Init''=''error''"
	and st2_state:"getPstate st2 ''Motion''=''movement''"
	and st2_condition_461:"(\<not> (getVarBool st2 ''inp_0''))"
	and st2_condition_485:"(ltime st2 ''Motion'' < 300000)"
	and st2_state:"getPstate st2 ''Lighting''=''night''"
	and st2_condition_486:"(ltime st2 ''Lighting'' \<ge> 0t6h)"
	and st3:"st3=(setVarInt st2 ''out_2'' 1)"
	and st4:"st4=setPstate st3 ''Motion'' ''noMovement''"
	and st5:"st5=setPstate st4 ''Lighting'' ''earlyMorning''"
	and st6:"st6=toEnv st5"
	and st_final:"st_final=st6"
shows "inv(st_final)"
end