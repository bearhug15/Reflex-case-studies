theory BaggageCarousel_VC4
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
	and st4_condition_6:"(\<not> (getVarBool (setVarBool (setVarBool st4 ''inp_3'' True) ''inp_2'' (True \<or> (getVarBool (setVarBool st4 ''inp_3'' True) ''inp_3''))) ''inp_2''))"
	and st5:"st5=(setVarBool (setVarBool st4 ''inp_3'' True) ''inp_2'' (True \<or> (getVarBool (setVarBool st4 ''inp_3'' True) ''inp_3'')))"
	and st5_condition_8:"(ltime st5 ''Carousel'' < 30000)"
	and st6:"st6=toEnv st5"
	and st_final:"st_final=st6"
shows "inv(st_final)"
end