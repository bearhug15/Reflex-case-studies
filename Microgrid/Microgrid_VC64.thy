theory Microgrid_VC64
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
 and st7_RAESdischarging_state:"(getPstate st7 ''RAESdischarging'')=''stop''"
 and st7_GeneratorWork_state:"(getPstate st7 ''GeneratorWork'')=''stop''"
 and st8:"(st8=(toEnv st7))"
 and st_final:"(st_final=st8)"
shows "(inv st_final)"

end
