theory PalletStationTheory
	imports ReflexPatterns
begin
fun ltime:: "state \<Rightarrow> process \<Rightarrow> nat" where
"ltime emptyState _ = 0"
| "ltime (toEnv s) p = (ltime s p) + 100"
| "ltime (setVar s _ _) p = ltime s p"
| "ltime (setPstate s p1 _) p = (if p=p1 then 0 else ltime s p)"
| "ltime (reset s p1) p = (if p=p1 then 0 else ltime s p)"

lemma ltime_mult:
"ltime s p mod 100 = 0"
  by (induction s) (auto)

definition constants :: "state \<Rightarrow> bool" where
"constants s =
(((getVarVal s ''#BAY_COUNT'' []) = (ValInt 4))
\<and> ((getVarVal s ''#ROWS'' []) = (ValInt 3))
\<and> ((getVarVal s ''#COLS'' []) = (ValInt 2))
\<and> ((getVarVal s ''#FULL'' []) = (ValInt 6)))"

end