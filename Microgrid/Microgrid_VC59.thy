theory Microgrid_VC59
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
 and st7_RAESdischarging_state:"(getPstate st7 ''RAESdischarging'')=''control''"
 and st7_if7:"(((getVarReal st7 ''Pl'') - (getVarReal st7 ''Pwec'')) > 250)=False"
 and st8:"(st8=(setVarReal st7 ''RAESdisch'' (real 0)))"
 and st9:"(st9=(setPstate st8 ''RAESdischarging'' ''''stop''''))"
 and st10:"(st10=(setPstate st9 ''GeneratorWork'' ''control''))"
 and st11:"(st11=(setVarBool st10 ''_dshcg_gen'' True))"
 and st11_GeneratorWork_state:"(getPstate st11 ''GeneratorWork'')=''control''"
 and st11_if9:"(getVarBool st11 ''_dshcg_gen'')=False"
 and st11_if11:"(((getVarBool st11 ''CycleCh'') \<and> (((getVarReal st11 ''Pl'') - (getVarReal st11 ''Pwec'')) < (1010 * 0.21))) \<and> ((getVarReal st11 ''SOC'') < (real 1)))=False"
 and st12:"(st12=(setVarReal st11 ''Pdg'' ((getVarReal st11 ''Pl'') - (getVarReal st11 ''Pwec''))))"
 and st13:"(st13=(toEnv st12))"
 and st_final:"(st_final=st13)"
shows "(inv st_final)"

end
