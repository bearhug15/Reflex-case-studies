theory Microgrid_VC62
imports MicrogridTheory
begin

lemma
 assumes base_inv:"(inv st0)"
 and st1:"(st1=(setVarReal st0 ''Pwec'' Pwec))"
 and st2:"(st2=(setVarReal st1 ''SOC'' SOC))"
 and st3:"(st3=(setVarBool st2 ''CycleCh'' CycleCh))"
 and st4:"(st4=(setVarReal st3 ''Pl'' Pl))"
 and st4_MainController_state:"(getPstate st4 ''MainController'')=''control''"
 and st4_if0:"((getVarReal st4 ''Pwec'') > (getVarReal st4 ''Pl''))=True"
 and st5:"(st5=(setPstate st4 ''RAESdischarging'' ''''stop''''))"
 and st6:"(st6=(setVarReal st5 ''RAESdisch'' (real 0)))"
 and st7:"(st7=(setPstate st6 ''RAEScharging'' ''control''))"
 and st7_RAEScharging_state:"(getPstate st7 ''RAEScharging'')=''stop''"
 and st7_RAESdischarging_state:"(getPstate st7 ''RAESdischarging'')=''stop''"
 and st7_GeneratorWork_state:"(getPstate st7 ''GeneratorWork'')=''control''"
 and st7_if9:"(getVarBool st7 ''_dshcg_gen'')=False"
 and st7_if10:"(((getVarBool st7 ''CycleCh'') \<and> (((getVarReal st7 ''Pl'') - (getVarReal st7 ''Pwec'')) < (1010 * 0.21))) \<and> ((getVarReal st7 ''SOC'') < (real 1)))=True"
 and st8:"(st8=(setVarReal st7 ''RAESch'' 550))"
 and st9:"(st9=(setVarReal st8 ''Pdg'' (((getVarReal st8 ''Pl'') - (getVarReal st8 ''Pwec'')) + 550)))"
 and st10:"(st10=(toEnv st9))"
 and st_final:"(st_final=st10)"
shows "(inv st_final)"

end
