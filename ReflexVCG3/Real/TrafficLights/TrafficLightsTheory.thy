theory TrafficLightsTheory
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
(((getVarVal s ''#GREEN'' []) = (ValBool True))
\<and> ((getVarVal s ''#RED'' []) = (ValBool False))
\<and> ((getVarVal s ''#pressed'' []) = (ValBool True))
\<and> ((getVarVal s ''#not_pressed'' []) = (ValBool False))
\<and> ((getVarVal s ''#minimal_red_time'' []) = (ValNat 10000))
\<and> ((getVarVal s ''#red_to_green'' []) = (ValNat 5000))
\<and> ((getVarVal s ''#green_time_limit'' []) = (ValNat 30000)))"

end