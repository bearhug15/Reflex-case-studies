theory TrafficLights_VC2
	imports TrafficLightsTheory LoopInvariants Requirements
begin
lemma
assumes base_inv:"inv(st0)"
	and st0_boundary:"toEnvP st0"
	and st1:"st1=(setVarVal st0 ''buttonPort_0'' [] (ValBool buttonPort_0))"
	and st1_state:"getPstate st1 ''Controller''=''minimalRed''"
	and st1_condition_0:"(theBool (getVarVal st1 ''buttonPort_0'' []))"
	and st2:"st2=(setVarVal st1 ''#bpressed'' [] (ValBool True))"
	and st2_timeout_1:"(ltime st2 ''Controller'' < (theNat (getVarVal st_final ''#minimal_red_time'' [])))"
	and st3:"st3=toEnv st2"
	and st_final:"st_final=st3"
shows "inv(st_final)"
  (* Open: no proof is recorded for this condition in trafficLights.proofs,
     which says why. *)
  sorry
end
