theory PalletStation_ASSUME25
	imports PalletStationTheory LoopInvariants Requirements
begin
(* assume at line 103: [assume: forall(k in 0..BAY_COUNT: bay[k] >= 0)] *)
lemma
assumes base_inv:"inv(st0)"
	and st0_boundary:"toEnvP st0"
	and st1:"st1=(setVarVal st0 ''sensors_0'' [] (ValBool sensors_0))"
	and st2:"st2=(setVarVal st1 ''sensors_1'' [] (ValBool sensors_1))"
	and st2_state:"getPstate st2 ''Palletiser''=''sorting''"
	and st3:"st3=(setVarVal st2 ''drives_0'' [] (ValBool True))"
	and st4:"st4=(setVarVal st3 ''drives_1'' [] (ValBool False))"
	and st5:"st5=(setVarVal st4 ''#toLeft'' [] (ValInt 0))"
	and st6:"st6=(setVarVal st5 ''#toRight'' [] (ValInt 0))"
shows "(\<forall> k. (((0 \<le> k) \<and> (k < (theInt (getVarVal st6 ''#BAY_COUNT'' [])))) \<longrightarrow> ((theInt (getVarVal st6 ''#bay'' [(AccessIndex (nat k))])) \<ge> 0)))"
  (* Open: no proof is recorded for this condition in palletStation.proofs,
     which says why. *)
  sorry
end
