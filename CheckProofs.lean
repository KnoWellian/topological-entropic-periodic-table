import Lean
-- Import the successfully compiled KUT library modules
import TopologicalEntropicPeriodicTable.SOFTWARE_CORE
import TopologicalEntropicPeriodicTable.PHYSICAL_HARDWARE_SHELL
import TopologicalEntropicPeriodicTable.DYNAMIC_LOOM_KINEMATICS
import TopologicalEntropicPeriodicTable.Entropic
import TopologicalEntropicPeriodicTable.Elements
import TopologicalEntropicPeriodicTable.Universe

open Lean Meta

def generateEvaluationReport : MetaM Unit := do
  let env ← getEnv
  let decls := env.constants
  IO.println "================================================="
  IO.println "     KUT_LEAN-4 PROOF EVALUATION STATUS          "
  IO.println "================================================="
  let mut totalTheorems := 0
  let mut sorriedTheorems := 0
  
  for (name, cinfo) in decls do
    let nameStr := name.toString
    -- Check for theorems inside your specific namespaces
    if nameStr.contains "KnoWellian" || nameStr.contains "TopologicalEntropic" then
      match cinfo with
      | ConstantInfo.thmInfo val =>
        totalTheorems := totalTheorems + 1
        let usesSorry := val.value.hasSorry
        if usesSorry then
          sorriedTheorems := sorriedTheorems + 1
          IO.println s!"❌ [SORRY]  : {nameStr}"
        else
          IO.println s!"✅ [VERIFIED]: {nameStr}"
      | _ => pure ()
      
  IO.println "================================================="
  IO.println s!"Total Library Theorems Processed: {totalTheorems}"
  IO.println s!"Open/Incomplete Gaps (Sorries)  : {sorriedTheorems}"
  IO.println "================================================="

#eval generateEvaluationReport
