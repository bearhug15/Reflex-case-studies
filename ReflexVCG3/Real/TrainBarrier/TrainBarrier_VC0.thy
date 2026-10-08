theory TrainBarrier_VC0
	imports TrainBarrierTheory LoopInvariants Requirements
begin
lemma
assumes st0:"st0=emptyState"
	and st1:"st1=(setVarVal st0 ''inp_0'' [] (ValBool inp_0))"
	and st2:"st2=(setVarVal st1 ''inp_1'' [] (ValBool inp_1))"
	and st3:"st3=(setVarVal st2 ''inp_2'' [] (ValBool inp_2))"
	and st4:"st4=setPstate st3 ''Control'' ''openned''"
	and st5:"st5=toEnv st4"
	and st_final:"st_final=st5"
shows "inv(st_final)"
  proof - have pred: "predEnv st_final = emptyState" using assms by (simp add: setVarVal_def) show ?thesis using assms unfolding inv_def constants_def extraInv_def extra_states_Control_def  apply ((intro conjI)?; ((rule wrapped_step[OF pred wrapped_empty] wrapped_step_unscoped[OF pred wrapped_empty_unscoped])?, auto simp add: setVarVal_def Let_def)) done qed
end
