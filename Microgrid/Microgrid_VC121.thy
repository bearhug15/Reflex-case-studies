theory Microgrid_VC121
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
 and st7_if19:"(((getVarReal st7 ''Pl'') - (getVarReal st7 ''Pwec'')) > 250)=False"
 and st8:"(st8=(setVarReal st7 ''RAESdisch'' (real 0)))"
 and st9:"(st9=(setPstate st8 ''RAESdischarging'' ''''stop''''))"
 and st10:"(st10=(setPstate st9 ''GeneratorWork'' ''control''))"
 and st11:"(st11=(setVarBool st10 ''_dshcg_gen'' True))"
 and st11_GeneratorWork_state:"(getPstate st11 ''GeneratorWork'')=''control''"
 and st11_if20:"(getVarBool st11 ''_dshcg_gen'')=True"
 and st12:"(st12=(setVarBool st11 ''_dshcg_gen'' False))"
 and st13:"(st13=(setVarReal st12 ''Pdg'' (((getVarReal st12 ''Pl'') - (getVarReal st12 ''Pwec'')) - 550)))"
 and st14:"(st14=(toEnv st13))"
 and st_final:"(st_final=st14)"
shows "(inv st_final)"

end
