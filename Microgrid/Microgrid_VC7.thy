theory Microgrid_VC7
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
 and st7_RAEScharging_state:"(getPstate st7 ''RAEScharging'')=''control''"
 and st7_if0:"(((getVarReal st7 ''SOC'') < (real 1)) \<and> (((getVarReal st7 ''Pwec'') - (getVarReal st7 ''Pl'')) > 250))=True"
 and st7_if1:"(((getVarReal st7 ''Pwec'') - (getVarReal st7 ''Pl'')) < 550)=True"
 and st8:"(st8=(setVarReal st7 ''RAESch'' ((getVarReal st7 ''Pwec'') - (getVarReal st7 ''Pl''))))"
 and st8_RAESdischarging_state:"(getPstate st8 ''RAESdischarging'')=''control''"
 and st8_if0:"(((getVarReal st8 ''Pl'') - (getVarReal st8 ''Pwec'')) > 250)=True"
 and st8_if2:"(((getVarReal st8 ''Pl'') - (getVarReal st8 ''Pwec'')) < 550)=False"
 and st9:"(st9=(setVarReal st8 ''RAESdisch'' 550))"
 and st10:"(st10=(setPstate st9 ''GeneratorWork'' ''control''))"
 and st10_GeneratorWork_state:"(getPstate st10 ''GeneratorWork'')=''control''"
 and st10_if1:"(getVarBool st10 ''_dshcg_gen'')=False"
 and st10_if3:"(((getVarBool st10 ''CycleCh'') \<and> (((getVarReal st10 ''Pl'') - (getVarReal st10 ''Pwec'')) < (1010 * 0.21))) \<and> ((getVarReal st10 ''SOC'') < (real 1)))=False"
 and st11:"(st11=(setVarReal st10 ''Pdg'' ((getVarReal st10 ''Pl'') - (getVarReal st10 ''Pwec''))))"
 and st12:"(st12=(toEnv st11))"
 and st_final:"(st_final=st12)"
shows "(inv st_final)"

end
