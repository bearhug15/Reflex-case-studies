theory PalletStation_ASSERT55
	imports PalletStationTheory LoopInvariants Requirements
begin
(* assert at line 151: [assert: once(in(Palletiser, idle)) ==> !(beltLeft.scope(past(in(Palletiser, idle))) && beltRight.scope(past(in(Palletiser, idle))))] *)
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
	and st7:"toEnvP st7 \<and> substate st6 st7"
	and st7_invariant:"(\<forall> sa157. ((((substate st6 sa157) \<and> (substate sa157 st7)) \<and> ((sa157 = st6) \<or> (toEnvP sa157))) \<longrightarrow> (loopInv3 st6 sa157)))"
	and st7_frame:"((((((((((((((((((getVarVal st7 ''#BAY_COUNT'' []) = (getVarVal st6 ''#BAY_COUNT'' [])) \<and> ((getVarVal st7 ''#ROWS'' []) = (getVarVal st6 ''#ROWS'' []))) \<and> ((getVarVal st7 ''#COLS'' []) = (getVarVal st6 ''#COLS'' []))) \<and> ((getVarVal st7 ''#FULL'' []) = (getVarVal st6 ''#FULL'' []))) \<and> ((getVarVal st7 ''#bay'' []) = (getVarVal st6 ''#bay'' []))) \<and> ((getVarVal st7 ''#scanned'' []) = (getVarVal st6 ''#scanned'' []))) \<and> ((getVarVal st7 ''#toLeft'' []) = (getVarVal st6 ''#toLeft'' []))) \<and> ((getVarVal st7 ''#toRight'' []) = (getVarVal st6 ''#toRight'' []))) \<and> ((getVarVal st7 ''#i'' []) = (getVarVal st6 ''#i'' []))) \<and> ((getVarVal st7 ''#j'' []) = (getVarVal st6 ''#j'' []))) \<and> ((getVarVal st7 ''sensors_0'' []) = (getVarVal st6 ''sensors_0'' []))) \<and> ((getVarVal st7 ''sensors_1'' []) = (getVarVal st6 ''sensors_1'' []))) \<and> ((getVarVal st7 ''drives_0'' []) = (getVarVal st6 ''drives_0'' []))) \<and> ((getVarVal st7 ''drives_1'' []) = (getVarVal st6 ''drives_1'' []))) \<and> ((getVarVal st7 ''drives_2'' []) = (getVarVal st6 ''drives_2'' []))) \<and> ((getPstate st7 ''Palletiser'') = (getPstate st6 ''Palletiser''))) \<and> ((getPstate st7 ''Watchdog'') = (getPstate st6 ''Watchdog'')))"
	and st7_condition_0:"(\<not> ((theInt (getVarVal st7 ''#r'' [])) < (theInt (getVarVal st7 ''#ROWS'' []))))"
shows "((\<exists> sa159. (((substate sa159 st7) \<and> (toEnvP sa159)) \<and> ((getPstate sa159 ''Palletiser'') = ''idle''))) \<longrightarrow> (\<not> ((theBool (getVarVal (SOME sa160. ((((substate sa160 st7) \<and> (toEnvP sa160)) \<and> ((getPstate sa160 ''Palletiser'') = ''idle'')) \<and> (\<forall> sa161. (((((substate sa160 sa161) \<and> (sa160 \<noteq> sa161)) \<and> (substate sa161 st7)) \<and> (toEnvP sa161)) \<longrightarrow> (\<not> ((getPstate sa161 ''Palletiser'') = ''idle'')))))) ''drives_0'' [])) \<and> (theBool (getVarVal (SOME sa162. ((((substate sa162 st7) \<and> (toEnvP sa162)) \<and> ((getPstate sa162 ''Palletiser'') = ''idle'')) \<and> (\<forall> sa163. (((((substate sa162 sa163) \<and> (sa162 \<noteq> sa163)) \<and> (substate sa163 st7)) \<and> (toEnvP sa163)) \<longrightarrow> (\<not> ((getPstate sa163 ''Palletiser'') = ''idle'')))))) ''drives_1'' [])))))"
  (* Open: no proof is recorded for this condition in palletStation.proofs,
     which says why. *)
  sorry
end
