theory TrainBarrier_VC3
	imports TrainBarrierTheory LoopInvariants Requirements
begin
lemma
assumes base_inv:"inv(st0)"
	and st0_boundary:"toEnvP st0"
	and st1:"st1=(setVarVal st0 ''inp_0'' [] (ValBool inp_0))"
	and st2:"st2=(setVarVal st1 ''inp_1'' [] (ValBool inp_1))"
	and st3:"st3=(setVarVal st2 ''inp_2'' [] (ValBool inp_2))"
	and st3_state:"getPstate st3 ''Control''=''closing''"
	and st3_condition_0:"(\<not> (theBool (getVarVal st3 ''inp_0'' [])))"
	and st4:"st4=(setVarVal st3 ''out_1'' [] (ValBool False))"
	and st5:"st5=(setVarVal st4 ''out_0'' [] (ValBool True))"
	and st6:"st6=setPstate st5 ''Control'' ''openning''"
	and st7:"st7=reset st6 ''Control''"
	and st8:"st8=toEnv st7"
	and st_final:"st_final=st8"
shows "inv(st_final)"
  proof - have pred: "predEnv st_final = st0" using assms by (simp add: setVarVal_def) show ?thesis using assms unfolding inv_def constants_def extraInv_def extra_states_Control_def  apply ((elim conjE)?) apply ((intro conjI)?; (((rule wrapped_step[OF pred] wrapped_step_unscoped[OF pred]), assumption)?, ((drule wrapped_here[OF _ st0_boundary] wrapped_here_unscoped[OF _ st0_boundary])+)?, auto simp add: setVarVal_def Let_def)) done qed
end
