theory Barrier_VC0
	imports BarrierTheory Requirements
begin
lemma
assumes st0:"st0=emptyState"
	and st1:"st1=setPstate st0 ''CarController'' ''waitingForCar''"
	and st2:"st2=toEnv st1"
	and st_final:"st_final=st2"
shows "inv(st_final)"
end