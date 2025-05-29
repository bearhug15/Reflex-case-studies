theory Microgrid_VC52
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
 and st7_if4:"(((getVarReal st7 ''Pl'') - (getVarReal st7 ''Pwec'')) > 250)=True"
 and st7_if5:"(((getVarReal st7 ''Pl'') - (getVarReal st7 ''Pwec'')) < 550)=True"
 and st8:"(st8=(setVarReal st7 ''RAESdisch'' ((getVarReal st7 ''Pl'') - (getVarReal st7 ''Pwec''))))"
 and st8_GeneratorWork_state:"(getPstate st8 ''GeneratorWork'')=''stop''"
 and st9:"(st9=(toEnv st8))"
 and st_final:"(st_final=st9)"
shows "(inv st_final)"

end
