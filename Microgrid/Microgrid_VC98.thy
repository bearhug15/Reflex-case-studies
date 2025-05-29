theory Microgrid_VC98
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
 and st9_RAESdischarging_state:"(getPstate st9 ''RAESdischarging'')=''control''"
 and st9_if36:"(((getVarReal st9 ''Pl'') - (getVarReal st9 ''Pwec'')) > 250)=True"
 and st9_if37:"(((getVarReal st9 ''Pl'') - (getVarReal st9 ''Pwec'')) < 550)=True"
 and st10:"(st10=(setVarReal st9 ''RAESdisch'' ((getVarReal st9 ''Pl'') - (getVarReal st9 ''Pwec''))))"
 and st10_GeneratorWork_state:"(getPstate st10 ''GeneratorWork'')=''control''"
 and st10_if21:"(getVarBool st10 ''_dshcg_gen'')=False"
 and st10_if22:"(((getVarBool st10 ''CycleCh'') \<and> (((getVarReal st10 ''Pl'') - (getVarReal st10 ''Pwec'')) < (1010 * 0.21))) \<and> ((getVarReal st10 ''SOC'') < (real 1)))=True"
 and st11:"(st11=(setVarReal st10 ''RAESch'' 550))"
 and st12:"(st12=(setVarReal st11 ''Pdg'' (((getVarReal st11 ''Pl'') - (getVarReal st11 ''Pwec'')) + 550)))"
 and st13:"(st13=(toEnv st12))"
 and st_final:"(st_final=st13)"
shows "(inv st_final)"

end
