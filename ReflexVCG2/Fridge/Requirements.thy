theory Requirements
  imports ReflexPatterns extra
begin

definition R1 where "R1 s \<equiv> toEnvP s \<and>
(\<forall> s1 s2. toEnvP s1 \<and> toEnvP s2 \<and> substate s1 s2 \<and> substate s2 s \<and> toEnvNum s1 s2 = 1 \<and>
 getVarBool s1 ''inp_4'' = False \<and> getVarBool s2 ''inp_4'' = True \<longrightarrow> getVarBool s2 ''out_2'')"

definition R1A where
"R1A s2 s1 \<equiv>
getVarBool s1 ''inp_4'' = False \<and> getVarBool s2 ''inp_4'' = True \<longrightarrow> getVarBool s2 ''out_2''"

lemma R1_to_P2_1_cons:
"R1 s \<Longrightarrow> P2_1_cons R1A s"
  by (auto simp add: R1_def P2_1_cons_def R1A_def)

lemma P2_1_cons_to_R1:
"toEnvP s \<and> P2_1_cons R1A s \<Longrightarrow> R1 s"
  by (auto simp add: R1_def P2_1_cons_def R1A_def)

definition "inv1 s \<equiv> R1 s \<and> extraInv s"

definition R2 where "R2 s \<equiv> toEnvP s \<and>
(\<forall> s1 s2. substate s1 s2 \<and> substate s2 s \<and> toEnvP s1 \<and> toEnvP s2 \<and> toEnvNum s1 s2 = 1 \<and>
 getVarBool s1 ''inp_4'' = True \<and> getVarBool s2 ''inp_4'' = False \<longrightarrow> \<not> getVarBool s2 ''out_2'')"

definition R2A where
"R2A s2 s1 \<equiv>
getVarBool s1 ''inp_4'' = True \<and> getVarBool s2 ''inp_4'' = False \<longrightarrow> \<not> getVarBool s2 ''out_2''"

lemma R2_to_P2_1_cons:
"R2 s \<Longrightarrow> P2_1_cons R2A s"
  by (auto simp add: R2_def P2_1_cons_def R2A_def)

lemma P2_1_cons_to_R2:
"toEnvP s \<and> P2_1_cons R2A s \<Longrightarrow> R2 s"
  by (auto simp add: R2_def P2_1_cons_def R2A_def)

definition "inv2 s \<equiv> R2 s \<and> extraInv s"

definition R3 where "R3 s \<equiv> toEnvP s \<and>
(\<forall> s1. substate s1 s \<and> toEnvP s1 \<and> toEnvNum s1 s \<ge> 30000 \<and>  getVarBool s1 ''inp_4'' = True \<longrightarrow>
(\<exists> s3. toEnvP s3 \<and> substate s1 s3 \<and> substate s3 s \<and> toEnvNum s1 s3 \<le> 30000 \<and>
(getVarBool s3 ''out_3'' \<or> getVarBool s3 ''inp_4'' = False) \<and>
(\<forall> s2. toEnvP s2 \<and> substate s1 s2 \<and> substate s2 s3 \<and> s2 \<noteq> s3 \<longrightarrow>
 \<not> getVarBool s2 ''out_3'' \<and> getVarBool s2 ''inp_4'' = True)))"



definition R4 where "R4 s \<equiv> toEnvP s \<and>
(\<forall> s1 s2 s3. substate s1 s2 \<and> substate s2 s3 \<and> substate s3 s \<and> toEnvP s1 \<and> toEnvP s2 \<and>
 toEnvP s3 \<and> toEnvNum s1 s2 = 1 \<and> toEnvNum s2 s3 < 30000 \<and>
getVarBool s1 ''inp_4'' = False \<and> getVarBool s2 ''inp_4'' = True \<longrightarrow>
\<not> getVarBool s3 ''out_3'')"

definition R4A where
"R4A s3 s2 s1 \<equiv>
toEnvNum s2 s3 < 30000 \<and> getVarBool s1 ''inp_4'' = False \<and> getVarBool s2 ''inp_4'' = True \<longrightarrow>
\<not> getVarBool s3 ''out_3''"

lemma R4_to_P3_cons:
"R4 s \<Longrightarrow> P3_cons R4A s"
  by (auto simp add: R4_def P3_cons_def R4A_def)

lemma P3_cons_to_R4:
"toEnvP s \<and> P3_cons R4A s \<Longrightarrow> R4 s"
  by (auto simp add: R4_def P3_cons_def R4A_def)

definition "inv4 s \<equiv> R4 s \<and> extraInv s"

definition R5 where "R5 s \<equiv> toEnvP s \<and>
(\<forall> s1 s2. substate s1 s2 \<and> substate s2 s \<and> toEnvP s1 \<and> toEnvP s2 \<and> toEnvNum s1 s2 = 1 \<and> 
getVarBool s1 ''out_0'' = False \<and> getVarBool s2 ''out_1'' \<longrightarrow> getVarBool s2 ''out_0'' = True)"

definition R5A where
"R5A s2 s1 \<equiv>
getVarBool s1 ''out_0'' = False \<and> getVarBool s2 ''out_1'' \<longrightarrow> getVarBool s2 ''out_0'' = True"

lemma R5_to_P2_1_cons:
"R5 s \<Longrightarrow> P2_1_cons R5A s"
  by (auto simp add: R5_def P2_1_cons_def R5A_def)

lemma P2_1_cons_to_52:
"toEnvP s \<and> P2_1_cons R5A s \<Longrightarrow> R5 s"
  by (auto simp add: R5_def P2_1_cons_def R5A_def)

definition "inv5 s \<equiv> R5 s \<and> extraInv s"

end