theory BaggageCarousel_VC0
	imports BaggageCarouselTheory Requirements
begin
lemma
assumes st0:"st0=emptyState"
	and st1:"st1=setPstate st0 ''Carousel'' ''turnedOff''"
	and st2:"st2=toEnv st1"
	and st_final:"st_final=st2"
shows "inv(st_final)"
end