theory Microgrid_VC254
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
 and st6_if1:"((getVarReal st6 ''SOC'') > 0.2)=False"
 and st7:"(st7=(setVarReal st6 ''RAESdisch'' (real 0)))"
 and st8:"(st8=(setPstate st7 ''RAESdischarging'' ''''stop''''))"
 and st8_if25:"(getPstate st8 ''GeneratorWork'' = ''stop'')=False"
 and st8_RAEScharging_state:"(getPstate st8 ''RAEScharging'')=''stop''"
 and st8_RAESdischarging_state:"(getPstate st8 ''RAESdischarging'')=''stop''"
 and st8_GeneratorWork_state:"(getPstate st8 ''GeneratorWork'')=''control''"
 and st8_if35:"(getVarBool st8 ''_dshcg_gen'')=False"
 and st8_if36:"(((getVarBool st8 ''CycleCh'') \<and> (((getVarReal st8 ''Pl'') - (getVarReal st8 ''Pwec'')) < (1010 * 0.21))) \<and> ((getVarReal st8 ''SOC'') < (real 1)))=True"
 and st9:"(st9=(setVarReal st8 ''RAESch'' 550))"
 and st10:"(st10=(setVarReal st9 ''Pdg'' (((getVarReal st9 ''Pl'') - (getVarReal st9 ''Pwec'')) + 550)))"
 and st11:"(st11=(toEnv st10))"
 and st_final:"(st_final=st11)"
shows "(inv st_final)"

end
