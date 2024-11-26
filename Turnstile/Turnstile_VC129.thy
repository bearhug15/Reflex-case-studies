theory Turnstile_VC129
imports TurnstileTheory
begin

lemma
 assumes base_inv:"(inv st0)"
 and st1:"(st1=(setVarBool st0 ''inp_2'' inp_2))"
 and st2:"(st2=(setVarBool st1 ''inp_1'' inp_1))"
 and st3:"(st3=(setVarBool st2 ''inp_0'' inp_0))"
 and st3_Init_state:"(getPstate st3 ''Init'')=''stop''"
 and st3_Controller_state:"(getPstate st3 ''Controller'')=''isOpened''"
 and st3_if15:"(getVarBool st3 ''inp_0'')=False"
 and st3_isOpened_timeout:"0t9s>(ltime st3 ''Controller'')"
 and st3_EntranceController_state:"(getPstate st3 ''EntranceController'')=''isOpened''"
 and st3_if18:"(\<not>(getVarBool st3 ''inp_2''))=True"
 and st4:"(st4=(setVarBool st3 ''out_2'' False))"
 and st5:"(st5=(setVarBool st4 ''out_1'' True))"
 and st6:"(st6=(setPstate st5 ''Unlocker'' ''unlock''))"
 and st7:"(st7=(setPstate st6 ''EntranceController'' ''isClosed''))"
 and st7_Unlocker_state:"(getPstate st7 ''Unlocker'')=''unlock''"
 and st7_unlock_timeout:"0t1s\<le>(ltime st7 ''Unlocker'')"
 and st8:"(st8=(setVarBool st7 ''out_1'' False))"
 and st9:"(st9=(setPstate st8 ''Unlocker'' ''''stop''''))"
 and st10:"(st10=(toEnv st9))"
 and st_final:"(st_final=st10)"
shows "(inv st_final)"

end
