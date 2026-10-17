import Mathlib.Data.Nat.Basic
import Mathlib.Data.List.Basic
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.NormNum
import TopologicalEntropicPeriodicTable.Entropic

/-!
Copyright (c) 2026 David Noel Lynch. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: David Noel Lynch (~3K)

# KnoWellian Periodic Table Braid Verification Matrix
Formalizing the complete elemental lexicon through Element Z=126 (Unbihexium),
Isotope Braids, Optical Splay Groups, and the 66.6% Dyadic Stability Law.
-/

namespace KnoWellianTable

/-- Canonical boundary of the standard chemical lexicon: Z = 120 = 5! = |I*| -/
def StandardCondensationLimit : ℕ := 120

/-- Superactinide Island of Stability Bound: Z = 126 (Unbihexium / Ubh, Appendix D) -/
def SuperactinideIslandLimit : ℕ := 126

/-- Predicate verifying that Z falls within the expanded cosmic element array -/
def IsValidElement (Z : ℕ) : Prop := 1 ≤ Z ∧ Z ≤ SuperactinideIslandLimit

/-- Inductive optical and topological router classifications -/
inductive SplayGroup
  | TonicBase        -- Alkali series (Group 1)
  | BalancedWeave    -- Alkaline Earth series (Group 2)
  | TransitionBand   -- Transition metal crucible / Iron peak node
  | OctaveClosure    -- Noble gases & terminal perimeter gates
  | OtherChannel     -- Intermediate splays (Halogens, Lanthanides, Actinides)
  deriving DecidableEq, Repr

/-- Physical track index: Z mod 64 on the optical splay bus -/
def splayChannel (Z : ℕ) : ℕ := Z % 64

/-- Maps any atomic number Z ∈ [1, 126] to its verified SplayGroup -/
def getGroup (Z : ℕ) : SplayGroup :=
  match Z with
  -- Group 1: Alkali Threads (Tonic Base)
  | 1 | 3 | 11 | 19 | 37 | 55 | 87 | 119 => SplayGroup.TonicBase

  -- Group 2: Alkaline Earth Splays (Balanced Weave)
  | 4 | 12 | 20 | 38 | 56 | 88 => SplayGroup.BalancedWeave

  -- Iron Peak Crucible Node & Transition Metals
  | 21 | 22 | 23 | 24 | 25 | 26 | 27 | 28 | 29 | 30
  | 39 | 40 | 41 | 42 | 43 | 44 | 45 | 46 | 47 | 48
  | 72 | 73 | 74 | 75 | 76 | 77 | 78 | 79 | 80
  | 104 | 105 | 106 | 107 | 108 | 109 | 110 | 111 | 112 => SplayGroup.TransitionBand

  -- Noble Gases, Perimeter Seals, & Z=126 Doubly-Magic Lock (Octave Closure)
  | 2 | 10 | 18 | 36 | 54 | 86 | 118 | 120 | 126 => SplayGroup.OctaveClosure

  -- All intermediate unmodulated splays
  | _ => SplayGroup.OtherChannel

-- ====================================================================
-- CHEMICAL SYMBOL REGISTRY (INCLUDING SUPERACTINIDE Z=126)
-- ====================================================================

/-- Full chemical symbol lookup for Z ∈ [1, 126] -/
def elementSymbol (Z : ℕ) : String :=
  match Z with
  | 1 => "H"   | 2 => "He"  | 3 => "Li"  | 4 => "Be"  | 5 => "B"   | 6 => "C"
  | 7 => "N"   | 8 => "O"   | 9 => "F"   | 10 => "Ne" | 11 => "Na" | 12 => "Mg"
  | 13 => "Al" | 14 => "Si" | 15 => "P"  | 16 => "S"  | 17 => "Cl" | 18 => "Ar"
  | 19 => "K"  | 20 => "Ca" | 21 => "Sc" | 22 => "Ti" | 23 => "V"  | 24 => "Cr"
  | 25 => "Mn" | 26 => "Fe" | 27 => "Co" | 28 => "Ni" | 29 => "Cu" | 30 => "Zn"
  | 31 => "Ga" | 32 => "Ge" | 33 => "As" | 34 => "Se" | 35 => "Br" | 36 => "Kr"
  | 37 => "Rb" | 38 => "Sr" | 39 => "Y"  | 40 => "Zr" | 41 => "Nb" | 42 => "Mo"
  | 43 => "Tc" | 44 => "Ru" | 45 => "Rh" | 46 => "Pd" | 47 => "Ag" | 48 => "Cd"
  | 49 => "In" | 50 => "Sn" | 51 => "Sb" | 52 => "Te" | 53 => "I"  | 54 => "Xe"
  | 55 => "Cs" | 56 => "Ba" | 57 => "La" | 58 => "Ce" | 59 => "Pr" | 60 => "Nd"
  | 61 => "Pm" | 62 => "Sm" | 63 => "Eu" | 64 => "Gd" | 65 => "Tb" | 66 => "Dy"
  | 67 => "Ho" | 68 => "Er" | 69 => "Tm" | 70 => "Yb" | 71 => "Lu" | 72 => "Hf"
  | 73 => "Ta" | 74 => "W"  | 75 => "Re" | 76 => "Os" | 77 => "Ir" | 78 => "Pt"
  | 79 => "Au" | 80 => "Hg" | 81 => "Tl" | 82 => "Pb" | 83 => "Bi" | 84 => "Po"
  | 85 => "At" | 86 => "Rn" | 87 => "Fr" | 88 => "Ra" | 89 => "Ac" | 90 => "Th"
  | 91 => "Pa" | 92 => "U"  | 93 => "Np" | 94 => "Pu" | 95 => "Am" | 96 => "Cm"
  | 97 => "Bk" | 98 => "Cf" | 99 => "Es" | 100 => "Fm"| 101 => "Md"| 102 => "No"
  | 103 => "Lr"| 104 => "Rf"| 105 => "Db"| 106 => "Sg"| 107 => "Bh"| 108 => "Hs"
  | 109 => "Mt"| 110 => "Ds"| 111 => "Rg"| 112 => "Cn"| 113 => "Nh"| 114 => "Fl"
  | 115 => "Mc"| 116 => "Lv"| 117 => "Ts"| 118 => "Og"| 119 => "Uue"| 120 => "Ubn"
  | 126 => "Ubh"
  | _ => "Unknown"

-- ====================================================================
-- THE 66.6% DYADIC STABILITY LAW (ZFPD 85)
-- ====================================================================

/-- Decision predicate: Element possesses stable non-decaying isotopes. -/
def isStable (Z : ℕ) : Bool :=
  decide (1 ≤ Z ∧ Z ≤ 82 ∧ Z ≠ 43 ∧ Z ≠ 61)

def standardLexicon : List ℕ := List.range' 1 120

theorem stable_element_count_eq_80 : (standardLexicon.filter isStable).length = 80 := by
  rfl

theorem periodic_table_dyadic_consonance :
    (standardLexicon.filter isStable).length * 3 = standardLexicon.length * 2 := by
  rfl

-- ====================================================================
-- ISOTOPE BRAID STRUCTURES (INCLUDING ELEMENT 126)
-- ====================================================================

structure IsotopeBraid where
  Z : ℕ
  strandCount : ℕ
  crossings : ℕ       -- Total mass parameter A = Z + N
  windingNumber : ℤ   -- Total neutron core parameter N
  braidWord : List ℤ

def lithiumBraid : IsotopeBraid where
  Z := 3
  strandCount := 3
  crossings := 7
  windingNumber := 2
  braidWord := [1, 2, -1, 1, 2, -1, 1]

def carbonBraid : IsotopeBraid where
  Z := 6
  strandCount := 6
  crossings := 12
  windingNumber := 4
  braidWord := [1, 2, 3, 4, 5, -1, -2, -3, -4, -5, 1, 2]

def ironBraid : IsotopeBraid where
  Z := 26
  strandCount := 26
  crossings := 56
  windingNumber := 30
  braidWord := [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, -1, -2, -3, -4, -5, 1, 2]

def leadBraid : IsotopeBraid where
  Z := 82
  strandCount := 82
  crossings := 208
  windingNumber := 126
  braidWord := [1, 2, 3, 4, 5, -1, -2, -3, 1, 2]

/-- Element Z=126 (Unbihexium-310): Doubly-Magic Lock (Z=126, N=184, A=310) -/
def unbihexiumBraid : IsotopeBraid where
  Z := 126
  strandCount := 126
  crossings := 310
  windingNumber := 184
  braidWord := [1, 2, 3, 4, 5, 6, 7, -1, -2, -3, -4, -5, -6, -7, 1, 2]

-- ====================================================================
-- FIRST-PRINCIPLES MACHINE VALIDATIONS
-- ====================================================================

theorem lithium_group_matches : getGroup lithiumBraid.Z = SplayGroup.TonicBase := by rfl
theorem carbon_crossings_verify : carbonBraid.crossings = 12 := by rfl
theorem iron_crossings_verify : ironBraid.crossings = 56 := by rfl
theorem lead_is_terminal_stable : isStable 82 = true := by rfl

/-- Theorem: Z=126 maps to physical optical channel 62 (126 mod 64 = 62) -/
theorem unbihexium_channel_verify : splayChannel 126 = 62 := by rfl

/-- Theorem: Z=126 carries the official chemical symbol "Ubh" -/
theorem unbihexium_symbol_verify : elementSymbol 126 = "Ubh" := by rfl

/-- Theorem: Z=126 acts as a Doubly-Magic Octave Closure node -/
theorem unbihexium_is_octave_lock : getGroup 126 = SplayGroup.OctaveClosure := by rfl

/-- Theorem: Proves the exact 184 neutron count of Unbihexium-310 (A - Z = 184) -/
theorem unbihexium_magic_neutrons :
    unbihexiumBraid.crossings - unbihexiumBraid.Z = 184 := by rfl

/-- Theorem: Proves the duodecimal base-12 representation 126₁₀ = X6₁₂ -/
theorem unbihexium_duodecimal_base : (10 : ℕ) * 12 + 6 = 126 := by rfl

end KnoWellianTable