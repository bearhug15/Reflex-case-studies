theory BaggageCarousel_VC6
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
	and st5_condition_2:"((theBool (getVarVal st5 ''inp_3'' [])) = (theBool (getVarVal st5 ''#DETECTED'' [])))"
	and st6:"st6=(setVarVal st5 ''out_0'' [] (ValBool (theBool (getVarVal st5 ''#TURN_OFF'' []))))"
	and st7:"st7=setPstate st6 ''Carousel'' ''turnedOff''"
	and st8:"st8=reset st7 ''Carousel''"
	and st8_timeout_3:"(ltime st8 ''Carousel'' < (theNat (getVarVal st_final ''#IDLE_TIMEOUT'' [])))"
	and st9:"st9=toEnv st8"
	and st_final:"st_final=st9"
shows "inv(st_final)"
  (* Open: no proof is recorded for this condition in baggageCarousel.proofs,
     which says why. *)
  sorry
end
