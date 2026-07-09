theory BaggageCarousel_VC2
	imports BaggageCarouselTheory Requirements
begin
lemma
assumes base_inv:"inv(st0)"
	and st1:"st1=(setVarBool st0 ''inp_3'' inp_3)"
	and st2:"st2=(setVarBool st1 ''inp_2'' inp_2)"
	and st3:"st3=(setVarBool st2 ''inp_1'' inp_1)"
	and st3_state:"getPstate st3 ''Carousel''=''turnedOff''"
	and st3_condition_1:"(\<not> ((((getVarBool st3 ''iinp_0'') = True) \<and> ((getVarBool st3 ''inp_2'') = False)) \<and> ((getVarBool st3 ''inp_3'') = False)))"
	and st4:"st4=toEnv st3"
	and st_final:"st_final=st4"
shows "inv(st_final)"
end