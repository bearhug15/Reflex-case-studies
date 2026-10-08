theory TrafficLights_VC0
	imports TrafficLightsTheory LoopInvariants Requirements
begin
lemma
assumes st0:"st0=emptyState"
	and st1:"st1=(setVarVal st0 ''buttonPort_0'' [] (ValBool buttonPort_0))"
	and st2:"st2=(setVarVal st1 ''#GREEN'' [] (ValBool True))"
	and st3:"st3=(setVarVal st2 ''#RED'' [] (ValBool False))"
	and st4:"st4=(setVarVal st3 ''#pressed'' [] (ValBool True))"
	and st5:"st5=(setVarVal st4 ''#not_pressed'' [] (ValBool False))"
	and st6:"st6=(setVarVal st5 ''#minimal_red_time'' [] (ValNat 10000))"
	and st7:"st7=(setVarVal st6 ''#red_to_green'' [] (ValNat 5000))"
	and st8:"st8=(setVarVal st7 ''#green_time_limit'' [] (ValNat 30000))"
	and st9:"st9=setPstate st8 ''Controller'' ''minimalRed''"
	and st10:"st10=toEnv st9"
	and st_final:"st_final=st10"
shows "inv(st_final)"
  (* Open: no proof is recorded for this condition in trafficLights.proofs,
     which says why. *)
  sorry
end
