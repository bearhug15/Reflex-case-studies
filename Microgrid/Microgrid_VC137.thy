theory Microgrid_VC137
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
 and st8_if24:"(getPstate st8 ''GeneratorWork'' = ''stop'')=True"
 and st9:"(st9=(setPstate st8 ''GeneratorWork'' ''control''))"
 and st9_RAEScharging_state:"(getPstate st9 ''RAEScharging'')=''control''"
 and st9_if48:"(((getVarReal st9 ''SOC'') < (real 1)) \<and> (((getVarReal st9 ''Pwec'') - (getVarReal st9 ''Pl'')) > 250))=True"
 and st9_if49:"(((getVarReal st9 ''Pwec'') - (getVarReal st9 ''Pl'')) < 550)=True"
 and st10:"(st10=(setVarReal st9 ''RAESch'' ((getVarReal st9 ''Pwec'') - (getVarReal st9 ''Pl''))))"
 and st10_RAESdischarging_state:"(getPstate st10 ''RAESdischarging'')=''control''"
 and st10_if27:"(((getVarReal st10 ''Pl'') - (getVarReal st10 ''Pwec'')) > 250)=False"
 and st11:"(st11=(setVarReal st10 ''RAESdisch'' (real 0)))"
 and st12:"(st12=(setPstate st11 ''RAESdischarging'' ''''stop''''))"
 and st13:"(st13=(setPstate st12 ''GeneratorWork'' ''control''))"
 and st14:"(st14=(setVarBool st13 ''_dshcg_gen'' True))"
 and st14_GeneratorWork_state:"(getPstate st14 ''GeneratorWork'')=''control''"
 and st14_if0:"(getVarBool st14 ''_dshcg_gen'')=True"
 and st15:"(st15=(setVarBool st14 ''_dshcg_gen'' False))"
 and st16:"(st16=(setVarReal st15 ''Pdg'' (((getVarReal st15 ''Pl'') - (getVarReal st15 ''Pwec'')) - 550)))"
 and st17:"(st17=(toEnv st16))"
 and st_final:"(st_final=st17)"
shows "(inv st_final)"

end
