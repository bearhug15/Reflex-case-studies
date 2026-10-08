theory PalletStation_ASSUME13
	imports PalletStationTheory LoopInvariants Requirements
begin
(* assume at line 82: [assume: forall(k in 0..BAY_COUNT: bay[k] >= 0)] *)
lemma
assumes base_inv:"inv(st0)"
	and st0_boundary:"toEnvP st0"
	and st1:"st1=(setVarVal st0 ''sensors_0'' [] (ValBool sensors_0))"
	and st2:"st2=(setVarVal st1 ''sensors_1'' [] (ValBool sensors_1))"
	and st2_state:"getPstate st2 ''Palletiser''=''scanning''"
	and st3:"st3=(setVarVal st2 ''drives_2'' [] (ValBool False))"
	and st4:"st4=(setVarVal st3 ''#scanned'' [] (ValInt 0))"
shows "(\<forall> k. (((0 \<le> k) \<and> (k < (theInt (getVarVal st4 ''#BAY_COUNT'' [])))) \<longrightarrow> ((theInt (getVarVal st4 ''#bay'' [(AccessIndex (nat k))])) \<ge> 0)))"
  (* Open: no proof is recorded for this condition in palletStation.proofs,
     which says why. *)
  sorry
end
