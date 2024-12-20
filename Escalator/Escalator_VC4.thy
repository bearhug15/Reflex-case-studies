theory Escalator_VC4
imports EscalatorTheory Requirements extra
begin

lemma extra:
 assumes base_inv:"(extraInv st0)"
 and st1:"(st1=(setVarBool st0 ''inp_3'' inp_3))"
 and st2:"(st2=(setVarBool st1 ''inp_2'' inp_2))"
 and st3:"(st3=(setVarBool st2 ''inp_1'' inp_1))"
 and st4:"(st4=(setVarBool st3 ''inp_0'' inp_0))"
 and st5:"(st5=(setVarBool st4 ''inp_4'' inp_4))"
 and st5_Ctrl_state:"(getPstate st5 ''Ctrl'')=''motionless''"
 and st5_if1:"(getVarBool st5 ''inp_3'')=False"
 and st5_if3:"(getVarBool st5 ''inp_4'')=False"
 and st5_if4:"((getVarBool st5 ''inp_0'') \<or> (getVarBool st5 ''inp_1''))=True"
 and st5_if6:"((getVarBool st5 ''inp_2'') = True)=False"
 and st6:"(st6=(setVarBool st5 ''out_1'' True))"
 and st7:"(st7=(setVarBool st6 ''_moving'' True))"
 and st8:"(st8=(setVarBool st7 ''_direction'' False))"
 and st9:"(st9=(setPstate st8 ''Ctrl'' ''goDown''))"
 and st10:"(st10=(toEnv st9))"
 and st_final:"(st_final=st10)"
shows "(extraInv st_final)" by sorry

lemma 
 assumes base_inv:"(inv1 st0)"
 and st1:"(st1=(setVarBool st0 ''inp_3'' inp_3))"
 and st2:"(st2=(setVarBool st1 ''inp_2'' inp_2))"
 and st3:"(st3=(setVarBool st2 ''inp_1'' inp_1))"
 and st4:"(st4=(setVarBool st3 ''inp_0'' inp_0))"
 and st5:"(st5=(setVarBool st4 ''inp_4'' inp_4))"
 and st5_Ctrl_state:"(getPstate st5 ''Ctrl'')=''motionless''"
 and st5_if1:"(getVarBool st5 ''inp_3'')=False"
 and st5_if3:"(getVarBool st5 ''inp_4'')=False"
 and st5_if4:"((getVarBool st5 ''inp_0'') \<or> (getVarBool st5 ''inp_1''))=True"
 and st5_if6:"((getVarBool st5 ''inp_2'') = True)=False"
 and st6:"(st6=(setVarBool st5 ''out_1'' True))"
 and st7:"(st7=(setVarBool st6 ''_moving'' True))"
 and st8:"(st8=(setVarBool st7 ''_direction'' False))"
 and st9:"(st9=(setPstate st8 ''Ctrl'' ''goDown''))"
 and st10:"(st10=(toEnv st9))"
 and st_final:"(st_final=st10)"
shows "(inv1 st_final)"
proof(simp only: inv1_def; rule conjI)
  show "extraInv st_final" using assms extra inv1_def by auto
next
  show "R1 st_final"
  proof -
    have "toEnvP st0 \<and> toEnvP st_final \<and> st0 = predEnv st_final" using assms inv1_def extraInv by auto
    moreover have "P2_1_cons R1A st0" using R1A_def assms inv1_def R1_to_P2_1_cons by auto
    moreover have "R1A st_final st0" using assms R1A_def by auto
    ultimately show ?thesis using P2_1_lemma P2_1_cons_to_R1 by auto
  qed
qed

lemma 
 assumes base_inv:"(inv3 st0)"
 and st1:"(st1=(setVarBool st0 ''inp_3'' inp_3))"
 and st2:"(st2=(setVarBool st1 ''inp_2'' inp_2))"
 and st3:"(st3=(setVarBool st2 ''inp_1'' inp_1))"
 and st4:"(st4=(setVarBool st3 ''inp_0'' inp_0))"
 and st5:"(st5=(setVarBool st4 ''inp_4'' inp_4))"
 and st5_Ctrl_state:"(getPstate st5 ''Ctrl'')=''motionless''"
 and st5_if1:"(getVarBool st5 ''inp_3'')=False"
 and st5_if3:"(getVarBool st5 ''inp_4'')=False"
 and st5_if4:"((getVarBool st5 ''inp_0'') \<or> (getVarBool st5 ''inp_1''))=True"
 and st5_if6:"((getVarBool st5 ''inp_2'') = True)=False"
 and st6:"(st6=(setVarBool st5 ''out_1'' True))"
 and st7:"(st7=(setVarBool st6 ''_moving'' True))"
 and st8:"(st8=(setVarBool st7 ''_direction'' False))"
 and st9:"(st9=(setPstate st8 ''Ctrl'' ''goDown''))"
 and st10:"(st10=(toEnv st9))"
 and st_final:"(st_final=st10)"
shows "(inv3 st_final)"
proof(simp only: inv3_def; rule conjI)
  show "extraInv st_final" using assms extra inv3_def by auto
next
  show "R3 st_final"
  proof -
    have "toEnvP st0 \<and> toEnvP st_final \<and> st0 = predEnv st_final" using assms inv3_def extraInv by auto
    moreover have "P2_1_cons R3A st0" using R3A_def assms inv3_def R3_to_P2_1_cons by auto
    moreover have "R3A st_final st0" using assms R3A_def by auto
    ultimately show ?thesis using P2_1_lemma P2_1_cons_to_R3 by auto
  qed
qed
end
