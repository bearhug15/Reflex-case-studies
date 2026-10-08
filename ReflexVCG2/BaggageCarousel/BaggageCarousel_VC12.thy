theory BaggageCarousel_VC12
	imports BaggageCarouselTheory Requirements
begin
lemma
assumes base_inv:"inv(st0)"
	and st1:"st1=(setVarBool st0 ''inp_3'' inp_3)"
	and st2:"st2=(setVarBool st1 ''inp_2'' inp_2)"
	and st3:"st3=(setVarBool st2 ''inp_1'' inp_1)"
	and st3_state:"getPstate st3 ''Carousel''=''error''"
	and st4:"st4=toEnv st3"
	and st_final:"st_final=st4"
shows "inv(st_final)"
end