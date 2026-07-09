theory BaggageCarousel_VC1
	imports BaggageCarouselTheory Requirements
begin
lemma
assumes base_inv:"inv(st0)"
	and st1:"st1=(setVarBool st0 ''inp_3'' inp_3)"
	and st2:"st2=(setVarBool st1 ''inp_2'' inp_2)"
	and st3:"st3=(setVarBool st2 ''inp_1'' inp_1)"
	and st3_state:"getPstate st3 ''Carousel''=''turnedOff''"
	and st3_condition_0:"((((getVarBool st3 ''iinp_0'') = True) \<and> ((getVarBool st3 ''inp_2'') = False)) \<and> ((getVarBool st3 ''inp_3'') = False))"
	and st4:"st4=(setVarBool st3 ''out_0'' (bool True))"
	and st5:"st5=setPstate st4 ''Carousel'' ''turnedOn''"
	and st6:"st6=toEnv st5"
	and st_final:"st_final=st6"
shows "inv(st_final)"
end