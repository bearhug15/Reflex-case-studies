theory Requirements
  imports Common_Extra_Invariant VCProving.Derived_Patterns
begin

definition R1 where "R1 s \<equiv>
always_part (\<lambda> s1. getVarBool s1 v_oFillTank' = True \<longrightarrow> getVarBool s1 v_oSteam' = False) s"

definition Einv1 where "Einv1 s \<equiv> common_extra_invariant s \<and>
always_inv_part (\<lambda> s1. getVarBool s1 v_oFillTank' = True \<longrightarrow> getVarBool s1 v_oSteam' = False) s"

definition Einv1_ref where "Einv1_ref s \<equiv> common_extra_invariant s \<and>
always_inv_part (\<lambda> s1. getVarBool s1 v_oFillTank' = True \<longrightarrow> getVarBool s1 v_oSteam' = False) s"

end