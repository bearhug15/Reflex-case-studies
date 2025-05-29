theory Microgrid_VC68
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
 and st7_if13:"(((getVarReal st7 ''Pwec'') - (getVarReal st7 ''Pl'')) < 550)=True"
 and st8:"(st8=(setVarReal st7 ''RAESch'' ((getVarReal st7 ''Pwec'') - (getVarReal st7 ''Pl''))))"
 and st8_RAESdischarging_state:"(getPstate st8 ''RAESdischarging'')=''control''"
 and st8_if12:"(((getVarReal st8 ''Pl'') - (getVarReal st8 ''Pwec'')) > 250)=True"
 and st8_if13:"(((getVarReal st8 ''Pl'') - (getVarReal st8 ''Pwec'')) < 550)=True"
 and st9:"(st9=(setVarReal st8 ''RAESdisch'' ((getVarReal st8 ''Pl'') - (getVarReal st8 ''Pwec''))))"
 and st9_GeneratorWork_state:"(getPstate st9 ''GeneratorWork'')=''stop''"
 and st10:"(st10=(toEnv st9))"
 and st_final:"(st_final=st10)"
shows "(inv st_final)"

end
