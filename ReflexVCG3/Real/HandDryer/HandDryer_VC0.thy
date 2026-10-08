theory HandDryer_VC0
	imports HandDryerTheory LoopInvariants Requirements
begin
lemma
assumes st0:"st0=emptyState"
	and st1:"st1=(setVarVal st0 ''inp_1'' [] (ValBool inp_1))"
	and st2:"st2=(setVarVal st1 ''#ON'' [] (ValBool True))"
	and st3:"st3=(setVarVal st2 ''#OFF'' [] (ValBool False))"
	and st4:"st4=(setVarVal st3 ''#TIMEOUT'' [] (ValNat 2000))"
	and st5:"st5=setPstate st4 ''Dryer'' ''Wait''"
	and st6:"st6=toEnv st5"
	and st_final:"st_final=st6"
shows "inv(st_final)"
  proof - have pred: "predEnv st_final = emptyState" using assms by (simp add: setVarVal_def) show ?thesis using assms unfolding inv_def constants_def extraInv_def extra_states_Dryer_def  apply ((intro conjI)?; ((rule wrapped_step[OF pred wrapped_empty] wrapped_step_unscoped[OF pred wrapped_empty_unscoped])?, auto simp add: setVarVal_def Let_def)) done qed
end
