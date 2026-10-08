theory TrafficLights_VC7
	imports TrafficLightsTheory LoopInvariants Requirements
begin
lemma
assumes base_inv:"inv(st0)"
	and st0_boundary:"toEnvP st0"
	and st1:"st1=(setVarVal st0 ''buttonPort_0'' [] (ValBool buttonPort_0))"
	and st1_state:"getPstate st1 ''Controller''=''redAfterMinimalRed''"
	and st1_condition_0:"(\<not> (theBool (getVarVal st1 ''#bpressed'' [])))"
	and st1_condition_1:"(\<not> (theBool (getVarVal st1 ''buttonPort_0'' [])))"
	and st2:"st2=toEnv st1"
	and st_final:"st_final=st2"
shows "inv(st_final)"
  (* Open: no proof is recorded for this condition in trafficLights.proofs,
     which says why. *)
  sorry
end
