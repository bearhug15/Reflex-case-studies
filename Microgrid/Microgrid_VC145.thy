theory Microgrid_VC145
imports MicrogridTheory Reflex
begin

definition inv3 :: "state\<Rightarrow>bool" where 
"inv3 s = (\<forall> s1. substate s1 s 
\<and> toEnvP s1 
\<and> ((getVarBool s1 ''CycleCh''  
  \<and> (getVarReal s1 ''Pl'' - getVarReal s1 ''Pwec'' < 1010*0.21))
\<or> (getVarReal s1 ''SOC'' > 0.2 \<and> (getVarReal s1 ''Pl'' - getVarReal s1 ''Pwec'' > 550))) 
\<and> getVarReal s1 ''Pdg'' > 0 
\<longrightarrow> getVarReal s1 ''Pdg'' \<ge> 1010*0.6)"

definition inv :: "state\<Rightarrow>bool" where
"inv s \<equiv> inv3 s \<and> toEnvP s"

lemma
 assumes base_inv:"(inv st0)"
 and st1:"(st1=(setVarReal st0 ''Pwec'' Pwec))"
 and st2:"(st2=(setVarReal st1 ''SOC'' SOC))"
 and st3:"(st3=(setVarBool st2 ''CycleCh'' CycleCh))"
 and st4:"(st4=(setVarReal st3 ''Pl'' Pl))"
 and st4_MainController_state:"(getPstate st4 ''MainController'')=''control''"
 and st4_if1:"((getVarReal st4 ''Pwec'') > (getVarReal st4 ''Pl''))=False"
 and st5:"(st5=(setPstate st4 ''RAEScharging'' ''stop''))"
 and st6:"(st6=(setVarReal st5 ''RAESch'' (real 0)))"
 and st6_if0:"((getVarReal st6 ''SOC'') > 0.2)=True"
 and st7:"(st7=(setPstate st6 ''RAESdischarging'' ''control''))"
 and st7_RAEScharging_state:"(getPstate st7 ''RAEScharging'')=''stop''"
 and st7_RAESdischarging_state:"(getPstate st7 ''RAESdischarging'')=''control''"
 and st7_if16:"(((getVarReal st7 ''Pl'') - (getVarReal st7 ''Pwec'')) \<ge> 250)=True"
 and st7_if18:"(((getVarReal st7 ''Pl'') - (getVarReal st7 ''Pwec'')) \<le> 550)=False"
 and st8:"(st8=(setVarReal st7 ''RAESdisch'' 550))"
 and st9:"(st9=(setVarBool st8 ''_dshcg_gen'' True))"
 and st10:"(st10=(setPstate st9 ''GeneratorWork'' ''control''))"
 and st10_GeneratorWork_state:"(getPstate st10 ''GeneratorWork'')=''control''"
 and st10_if40:"(getVarBool st10 ''_dshcg_gen'')=True"
 and st11:"(st11=(setVarBool st10 ''_dshcg_gen'' False))"
 and st12:"(st12=(setVarReal st11 ''Pdg'' (((getVarReal st11 ''Pl'') - (getVarReal st11 ''Pwec'')) - 550)))"
 and st13:"(st13=(toEnv st12))"
 and st_final:"(st_final=st13)"
shows "(inv st_final)"
proof (simp only: inv_def;rule conjI)
  show "inv3 st_final"
  proof (simp only:inv3_def;rule allI;rule impI)
  fix s1
  assume assms1:"substate s1 st_final \<and>
          toEnvP s1 \<and>
          (getVarBool s1 ''CycleCh'' \<and>
           getVarReal s1 ''Pl'' -
           getVarReal s1 ''Pwec''
           < 1010 * (21 / 10\<^sup>2) \<or>
           2 / 10
           < getVarReal s1 ''SOC'' \<and>
           550
           < getVarReal s1 ''Pl'' -
             getVarReal s1 ''Pwec'') \<and>
          0 < getVarReal s1 ''Pdg''"
  then show "1010 * (6 / 10)\<le> getVarReal s1 ''Pdg''"
  proof -
  have "getVarReal st_final ''Pdg'' = (((getVarReal st_final ''Pl'') - (getVarReal st_final ''Pwec'')) - 550)" using assms by auto
  moreover have "substate st_final st_final 
              \<and> toEnvP st_final" using assms inv_def substate_refl by auto
  moreover have "getVarReal st_final ''SOC'' > 0.2" using assms by auto
  moreover have "getVarReal st_final ''Pl'' - getVarReal st_final ''Pwec'' > 550" using assms by auto
  moreover have "getVarReal st_final ''Pdg'' > 0" using assms by auto
  from calculation consider (a) "getVarReal st_final ''Pl'' - getVarReal st_final ''Pwec'' > 550 \<and> getVarReal st_final ''Pl'' - getVarReal st_final ''Pwec'' <1010*0.6 +550" 
    | (b) "getVarReal st_final ''Pl'' - getVarReal st_final ''Pwec'' \<ge> 1010*0.6 +550" by linarith
  then have "getVarReal st_final ''Pdg'' \<ge> 1010*0.6" 
  proof cases
    case a
    then have "getVarReal st_final ''Pl'' - getVarReal st_final ''Pwec'' -550 < 1010*0.6" by auto
    then have "getVarReal st_final ''Pdg'' < 1010*0.6" using calculation by auto
    (*contradicts with provable statement*)
    thus ?thesis by sorry
  next
    case b 
    then have "getVarReal st_final ''Pl'' - getVarReal st_final ''Pwec'' -550 \<ge> 1010*0.6" by auto
    thus ?thesis using calculation by auto
  qed
  

end
