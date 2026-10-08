theory PalletStation_VC0
	imports PalletStationTheory LoopInvariants Requirements
begin
lemma
assumes st0:"st0=emptyState"
	and st1:"st1=(setVarVal st0 ''sensors_0'' [] (ValBool sensors_0))"
	and st2:"st2=(setVarVal st1 ''sensors_1'' [] (ValBool sensors_1))"
	and st3:"st3=(setVarVal st2 ''#BAY_COUNT'' [] (ValInt 4))"
	and st4:"st4=(setVarVal st3 ''#ROWS'' [] (ValInt 3))"
	and st5:"st5=(setVarVal st4 ''#COLS'' [] (ValInt 2))"
	and st6:"st6=(setVarVal st5 ''#FULL'' [] (ValInt 6))"
	and st7:"st7=(setVarVal st6 ''#bay'' [AccessIndex (nat 0)] (ValInt 0))"
	and st8:"st8=(setVarVal st7 ''#bay'' [AccessIndex (nat 1)] (ValInt 0))"
	and st9:"st9=(setVarVal st8 ''#bay'' [AccessIndex (nat 2)] (ValInt 0))"
	and st10:"st10=(setVarVal st9 ''#bay'' [AccessIndex (nat 3)] (ValInt 0))"
	and st11:"st11=(setVarVal st10 ''#cell'' [AccessIndex (nat 0)] (ValInt 0))"
	and st12:"st12=(setVarVal st11 ''#cell'' [AccessIndex (nat 1)] (ValInt 0))"
	and st13:"st13=(setVarVal st12 ''#cell'' [AccessIndex (nat 2)] (ValInt 0))"
	and st14:"st14=(setVarVal st13 ''#cell'' [AccessIndex (nat 3)] (ValInt 0))"
	and st15:"st15=(setVarVal st14 ''#cell'' [AccessIndex (nat 4)] (ValInt 0))"
	and st16:"st16=(setVarVal st15 ''#cell'' [AccessIndex (nat 5)] (ValInt 0))"
	and st17:"st17=setPstate st16 ''Palletiser'' ''idle''"
	and st18:"st18=toEnv st17"
	and st_final:"st_final=st18"
shows "inv(st_final)"
  (* Open: no proof is recorded for this condition in palletStation.proofs,
     which says why. *)
  sorry
end
