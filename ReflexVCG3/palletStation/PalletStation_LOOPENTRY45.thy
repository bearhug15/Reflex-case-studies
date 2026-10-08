theory PalletStation_LOOPENTRY45
	imports PalletStationTheory LoopInvariants Requirements
begin
(* loop invariant on entry, loopInv3 *)
lemma
assumes base_inv:"inv(st0)"
	and st0_boundary:"toEnvP st0"
	and st1:"st1=(setVarVal st0 ''sensors_0'' [] (ValBool sensors_0))"
	and st2:"st2=(setVarVal st1 ''sensors_1'' [] (ValBool sensors_1))"
	and st2_state:"getPstate st2 ''Palletiser''=''packing''"
	and st3:"st3=(setVarVal st2 ''drives_0'' [] (ValBool False))"
	and st4:"st4=(setVarVal st3 ''drives_1'' [] (ValBool True))"
	and st5:"st5=(setVarVal st4 ''#placed'' [] (ValInt 0))"
	and st5_assume_0:"(((theInt (getVarVal st5 ''#FULL'' [])) - (theInt (getVarVal st5 ''#placed'' []))) > 0)"
	and st6:"st6=(setVarVal st5 ''#r'' [] (ValInt 0))"
shows "(loopInv3 st6 st6)"
  using assms by (auto simp add: setVarVal_def constants_def inv_def substate_refl loopInv0_def loopInv1_def loopInv2_def loopInv3_def loopInv4_def)
end
