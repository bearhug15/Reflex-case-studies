theory TrafficLights_VC3
	imports TrafficLightsTheory LoopInvariants Requirements
begin
lemma
assumes base_inv:"inv(st0)"
	and st0_boundary:"toEnvP st0"
	and st1:"st1=(setVarVal st0 ''buttonPort_0'' [] (ValBool buttonPort_0))"
	and st1_state:"getPstate st1 ''Controller''=''minimalRed''"
	and st1_condition_0:"(\<not> (theBool (getVarVal st1 ''buttonPort_0'' [])))"
	and st1_timeout_1:"(ltime st1 ''Controller'' \<ge> (theNat (getVarVal st_final ''#minimal_red_time'' [])))"
	and st2:"st2=setPstate st1 ''Controller'' ''redAfterMinimalRed''"
	and st3:"st3=reset st2 ''Controller''"
	and st4:"st4=toEnv st3"
	and st_final:"st_final=st4"
shows "inv(st_final)"
  (* Open: no proof is recorded for this condition in trafficLights.proofs,
     which says why. *)
  sorry
end
