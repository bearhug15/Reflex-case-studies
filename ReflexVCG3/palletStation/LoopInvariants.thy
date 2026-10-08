theory LoopInvariants
	imports PalletStationTheory
begin
(* the loop at line 85 *)
definition loopInv0 :: "state \<Rightarrow> state \<Rightarrow> bool" where
"loopInv0 t0 s =
((((theInt (getVarVal s ''#scanned'' [])) \<ge> 0) \<and> ((theInt (getVarVal s ''#i'' [])) \<ge> 0)) \<and> (\<forall> k. (((0 \<le> k) \<and> (k < (theInt (getVarVal s ''#BAY_COUNT'' [])))) \<longrightarrow> ((theInt (getVarVal s ''#bay'' [(AccessIndex (nat k))])) \<ge> 0))))"

(* the loop at line 106 *)
definition loopInv1 :: "state \<Rightarrow> state \<Rightarrow> bool" where
"loopInv1 t0 s =
(((theInt (getVarVal s ''#toLeft'' [])) \<le> (theInt (getVarVal s ''#i'' []))) \<and> ((theInt (getVarVal s ''#i'' [])) \<le> (theInt (getVarVal s ''#BAY_COUNT'' []))))"

(* the loop at line 116 *)
definition loopInv2 :: "state \<Rightarrow> state \<Rightarrow> bool" where
"loopInv2 t0 s =
(((theInt (getVarVal s ''#toRight'' [])) \<le> (theInt (getVarVal s ''#j'' []))) \<and> ((theInt (getVarVal s ''#j'' [])) \<le> (theInt (getVarVal s ''#BAY_COUNT'' []))))"

(* the loop at line 136 *)
definition loopInv3 :: "state \<Rightarrow> state \<Rightarrow> bool" where
"loopInv3 t0 s =
(((theInt (getVarVal s ''#placed'' [])) = ((theInt (getVarVal s ''#r'' [])) * (theInt (getVarVal s ''#COLS'' [])))) \<and> ((theInt (getVarVal s ''#r'' [])) \<le> (theInt (getVarVal s ''#ROWS'' []))))"

(* the loop at line 141 *)
definition loopInv4 :: "state \<Rightarrow> state \<Rightarrow> bool" where
"loopInv4 t0 s =
(((theInt (getVarVal s ''#placed'' [])) = (((theInt (getVarVal s ''#r'' [])) * (theInt (getVarVal s ''#COLS'' []))) + (theInt (getVarVal s ''#c'' [])))) \<and> ((theInt (getVarVal s ''#c'' [])) \<le> (theInt (getVarVal s ''#COLS'' []))))"


end