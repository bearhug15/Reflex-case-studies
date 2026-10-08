theory PalletStation_ASSUME44
	imports PalletStationTheory LoopInvariants Requirements
begin
(* assume at line 133: [assume: remaining(placed) > 0] *)
lemma
assumes base_inv:"inv(st0)"
	and st0_boundary:"toEnvP st0"
	and st1:"st1=(setVarVal st0 ''sensors_0'' [] (ValBool sensors_0))"
	and st2:"st2=(setVarVal st1 ''sensors_1'' [] (ValBool sensors_1))"
	and st2_state:"getPstate st2 ''Palletiser''=''packing''"
	and st3:"st3=(setVarVal st2 ''drives_0'' [] (ValBool False))"
	and st4:"st4=(setVarVal st3 ''drives_1'' [] (ValBool True))"
	and st5:"st5=(setVarVal st4 ''#placed'' [] (ValInt 0))"
shows "(((theInt (getVarVal st5 ''#FULL'' [])) - (theInt (getVarVal st5 ''#placed'' []))) > 0)"
  using assms by (simp add: setVarVal_def constants_def inv_def)
end
