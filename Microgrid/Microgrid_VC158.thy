theory Microgrid_VC158
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
 and st9_if50:"(((getVarReal st9 ''Pwec'') - (getVarReal st9 ''Pl'')) < 550)=False"
 and st10:"(st10=(setVarReal st9 ''RAESch'' 550))"
 and st11:"(st11=(setVarReal st10 ''Pwec_curt'' (((getVarReal st10 ''Pwec'') - (getVarReal st10 ''Pl'')) - 550)))"
 and st11_RAESdischarging_state:"(getPstate st11 ''RAESdischarging'')=''stop''"
 and st11_GeneratorWork_state:"(getPstate st11 ''GeneratorWork'')=''control''"
 and st11_if33:"(getVarBool st11 ''_dshcg_gen'')=False"
 and st11_if34:"(((getVarBool st11 ''CycleCh'') \<and> (((getVarReal st11 ''Pl'') - (getVarReal st11 ''Pwec'')) < (1010 * 0.21))) \<and> ((getVarReal st11 ''SOC'') < (real 1)))=True"
 and st12:"(st12=(setVarReal st11 ''RAESch'' 550))"
 and st13:"(st13=(setVarReal st12 ''Pdg'' (((getVarReal st12 ''Pl'') - (getVarReal st12 ''Pwec'')) + 550)))"
 and st14:"(st14=(toEnv st13))"
 and st_final:"(st_final=st14)"
shows "(inv st_final)"

end
