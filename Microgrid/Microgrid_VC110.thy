theory Microgrid_VC110
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
 and st7_RAEScharging_state:"(getPstate st7 ''RAEScharging'')=''control''"
 and st7_if15:"(((getVarReal st7 ''SOC'') < (real 1)) \<and> (((getVarReal st7 ''Pwec'') - (getVarReal st7 ''Pl'')) > 250))=False"
 and st8:"(st8=(setVarReal st7 ''RAESch'' (real 0)))"
 and st9:"(st9=(setVarReal st8 ''Pwec_curt'' ((getVarReal st8 ''Pwec'') - (getVarReal st8 ''Pl''))))"
 and st9_RAESdischarging_state:"(getPstate st9 ''RAESdischarging'')=''stop''"
 and st9_GeneratorWork_state:"(getPstate st9 ''GeneratorWork'')=''control''"
 and st9_if41:"(getVarBool st9 ''_dshcg_gen'')=False"
 and st9_if42:"(((getVarBool st9 ''CycleCh'') \<and> (((getVarReal st9 ''Pl'') - (getVarReal st9 ''Pwec'')) < (1010 * 0.21))) \<and> ((getVarReal st9 ''SOC'') < (real 1)))=True"
 and st10:"(st10=(setVarReal st9 ''RAESch'' 550))"
 and st11:"(st11=(setVarReal st10 ''Pdg'' (((getVarReal st10 ''Pl'') - (getVarReal st10 ''Pwec'')) + 550)))"
 and st12:"(st12=(toEnv st11))"
 and st_final:"(st_final=st12)"
shows "(inv st_final)"

end
