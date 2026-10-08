theory BaggageCarousel_VC7
	imports BaggageCarouselTheory LoopInvariants Requirements
begin
lemma
assumes base_inv:"inv(st0)"
	and st0_boundary:"toEnvP st0"
	and st1:"st1=(setVarVal st0 ''inp_0'' [] (ValBool inp_0))"
	and st2:"st2=(setVarVal st1 ''inp_1'' [] (ValBool inp_1))"
	and st3:"st3=(setVarVal st2 ''inp_2'' [] (ValBool inp_2))"
	and st4:"st4=(setVarVal st3 ''inp_3'' [] (ValBool inp_3))"
	and st4_state:"getPstate st4 ''Carousel''=''turnedOn''"
	and st4_condition_0:"((theBool (getVarVal st4 ''inp_1'' [])) = (theBool (getVarVal st4 ''#DETECTED'' [])))"
	and st5:"st5=reset st4 ''Carousel''"
	and st5_condition_1:"(\<not> ((theBool (getVarVal st5 ''inp_2'' [])) = (theBool (getVarVal st5 ''#HIGH'' []))))"
	and st5_condition_2:"(\<not> ((theBool (getVarVal st5 ''inp_3'' [])) = (theBool (getVarVal st5 ''#DETECTED'' []))))"
	and st5_timeout_3:"(ltime st5 ''Carousel'' < (theNat (getVarVal st_final ''#IDLE_TIMEOUT'' [])))"
	and st6:"st6=toEnv st5"
	and st_final:"st_final=st6"
shows "inv(st_final)"
  (* Open: no proof is recorded for this condition in baggageCarousel.proofs,
     which says why. *)
  sorry
end
