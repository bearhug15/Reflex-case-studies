theory FridgeTheory
imports ReflexPatterns
begin

fun ltime:: "state \<Rightarrow> process \<Rightarrow> nat" where 
"ltime emptyState _ = 0" 
| "ltime (toEnv s) p = (ltime s p) + 100" 
| "ltime (setVarBool s _ _) p = ltime s p" 
| "ltime (setVarInt s _ _) p = ltime s p"
| "ltime (setVarNat s _ _) p = ltime s p"
| "ltime (setVarReal s _ _) p = ltime s p"
| "ltime (setPstate s p1 _) p =
  (if p=p1 then 0 else ltime s p)" 
| "ltime (reset s p1) p =
  (if p=p1 then 0 else ltime s p)"

lemma ltime_mod:
assumes "ltime s0 p < a*100"
shows "ltime s0 p \<le> (a*100-100)"
proof -
have"(ltime s0 p) mod 100 = 0" by (induction s0) (auto)
thus ?thesis using assms by (induction a) (auto)
qed
lemma ltime_mult:
"ltime s p mod 100 = 0"
  by (induction s) (auto)

lemma ltime_div_less:
assumes "(ltime s0 p div 100)\<le> a"
shows "(ltime s0 p -100) div 100 < a \<or> ltime s0 p = 0"
proof -
have"(ltime s0 p) mod 100 = 0" by (induction s0) (auto)
thus ?thesis using assms by (induction a) (auto)
qed

lemma ltime_le_toEnvNum: 
"ltime s p div 100 \<le> toEnvNum emptyState s"
  apply(induction s)
         apply(auto)
  done
lemma toEnvNum_getPstate:
"toEnvNum s s' < ltime s' p div 100 \<Longrightarrow> getPstate s p = getPstate s' p"
  apply (induction s' arbitrary:s)
  apply auto
  apply (metis Suc_eq_plus1 getPstate.simps(2) not_less_eq)
  using getPstate.simps apply presburger+
done

lemma inter_toEnvNum_getPstate:
"toEnvNum s s' < ltime s' p div 100 \<and> substate s s'' \<and> substate s'' s' \<Longrightarrow> toEnvNum s'' s' < ltime s' p div 100"
  using toEnvNum3 by fastforce

definition R1 where "R1 s \<equiv> toEnvP s \<and>
(\<forall> s1 s2. substate s1 s2 \<and> substate s2 s \<and> toEnvP s1 \<and> toEnvP s2 \<and> toEnvNum s1 s2 = 1 \<and>
 getVarBool s1 ''inp_4'' = False \<and> getVarBool s2 ''inp_4'' = True \<longrightarrow> getVarBool s2 ''out_2'')"

definition R2 where "R2 s \<equiv> toEnvP s \<and>
(\<forall> s1 s2. substate s1 s2 \<and> substate s2 s \<and> toEnvP s1 \<and> toEnvP s2 \<and> toEnvNum s1 s2 = 1 \<and>
 getVarBool s1 ''inp_4'' = True \<and> getVarBool s2 ''inp_4'' = False \<longrightarrow> \<not> getVarBool s2 ''out_2'')"

definition R3 where "R3 s \<equiv> toEnvP s \<and>
(\<forall> s1. substate s1 s \<and> toEnvP s1 \<and> toEnvNum s1 s \<ge> 30000 div 100 \<and>  getVarBool s1 ''inp_4'' = True \<longrightarrow>
(\<exists> s3. toEnvP s3 \<and> substate s1 s3 \<and> substate s3 s \<and> toEnvNum s1 s3 \<le> 30000 div 100 \<and>
(getVarBool s3 ''out_3'' \<or> getVarBool s3 ''inp_4'' = False) \<and>
(\<forall> s2. toEnvP s2 \<and> substate s1 s2 \<and> substate s2 s3 \<and> s2 \<noteq> s3 \<longrightarrow>
 \<not> getVarBool s2 ''out_3'' \<and> getVarBool s2 ''inp_4'' = True)))"

definition R4 where "R4 s \<equiv> toEnvP s \<and>
(\<forall> s1 s2 s3. substate s1 s2 \<and> substate s2 s3 \<and> substate s3 s \<and> toEnvP s1 \<and> toEnvP s2 \<and>
 toEnvP s3 \<and> toEnvNum s1 s2 = 1 \<and> toEnvNum s2 s3 < 30000 div 100 \<and>
getVarBool s1 ''inp_4'' = False \<and> getVarBool s2 ''inp_4'' = True \<longrightarrow>
\<not> getVarBool s3 ''out_3'')"

definition R5 where "R5 s \<equiv> toEnvP s \<and>
(\<forall> s1 s2. substate s1 s2 \<and> substate s2 s \<and> toEnvP s1 \<and> toEnvP s2 \<and> toEnvNum s1 s2 = 1 \<and> 
getVarBool s1 ''out_0'' = False \<and> getVarBool s2 ''inp_1'' \<longrightarrow> getVarBool s2 ''out_0'' = True)"


end