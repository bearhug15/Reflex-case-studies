theory BaggageCarousel_VC3
	imports BaggageCarouselTheory Requirements
begin
lemma
assumes base_inv:"inv(st0)"
	and st1:"st1=(setVarBool st0 ''inp_3'' inp_3)"
	and st2:"st2=(setVarBool st1 ''inp_2'' inp_2)"
	and st3:"st3=(setVarBool st2 ''inp_1'' inp_1)"
	and st3_state:"getPstate st3 ''Carousel''=''turnedOn''"
	and st3_condition_2:"((getVarBool st3 ''inp_1'') = True)"
	and st4:"st4=reset st3"
	and st4_condition_3:"(getVarBool (setVarBool (setVarBool st4 ''inp_3'' True) ''inp_2'' (True \<or> (getVarBool (setVarBool st4 ''inp_3'' True) ''inp_3''))) ''inp_2'')"
	and st5:"st5=(setVarBool (setVarBool st4 ''inp_3'' True) ''inp_2'' (True \<or> (getVarBool (setVarBool st4 ''inp_3'' True) ''inp_3'')))"
	and st6:"st6=(setVarBool st5 ''out_0'' (bool False))"
	and st7:"st7=setPstate st6 ''Carousel'' ''turnedOff''"
	and st7_condition_5:"(ltime st7 ''Carousel'' < 30000)"
	and st8:"st8=toEnv st7"
	and st_final:"st_final=st8"
shows "inv(st_final)"
end