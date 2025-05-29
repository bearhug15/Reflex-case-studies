theory Microgrid_VC231
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
 and st8_RAEScharging_state:"(getPstate st8 ''RAEScharging'')=''control''"
 and st8_if29:"(((getVarReal st8 ''SOC'') < (real 1)) \<and> (((getVarReal st8 ''Pwec'') - (getVarReal st8 ''Pl'')) > 250))=False"
 and st9:"(st9=(setVarReal st8 ''RAESch'' (real 0)))"
 and st10:"(st10=(setVarReal st9 ''Pwec_curt'' ((getVarReal st9 ''Pwec'') - (getVarReal st9 ''Pl''))))"
 and st10_RAESdischarging_state:"(getPstate st10 ''RAESdischarging'')=''control''"
 and st10_if48:"(((getVarReal st10 ''Pl'') - (getVarReal st10 ''Pwec'')) > 250)=True"
 and st10_if50:"(((getVarReal st10 ''Pl'') - (getVarReal st10 ''Pwec'')) < 550)=False"
 and st11:"(st11=(setVarReal st10 ''RAESdisch'' 550))"
 and st12:"(st12=(setPstate st11 ''GeneratorWork'' ''control''))"
 and st12_GeneratorWork_state:"(getPstate st12 ''GeneratorWork'')=''control''"
 and st12_if25:"(getVarBool st12 ''_dshcg_gen'')=False"
 and st12_if27:"(((getVarBool st12 ''CycleCh'') \<and> (((getVarReal st12 ''Pl'') - (getVarReal st12 ''Pwec'')) < (1010 * 0.21))) \<and> ((getVarReal st12 ''SOC'') < (real 1)))=False"
 and st13:"(st13=(setVarReal st12 ''Pdg'' ((getVarReal st12 ''Pl'') - (getVarReal st12 ''Pwec''))))"
 and st14:"(st14=(toEnv st13))"
 and st_final:"(st_final=st14)"
shows "(inv st_final)"

end
