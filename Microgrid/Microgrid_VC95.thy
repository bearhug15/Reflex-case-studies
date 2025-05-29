theory Microgrid_VC95
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
 and st7_if12:"(((getVarReal st7 ''SOC'') < (real 1)) \<and> (((getVarReal st7 ''Pwec'') - (getVarReal st7 ''Pl'')) > 250))=True"
 and st7_if14:"(((getVarReal st7 ''Pwec'') - (getVarReal st7 ''Pl'')) < 550)=False"
 and st8:"(st8=(setVarReal st7 ''RAESch'' 550))"
 and st9:"(st9=(setVarReal st8 ''Pwec_curt'' (((getVarReal st8 ''Pwec'') - (getVarReal st8 ''Pl'')) - 550)))"
 and st9_RAESdischarging_state:"(getPstate st9 ''RAESdischarging'')=''stop''"
 and st9_GeneratorWork_state:"(getPstate st9 ''GeneratorWork'')=''control''"
 and st9_if33:"(getVarBool st9 ''_dshcg_gen'')=False"
 and st9_if35:"(((getVarBool st9 ''CycleCh'') \<and> (((getVarReal st9 ''Pl'') - (getVarReal st9 ''Pwec'')) < (1010 * 0.21))) \<and> ((getVarReal st9 ''SOC'') < (real 1)))=False"
 and st10:"(st10=(setVarReal st9 ''Pdg'' ((getVarReal st9 ''Pl'') - (getVarReal st9 ''Pwec''))))"
 and st11:"(st11=(toEnv st10))"
 and st_final:"(st_final=st11)"
shows "(inv st_final)"

end
