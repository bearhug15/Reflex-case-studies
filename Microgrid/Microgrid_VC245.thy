theory Microgrid_VC245
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
 and st8_if29:"(getPstate st8 ''GeneratorWork'' = ''stop'')=False"
 and st8_RAEScharging_state:"(getPstate st8 ''RAEScharging'')=''control''"
 and st8_if30:"(((getVarReal st8 ''SOC'') < (real 1)) \<and> (((getVarReal st8 ''Pwec'') - (getVarReal st8 ''Pl'')) > 250))=True"
 and st8_if31:"(((getVarReal st8 ''Pwec'') - (getVarReal st8 ''Pl'')) < 550)=True"
 and st9:"(st9=(setVarReal st8 ''RAESch'' ((getVarReal st8 ''Pwec'') - (getVarReal st8 ''Pl''))))"
 and st9_RAESdischarging_state:"(getPstate st9 ''RAESdischarging'')=''control''"
 and st9_if64:"(((getVarReal st9 ''Pl'') - (getVarReal st9 ''Pwec'')) > 250)=True"
 and st9_if66:"(((getVarReal st9 ''Pl'') - (getVarReal st9 ''Pwec'')) < 550)=False"
 and st10:"(st10=(setVarReal st9 ''RAESdisch'' 550))"
 and st11:"(st11=(setVarBool st10 ''_dshcg_gen'' True))"
 and st12:"(st12=(setPstate st11 ''GeneratorWork'' ''control''))"
 and st12_GeneratorWork_state:"(getPstate st12 ''GeneratorWork'')=''control''"
 and st12_if56:"(getVarBool st12 ''_dshcg_gen'')=True"
 and st13:"(st13=(setVarBool st12 ''_dshcg_gen'' False))"
 and st14:"(st14=(setVarReal st13 ''Pdg'' (((getVarReal st13 ''Pl'') - (getVarReal st13 ''Pwec'')) - 550)))"
 and st15:"(st15=(toEnv st14))"
 and st_final:"(st_final=st15)"
shows "(inv st_final)"

end
