theory BaggageCarouselTheory
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
(((getVarVal s ''#PRESSED'' []) = (ValBool True))
\<and> ((getVarVal s ''#DETECTED'' []) = (ValBool True))
\<and> ((getVarVal s ''#NOT_DETECTED'' []) = (ValBool False))
\<and> ((getVarVal s ''#HIGH'' []) = (ValBool True))
\<and> ((getVarVal s ''#LOW'' []) = (ValBool False))
\<and> ((getVarVal s ''#TURN_ON'' []) = (ValBool True))
\<and> ((getVarVal s ''#TURN_OFF'' []) = (ValBool False))
\<and> ((getVarVal s ''#IDLE_TIMEOUT'' []) = (ValNat 30000)))"

end