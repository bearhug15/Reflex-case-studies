theory TrafficLights_VC10
	imports TrafficLightsTheory LoopInvariants Requirements
begin
lemma
assumes base_inv:"inv(st0)"
	and st0_boundary:"toEnvP st0"
	and st1:"st1=(setVarVal st0 ''buttonPort_0'' [] (ValBool buttonPort_0))"
	and st1_state:"getPstate st1 ''Controller''=''green''"
	and st1_timeout_0:"(ltime st1 ''Controller'' \<ge> (theNat (getVarVal st_final ''#green_time_limit'' [])))"
	and st2:"st2=(setVarVal st1 ''lightPort_0'' [] (ValBool (theBool (getVarVal st1 ''#RED'' []))))"
	and st3:"st3=setPstate st2 ''Controller'' ''minimalRed''"
	and st4:"st4=reset st3 ''Controller''"
	and st5:"st5=toEnv st4"
	and st_final:"st_final=st5"
shows "inv(st_final)"
  (* Open: no proof is recorded for this condition in trafficLights.proofs,
     which says why. *)
  sorry
end
