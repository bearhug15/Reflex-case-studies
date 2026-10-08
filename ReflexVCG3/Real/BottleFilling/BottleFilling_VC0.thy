theory BottleFilling_VC0
	imports BottleFillingTheory LoopInvariants Requirements
begin
lemma
assumes st0:"st0=emptyState"
	and st1:"st1=(setVarVal st0 ''inp_0'' [] (ValBool inp_0))"
	and st2:"st2=(setVarVal st1 ''inp_1'' [] (ValBool inp_1))"
	and st3:"st3=(setVarVal st2 ''inp_2'' [] (ValBool inp_2))"
	and st4:"st4=(setVarVal st3 ''inp_3'' [] (ValBool inp_3))"
	and st5:"st5=(setVarVal st4 ''inp_4'' [] (ValBool inp_4))"
	and st6:"st6=(setVarVal st5 ''inp_5'' [] (ValBool inp_5))"
	and st7:"st7=(setVarVal st6 ''#TURNED_ON'' [] (ValBool True))"
	and st8:"st8=(setVarVal st7 ''#TURNED_OFF'' [] (ValBool False))"
	and st9:"st9=setPstate st8 ''Initialization'' ''begin''"
	and st10:"st10=toEnv st9"
	and st_final:"st_final=st10"
shows "inv(st_final)"
  (* Open: no proof is recorded for this condition in bottleFilling.proofs,
     which says why. *)
  sorry
end
