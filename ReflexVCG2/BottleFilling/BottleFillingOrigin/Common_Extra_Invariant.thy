theory Common_Extra_Invariant
  imports BottleFilling
begin

definition common_extra_invariant where "common_extra_invariant s \<equiv> toEnvP s \<and>
(getPstate s p_TankFilling' \<noteq> STOP \<longrightarrow> getPstate s p_Initialization' = p_Initialization's_waitForFilling') \<and>
(getPstate s p_ForcedSterilization' \<noteq> STOP \<longrightarrow>
   getPstate s p_Initialization' = p_Initialization's_waitForSterilization') \<and>
(getPstate s p_Initialization' \<noteq> STOP \<longrightarrow> getPstate s p_MainLoop' = STOP) \<and>
(getPstate s p_Initialization' = STOP \<longrightarrow> getPstate s p_MainLoop' \<noteq> STOP) \<and>
(getPstate s p_NextBottle' \<noteq> STOP \<longrightarrow> getPstate s p_MainLoop' = p_MainLoop's_waitForNextBottle') \<and>
(getPstate s p_BottleFilling' = p_BottleFilling's_begin' \<longrightarrow>
   getPstate s p_MainLoop' = p_MainLoop's_waitForFilling') \<and>
(getPstate s p_Initialization' \<noteq> STOP \<longrightarrow> getPstate s p_KeepSterilization' = STOP) \<and>
(getPstate s p_Initialization' = STOP \<longrightarrow> getPstate s p_KeepSterilization' \<noteq> STOP) \<and>
(getPstate s p_TankFilling' = STOP \<longrightarrow> getVarBool s v_oFillTank' = False) \<and>
(getPstate s p_ForcedSterilization' \<noteq> STOP \<longrightarrow> getVarBool s v_oSteam' = True) \<and>
(getPstate s p_KeepSterilization' = p_KeepSterilization's_waitLowTemp' \<longrightarrow> getVarBool s v_oSteam' = False) \<and>
(getPstate s p_KeepSterilization' = p_KeepSterilization's_waitHighTemp' \<longrightarrow> getVarBool s v_oSteam' = True) \<and>
(getPstate s p_BottleFilling' =  p_BottleFilling's_begin' \<longrightarrow> getVarBool s v_oFillBottle' = True) \<and>
(getPstate s p_BottleFilling' = STOP \<longrightarrow> getVarBool s v_oFillBottle' = False) \<and>
(getPstate s p_NextBottle' \<noteq> STOP \<longrightarrow> getVarBool s v_oConveyor' = True) \<and>
(getPstate s p_NextBottle' = STOP \<longrightarrow> getVarBool s v_oConveyor' = False) \<and>
(getPstate s p_ForcedSterilization' = p_ForcedSterilization's_sterilizationFor1min' \<longrightarrow> 
  ltime s p_ForcedSterilization' \<le> 1 * 60 * 10) \<and>
getPstate s p_Initialization' \<in> 
  {p_Initialization's_begin', p_Initialization's_waitForFilling', p_Initialization's_waitForSterilization', STOP} \<and>
getPstate s p_MainLoop' \<in> {p_MainLoop's_begin', p_MainLoop's_waitForNextBottle', p_MainLoop's_waitForFilling', STOP}\<and>
getPstate s p_TankFilling' \<in> {p_TankFilling's_tankFilled', STOP} \<and>
getPstate s p_ForcedSterilization' \<in>
   {p_ForcedSterilization's_heatUp', p_ForcedSterilization's_sterilizationFor1min', STOP} \<and>
getPstate s p_KeepSterilization' \<in>
   {p_KeepSterilization's_waitLowTemp', p_KeepSterilization's_waitHighTemp', STOP} \<and>
getPstate s p_BottleFilling' \<in> {p_BottleFilling's_begin', STOP} \<and>
getPstate s p_NextBottle' \<in> {p_NextBottle's_begin', p_NextBottle's_waitBottlePosition', STOP} \<and>
(toEnvNum emptyState s = 1 \<longrightarrow>
   getVarBool s v_oSteam' = False \<and> getVarBool s v_oFillTank' = False \<and> getVarBool s v_oFillBottle' = False \<and>
 getVarBool s v_oConveyor' = False)
"

abbreviation T1min::nat where "T1min \<equiv> 1 * 60 *10"

definition common_extra_invariant_ref where "common_extra_invariant_ref s \<equiv> toEnvP s \<and>
(toEnvNum emptyState s = 1 \<longrightarrow>
  getPstate s p_Initialization' = p_Initialization's_begin' \<and> getPstate s p_MainLoop' = STOP \<and>
  getPstate s p_TankFilling' = STOP \<and> getPstate s p_ForcedSterilization' = STOP \<and> 
  getPstate s p_KeepSterilization' = STOP \<and> getPstate s p_BottleFilling' = STOP \<and> getPstate s p_NextBottle' = STOP \<and>
  getVarBool s v_oFillTank' = False \<and> getVarBool s v_oSteam' = False \<and> getVarBool s v_oFillBottle' = False \<and>
  getVarBool s v_oConveyor' = False) \<and>
(toEnvNum emptyState s = 2 \<longrightarrow>
  getPstate s p_Initialization' = p_Initialization's_waitForFilling' \<and> getPstate s p_MainLoop' = STOP \<and>
  getPstate s p_TankFilling' = p_TankFilling's_tankFilled' \<and> getPstate s p_ForcedSterilization' = STOP \<and> 
  getPstate s p_KeepSterilization' = STOP \<and> getPstate s p_BottleFilling' = STOP \<and> getPstate s p_NextBottle' = STOP \<and>
  getVarBool s v_oFillTank' = True \<and> getVarBool s v_oSteam' = False \<and> getVarBool s v_oFillBottle' = False \<and>
  getVarBool s v_oConveyor' = False) \<and>
(toEnvNum emptyState s = 3 \<longrightarrow>
  getPstate s p_Initialization' = p_Initialization's_waitForSterilization' \<and> getPstate s p_MainLoop' = STOP \<and>
  getPstate s p_TankFilling' = STOP \<and> getPstate s p_ForcedSterilization' = STOP \<and> 
  getPstate s p_KeepSterilization' = STOP \<and> getPstate s p_BottleFilling' = STOP \<and> getPstate s p_NextBottle' = STOP \<and>
  getVarBool s v_oFillTank' = False \<and> getVarBool s v_oSteam' = False \<and> getVarBool s v_oFillBottle' = False \<and>
  getVarBool s v_oConveyor' = False) \<and>
(toEnvNum emptyState s = 4 \<longrightarrow>
  getPstate s p_Initialization' = p_Initialization's_waitForSterilization' \<and> getPstate s p_MainLoop' = STOP \<and>
  getPstate s p_TankFilling' = STOP \<and> getPstate s p_ForcedSterilization' = p_ForcedSterilization's_heatUp' \<and> 
  getPstate s p_KeepSterilization' = STOP \<and> getPstate s p_BottleFilling' = STOP \<and> getPstate s p_NextBottle' = STOP \<and>
  getVarBool s v_oFillTank' = False \<and> getVarBool s v_oSteam' = True \<and> getVarBool s v_oFillBottle' = False \<and>
  getVarBool s v_oConveyor' = False) \<and>
(toEnvNum emptyState s \<ge> 5 \<and> toEnvNum emptyState s \<le> 4 + T1min \<longrightarrow>
  getPstate s p_Initialization' = p_Initialization's_waitForSterilization' \<and> getPstate s p_MainLoop' = STOP \<and>
  getPstate s p_TankFilling' = STOP \<and> 
  getPstate s p_ForcedSterilization' = p_ForcedSterilization's_sterilizationFor1min' \<and> 
  getPstate s p_KeepSterilization' = STOP \<and> getPstate s p_BottleFilling' = STOP \<and> getPstate s p_NextBottle' = STOP \<and>
  getVarBool s v_oFillTank' = False \<and> getVarBool s v_oSteam' = True \<and> getVarBool s v_oFillBottle' = False \<and>
  getVarBool s v_oConveyor' = False) \<and>
(toEnvNum emptyState s = 5 + T1min \<longrightarrow>
  getPstate s p_Initialization' = p_Initialization's_waitForSterilization' \<and> getPstate s p_MainLoop' = STOP \<and>
  getPstate s p_TankFilling' = STOP \<and> getPstate s p_ForcedSterilization' = STOP \<and> 
  getPstate s p_KeepSterilization' = STOP \<and> getPstate s p_BottleFilling' = STOP \<and> getPstate s p_NextBottle' = STOP \<and>
  getVarBool s v_oFillTank' = False \<and> getVarBool s v_oSteam' = False \<and> getVarBool s v_oFillBottle' = False \<and>
  getVarBool s v_oConveyor' = False) \<and>
(toEnvNum emptyState s = 6 + T1min \<longrightarrow>
  getPstate s p_Initialization' = STOP \<and> getPstate s p_MainLoop' = p_MainLoop's_waitForNextBottle' \<and>
  getPstate s p_TankFilling' = STOP \<and> getPstate s p_ForcedSterilization' = STOP \<and> 
  getPstate s p_KeepSterilization' = p_KeepSterilization's_waitLowTemp' \<and> getPstate s p_BottleFilling' = STOP \<and>
  getPstate s p_NextBottle' = p_NextBottle's_waitBottlePosition' \<and>
  getVarBool s v_oFillTank' = False \<and> getVarBool s v_oSteam' = False \<and> getVarBool s v_oFillBottle' = False \<and>
  getVarBool s v_oConveyor' = True) \<and>
(toEnvNum emptyState s = 7 + T1min \<longrightarrow>
  getPstate s p_Initialization' = STOP \<and> getPstate s p_MainLoop' = p_MainLoop's_waitForNextBottle' \<and>
  getPstate s p_TankFilling' = STOP \<and> getPstate s p_ForcedSterilization' = STOP \<and> 
  getPstate s p_KeepSterilization' = p_KeepSterilization's_waitLowTemp' \<and> getPstate s p_BottleFilling' = STOP \<and>
  getPstate s p_NextBottle' = STOP \<and>
  getVarBool s v_oFillTank' = False \<and> getVarBool s v_oSteam' = False \<and> getVarBool s v_oFillBottle' = False \<and>
  getVarBool s v_oConveyor' = False) \<and>
(toEnvNum emptyState s = 8 + T1min \<longrightarrow>
  getPstate s p_Initialization' = STOP \<and> getPstate s p_MainLoop' = p_MainLoop's_waitForFilling' \<and>
  getPstate s p_TankFilling' = STOP \<and> getPstate s p_ForcedSterilization' = STOP \<and> 
  getPstate s p_KeepSterilization' = p_KeepSterilization's_waitLowTemp' \<and> 
  getPstate s p_BottleFilling' = p_BottleFilling's_begin' \<and> getPstate s p_NextBottle' = STOP \<and>
  getVarBool s v_oFillTank' = False \<and> getVarBool s v_oSteam' = False \<and> getVarBool s v_oFillBottle' = True \<and>
  getVarBool s v_oConveyor' = False) \<and>
(toEnvNum emptyState s = 9 + T1min \<longrightarrow>
  getPstate s p_Initialization' = STOP \<and> getPstate s p_MainLoop' = p_MainLoop's_waitForFilling' \<and>
  getPstate s p_TankFilling' = STOP \<and> getPstate s p_ForcedSterilization' = STOP \<and> 
  getPstate s p_KeepSterilization' = p_KeepSterilization's_waitHighTemp' \<and> 
  getPstate s p_BottleFilling' = STOP \<and> getPstate s p_NextBottle' = STOP \<and>
  getVarBool s v_oFillTank' = False \<and> getVarBool s v_oSteam' = True \<and> getVarBool s v_oFillBottle' = False \<and>
  getVarBool s v_oConveyor' = False) \<and>
(toEnvNum emptyState s = 10 + T1min \<longrightarrow>
  getPstate s p_Initialization' = p_Initialization's_begin' \<and> getPstate s p_MainLoop' = STOP \<and>
  getPstate s p_TankFilling' = STOP \<and> getPstate s p_ForcedSterilization' = STOP \<and> 
  getPstate s p_KeepSterilization' = STOP \<and> 
  getPstate s p_BottleFilling' = STOP \<and> getPstate s p_NextBottle' = STOP \<and>
  getVarBool s v_oFillTank' = False \<and> getVarBool s v_oSteam' = True \<and> getVarBool s v_oFillBottle' = False \<and>
  getVarBool s v_oConveyor' = False)
"

fun Initialization where
"Initialization s0 iLowLevel iHighLevel iLowTemp iHighTemp iBottleLevel iBottlePosition =
(let s1 = (case getPstate s0 p_Initialization' of 
  p_Initialization's_begin' \<Rightarrow> 
    setPstate 
      (setPstate s0 p_TankFilling' p_TankFilling's_begin') 
      p_Initialization' p_Initialization's_waitForFilling' |
  p_Initialization's_waitForFilling' \<Rightarrow>
    if getPstate s0 p_TankFilling' \<in> {STOP, ERROR}
      then 
        setPstate 
          (setPstate s0 p_ForcedSterilization' p_ForcedSterilization's_heatUp') 
          p_Initialization' p_Initialization's_waitForSterilization'
      else s0 |
  p_Initialization's_waitForSterilization' \<Rightarrow>
    if getPstate s0 p_ForcedSterilization' \<in> {STOP, ERROR}
      then 
        setPstate 
          (setPstate 
            (setPstate s0 p_KeepSterilization' p_KeepSterilization's_waitLowTemp')
            p_MainLoop' p_MainLoop's_begin')
          p_Initialization' STOP
      else s0 |
  _ \<Rightarrow> s0) in
s1)"

fun MainLoop where
"MainLoop s1 iLowLevel iHighLevel iLowTemp iHighTemp iBottleLevel iBottlePosition =
(let s2 = (case getPstate s1 p_MainLoop' of
  p_MainLoop's_begin' \<Rightarrow>
    setPstate (setPstate s1 p_NextBottle' p_NextBottle's_begin') p_MainLoop' p_MainLoop's_waitForNextBottle' |
  p_MainLoop's_waitForNextBottle' \<Rightarrow>
    if getPstate s1 p_NextBottle' \<in> {STOP, ERROR}
      then setPstate (setPstate s1 p_BottleFilling' p_BottleFilling's_begin') p_MainLoop' p_MainLoop's_waitForFilling'
      else s1 |
  p_MainLoop's_waitForFilling' \<Rightarrow>
    if getPstate s1 p_BottleFilling' \<in> {STOP, ERROR}
      then if iLowLevel
        then
          setPstate 
            (setPstate (setPstate s1 p_KeepSterilization' STOP) p_Initialization' p_Initialization's_begin')
            p_MainLoop' STOP
        else setPstate s1 p_MainLoop' p_MainLoop's_begin'
      else s1 |
  _ \<Rightarrow> s1) in
s2)"

fun TankFilling where
"TankFilling s2 iLowLevel iHighLevel iLowTemp iHighTemp iBottleLevel iBottlePosition =
(let s4 = (case getPstate s2 p_TankFilling' of
  p_TankFilling's_begin' \<Rightarrow>
    let s3 = (if iHighLevel \<noteq> True then setVarBool s2 v_oFillTank' True else s2) in 
      setPstate s3 p_TankFilling' p_TankFilling's_tankFilled' |
  p_TankFilling's_tankFilled' \<Rightarrow>
    if iHighLevel = True then setPstate (setVarBool s2 v_oFillTank' False) p_TankFilling' STOP else s2 |
  _ \<Rightarrow> s2) in
s4)"

fun ForcedSterilization where
"ForcedSterilization s4 iLowLevel iHighLevel iLowTemp iHighTemp iBottleLevel iBottlePosition =
(let s6 = (case getPstate s4 p_ForcedSterilization' of
  p_ForcedSterilization's_heatUp' \<Rightarrow>
    let s5 = setVarBool s4 v_oSteam' True in 
      if iHighTemp = True 
        then setPstate s5 p_ForcedSterilization' p_ForcedSterilization's_sterilizationFor1min' 
        else s5 |
  p_ForcedSterilization's_sterilizationFor1min' \<Rightarrow>
    if ltime s4 p_ForcedSterilization' \<ge> 60 * 10 
      then setPstate (setVarBool s4 v_oSteam' False) p_ForcedSterilization' STOP
      else s4 |
  _ \<Rightarrow> s4) in
s6)"

fun KeepSterilization where
"KeepSterilization s6 iLowLevel iHighLevel iLowTemp iHighTemp iBottleLevel iBottlePosition =
(let s7 = (case getPstate s6 p_KeepSterilization' of
  p_KeepSterilization's_waitLowTemp' \<Rightarrow>
    if iLowTemp \<noteq> True 
      then setPstate (setVarBool s6 v_oSteam' True) p_KeepSterilization' p_KeepSterilization's_waitHighTemp'
      else s6 |
  p_KeepSterilization's_waitHighTemp' \<Rightarrow>
    if iHighTemp = True 
      then setPstate (setVarBool s6 v_oSteam' False) p_KeepSterilization' p_KeepSterilization's_waitLowTemp'
      else s6 |
  _ \<Rightarrow> s6) in
s7)"

fun BottleFilling where
"BottleFilling s7 iLowLevel iHighLevel iLowTemp iHighTemp iBottleLevel iBottlePosition =
(let s9 = (case getPstate s7 p_BottleFilling' of
  p_BottleFilling's_begin' \<Rightarrow>
  let s8 = setVarBool s7 v_oFillBottle' True in 
    if iBottleLevel = True then setPstate (setVarBool s8 v_oFillBottle' False) p_BottleFilling' STOP else s8 |
  _ \<Rightarrow> s7) in
s9)"

fun NextBottle where
"NextBottle s9 iLowLevel iHighLevel iLowTemp iHighTemp iBottleLevel iBottlePosition =
(let s11 = (case getPstate s9 p_NextBottle' of
  p_NextBottle's_begin' \<Rightarrow>
    let s10 = setVarBool s9 v_oConveyor' True in 
      if iBottlePosition \<noteq> True then setPstate s10 p_NextBottle' p_NextBottle's_waitBottlePosition' else s10 |
  p_NextBottle's_waitBottlePosition' \<Rightarrow>
    if iBottlePosition = True then setPstate (setVarBool s9 v_oConveyor' False) p_NextBottle' STOP else s9 |
  _ \<Rightarrow> s9) in
s11)"

definition controller where
"controller s0 iLowLevel iHighLevel iLowTemp iHighTemp iBottleLevel iBottlePosition =
toEnv
(NextBottle 
(BottleFilling 
(KeepSterilization 
(ForcedSterilization 
(TankFilling 
(MainLoop 
(Initialization s0 iLowLevel iHighLevel iLowTemp iHighTemp iBottleLevel iBottlePosition)
iLowLevel iHighLevel iLowTemp iHighTemp iBottleLevel iBottlePosition) 
iLowLevel iHighLevel iLowTemp iHighTemp iBottleLevel iBottlePosition) 
iLowLevel iHighLevel iLowTemp iHighTemp iBottleLevel iBottlePosition) 
iLowLevel iHighLevel iLowTemp iHighTemp iBottleLevel iBottlePosition) 
iLowLevel iHighLevel iLowTemp iHighTemp iBottleLevel iBottlePosition) 
iLowLevel iHighLevel iLowTemp iHighTemp iBottleLevel iBottlePosition)
"
   

end