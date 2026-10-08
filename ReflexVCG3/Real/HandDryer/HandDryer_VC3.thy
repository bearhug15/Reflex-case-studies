theory HandDryer_VC3
	imports HandDryerTheory LoopInvariants Requirements
begin
lemma
assumes base_inv:"inv(st0)"
	and st0_boundary:"toEnvP st0"
	and st1:"st1=(setVarVal st0 ''inp_1'' [] (ValBool inp_1))"
	and st1_state:"getPstate st1 ''Dryer''=''Work''"
	and st1_condition_0:"(theBool (getVarVal st1 ''inp_1'' []))"
	and st2:"st2=reset st1 ''Dryer''"
	and st2_timeout_1:"(ltime st2 ''Dryer'' < (theNat (getVarVal st_final ''#TIMEOUT'' [])))"
	and st3:"st3=toEnv st2"
	and st_final:"st_final=st3"
shows "inv(st_final)"
  proof - have pred: "predEnv st_final = st0" using assms by (simp add: setVarVal_def) show ?thesis using assms unfolding inv_def constants_def extraInv_def extra_states_Dryer_def  apply ((elim conjE)?) apply ((intro conjI)?; (((rule wrapped_step[OF pred] wrapped_step_unscoped[OF pred]), assumption)?, ((drule wrapped_here[OF _ st0_boundary] wrapped_here_unscoped[OF _ st0_boundary])+)?, auto simp add: setVarVal_def Let_def)) done qed
end
