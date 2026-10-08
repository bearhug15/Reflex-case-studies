theory PalletStation_ASSERT6
	imports PalletStationTheory LoopInvariants Requirements
begin
(* assert at line 71: [assert: next(in(Palletiser, scanning))] *)
lemma
assumes base_inv:"inv(st0)"
	and st0_boundary:"toEnvP st0"
	and st1:"st1=(setVarVal st0 ''sensors_0'' [] (ValBool sensors_0))"
	and st2:"st2=(setVarVal st1 ''sensors_1'' [] (ValBool sensors_1))"
	and st2_state:"getPstate st2 ''Palletiser''=''idle''"
	and st3:"st3=(setVarVal st2 ''drives_2'' [] (ValBool True))"
	and st4:"st4=(setVarVal st3 ''drives_0'' [] (ValBool False))"
	and st5:"st5=(setVarVal st4 ''drives_1'' [] (ValBool False))"
	and st5_assume_0:"(\<not> (theBool (getVarVal st5 ''sensors_1'' [])))"
	and st5_condition_0:"(theBool (getVarVal st5 ''sensors_0'' []))"
	and st6:"st6=(setVarVal st5 ''#scanned'' [] (ValInt 0))"
shows "(\<exists> sa13. (((((substate st6 sa13) \<and> (st6 \<noteq> sa13)) \<and> (toEnvP st6)) \<and> (\<forall> sa14. ((((substate st6 sa14) \<and> (st6 \<noteq> sa14)) \<and> ((substate sa14 sa13) \<and> (sa14 \<noteq> sa13))) \<longrightarrow> (\<not> (toEnvP sa14))))) \<and> ((getPstate sa13 ''Palletiser'') = ''scanning'')))"
  (* Open: no proof is recorded for this condition in palletStation.proofs,
     which says why. *)
  sorry
end
