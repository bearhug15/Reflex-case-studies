theory TrafficLights_VC8
	imports TrafficLightsTheory LoopInvariants Requirements
begin
lemma
assumes base_inv:"inv(st0)"
	and st0_boundary:"toEnvP st0"
	and st1:"st1=(setVarVal st0 ''buttonPort_0'' [] (ValBool buttonPort_0))"
	and st1_state:"getPstate st1 ''Controller''=''redToGreen''"
	and st1_timeout_0:"(ltime st1 ''Controller'' \<ge> (theNat (getVarVal st_final ''#red_to_green'' [])))"
	and st2:"st2=(setVarVal st1 ''lightPort_0'' [] (ValBool (theBool (getVarVal st1 ''#GREEN'' []))))"
	and st3:"st3=(setVarVal st2 ''#bpressed'' [] (ValBool False))"
	and st4:"st4=setPstate st3 ''Controller'' ''green''"
	and st5:"st5=reset st4 ''Controller''"
	and st6:"st6=toEnv st5"
	and st_final:"st_final=st6"
shows "inv(st_final)"
  (* Open: no proof is recorded for this condition in trafficLights.proofs,
     which says why. *)
  sorry
end
