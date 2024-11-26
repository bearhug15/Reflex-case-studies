theory EscalatorTheory
imports ReflexPatterns
begin

abbreviation "timeStep==100::nat"

fun ltime:: "state \<Rightarrow> process \<Rightarrow> nat" where 
"ltime emptyState _ = 0" 
| "ltime (toEnv s) p = (ltime s p) + timeStep" 
| "ltime (setVarBool s _ _) p = ltime s p" 
| "ltime (setVarInt s _ _) p = ltime s p"
| "ltime (setVarNat s _ _) p = ltime s p"
| "ltime (setVarReal s _ _) p = ltime s p"
| "ltime (setPstate s p1 _) p =
  (if p=p1 then 0 else ltime s p)" 
| "ltime (reset s p1) p =
  (if p=p1 then 0 else ltime s p)"

lemma ltime_mod:
assumes "ltime s0 p < a*timeStep"
shows "ltime s0 p \<le> (a*timeStep-timeStep)"
proof -
have"(ltime s0 p) mod timeStep = 0" by (induction s0) (auto)
thus ?thesis using assms by (induction a) (auto)
qed
lemma ltime_mult:
"ltime s p mod timeStep = 0"
  by (induction s) (auto)

lemma ltime_div_less:
assumes "(ltime s0 p div timeStep)\<le> a"
shows "(ltime s0 p -timeStep) div timeStep < a \<or> ltime s0 p = 0"
proof -
have"(ltime s0 p) mod timeStep = 0" by (induction s0) (auto)
thus ?thesis using assms by (induction a) (auto)
qed

lemma ltime_le_toEnvNum: 
"ltime s p div timeStep \<le> toEnvNum emptyState s"
  apply(induction s)
         apply(auto)
  done
lemma toEnvNum_getPstate:
"toEnvNum s s' < ltime s' p div timeStep \<Longrightarrow> getPstate s p = getPstate s' p"
  apply (induction s' arbitrary:s)
  apply auto
  apply (metis Suc_eq_plus1 getPstate.simps(2) not_less_eq)
  using getPstate.simps apply presburger+
done

lemma inter_toEnvNum_getPstate:
"toEnvNum s s' < ltime s' p div timeStep \<and> substate s s'' \<and> substate s'' s'\<Longrightarrow> toEnvNum s'' s' < ltime s' p div timeStep"
  using toEnvNum3 by fastforce

lemma Pstate_continuation:
"\<forall>n. (n) < ltime s p div timeStep \<longrightarrow> getPstate s p = getPstate (shiftEnv s n) p" 
proof(rule allI;rule impI;induction "n::nat" arbitrary: s p rule: nat_induct)
  case 0
  then show ?case sorry
next
  case (Suc n)
  then show ?case sorry
qed

end
