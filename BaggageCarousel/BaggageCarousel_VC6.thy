theory BaggageCarousel_VC6
	imports BaggageCarouselTheory Requirements
begin
lemma
assumes base_inv:"inv(st0)"
	and st1:"st1=(setVarBool st0 ''inp_3'' inp_3)"
	and st2:"st2=(setVarBool st1 ''inp_2'' inp_2)"
	and st3:"st3=(setVarBool st2 ''inp_1'' inp_1)"
	and st3_state:"getPstate st3 ''Carousel''=''turnedOn''"
	and st3_condition_9:"(\<not> ((getVarBool st3 ''inp_1'') = True))"
	and st3_condition_13:"(\<not> (getVarBool (setVarBool (setVarBool st3 ''inp_3'' True) ''inp_2'' (True \<or> (getVarBool (setVarBool st3 ''inp_3'' True) ''inp_3''))) ''inp_2''))"
	and st4:"st4=(setVarBool (setVarBool st3 ''inp_3'' True) ''inp_2'' (True \<or> (getVarBool (setVarBool st3 ''inp_3'' True) ''inp_3'')))"
	and st4_condition_14:"(ltime st4 ''Carousel'' \<ge> 30000)"
	and st5:"st5=(setVarBool st4 ''out_0'' (bool False))"
	and st6:"st6=setPstate st5 ''Carousel'' ''turnedOff''"
	and st7:"st7=toEnv st6"
	and st_final:"st_final=st7"
shows "inv(st_final)"
end