theory BaggageCarousel_VC0
	imports BaggageCarouselTheory LoopInvariants Requirements
begin
lemma
assumes st0:"st0=emptyState"
	and st1:"st1=(setVarVal st0 ''inp_0'' [] (ValBool inp_0))"
	and st2:"st2=(setVarVal st1 ''inp_1'' [] (ValBool inp_1))"
	and st3:"st3=(setVarVal st2 ''inp_2'' [] (ValBool inp_2))"
	and st4:"st4=(setVarVal st3 ''inp_3'' [] (ValBool inp_3))"
	and st5:"st5=(setVarVal st4 ''#PRESSED'' [] (ValBool True))"
	and st6:"st6=(setVarVal st5 ''#DETECTED'' [] (ValBool True))"
	and st7:"st7=(setVarVal st6 ''#NOT_DETECTED'' [] (ValBool False))"
	and st8:"st8=(setVarVal st7 ''#HIGH'' [] (ValBool True))"
	and st9:"st9=(setVarVal st8 ''#LOW'' [] (ValBool False))"
	and st10:"st10=(setVarVal st9 ''#TURN_ON'' [] (ValBool True))"
	and st11:"st11=(setVarVal st10 ''#TURN_OFF'' [] (ValBool False))"
	and st12:"st12=(setVarVal st11 ''#IDLE_TIMEOUT'' [] (ValNat 30000))"
	and st13:"st13=setPstate st12 ''Carousel'' ''turnedOff''"
	and st14:"st14=toEnv st13"
	and st_final:"st_final=st14"
shows "inv(st_final)"
  (* Open: no proof is recorded for this condition in baggageCarousel.proofs,
     which says why. *)
  sorry
end
