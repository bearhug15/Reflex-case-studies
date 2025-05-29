theory Microgrid_VC114
imports MicrogridTheory
begin

lemma
 assumes base_inv:"(inv st0)"
 and st1:"(st1=(setVarReal st0 ''Pwec'' Pwec))"
 and st2:"(st2=(setVarReal st1 ''SOC'' SOC))"
 and st3:"(st3=(setVarBool st2 ''CycleCh'' CycleCh))"
 and st4:"(st4=(setVarReal st3 ''Pl'' Pl))"
 and st4_MainController_state:"(getPstate st4 ''MainController'')=''control''"
 and st4_if1:"((getVarReal st4 ''Pwec'') > (getVarReal st4 ''Pl''))=False"
 and st5:"(st5=(setPstate st4 ''RAEScharging'' ''''stop''''))"
 and st6:"(st6=(setVarReal st5 ''RAESch'' (real 0)))"
 and st6_if0:"((getVarReal st6 ''SOC'') > 0.2)=True"
 and st7:"(st7=(setPstate st6 ''RAESdischarging'' ''control''))"
 and st7_RAEScharging_state:"(getPstate st7 ''RAEScharging'')=''stop''"
 and st7_RAESdischarging_state:"(getPstate st7 ''RAESdischarging'')=''control''"
 and st7_if16:"(((getVarReal st7 ''Pl'') - (getVarReal st7 ''Pwec'')) > 250)=True"
 and st7_if17:"(((getVarReal st7 ''Pl'') - (getVarReal st7 ''Pwec'')) < 550)=True"
 and st8:"(st8=(setVarReal st7 ''RAESdisch'' ((getVarReal st7 ''Pl'') - (getVarReal st7 ''Pwec''))))"
 and st8_GeneratorWork_state:"(getPstate st8 ''GeneratorWork'')=''control''"
 and st8_if21:"(getVarBool st8 ''_dshcg_gen'')=False"
 and st8_if22:"(((getVarBool st8 ''CycleCh'') \<and> (((getVarReal st8 ''Pl'') - (getVarReal st8 ''Pwec'')) < (1010 * 0.21))) \<and> ((getVarReal st8 ''SOC'') < (real 1)))=True"
 and st9:"(st9=(setVarReal st8 ''RAESch'' 550))"
 and st10:"(st10=(setVarReal st9 ''Pdg'' (((getVarReal st9 ''Pl'') - (getVarReal st9 ''Pwec'')) + 550)))"
 and st11:"(st11=(toEnv st10))"
 and st_final:"(st_final=st11)"
shows "(inv st_final)"

end
