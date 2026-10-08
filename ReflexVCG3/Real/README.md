# Real programs, ported to modern Reflex

Seven controllers from the earlier case studies, rewritten for the current Reflex and
ReflexVCG. The old sources, requirements and conditions are in `ReflexVCG2/<Program>` of this
repository; each folder here holds only the port:

| | |
|---|---|
| `<program>.rcs` | the program in modern Reflex, its requirements written as Reflex-AL annotations |
| `<Program>Theory.thy`, `Requirements.thy`, `ExtraInvariants.thy`, `LoopInvariants.thy` | what generation writes alongside the conditions |
| `ReflexBase/Lemmas/Patterns.thy` | the semantics, copied in so the folder stands alone |
| `<Program>_VC<n>.thy` | the conditions, one per file |
| `<program>.proofs` | which proof closes which condition, and why the others are open |
| `ROOT` | builds the folder as one session (`quick_and_dirty`, since open conditions use `sorry`) |

Generated with ReflexVCG at `claude/reflex-rework` (commit b1b4326 plus working tree), against
Isabelle2025-2.

## What changed in the port

The same in every program:

- `input`/`output` port declarations became an `import` block of registers, and each
  physical variable says where it reads and writes: `bool x as (read = inp, bit = 0)` for an
  input, `(read = out, write = out, bit = 0)` for an output.
- Every process runs on a node, `process P :: node Main`, and the program declares it.
- Requirements that were Isabelle definitions over `substate`/`toEnvNum` are annotations:
  program invariants for properties of the whole run, state invariants for what holds while a
  process is in a given state. A state invariant is often not a requirement at all but the
  strengthening a requirement needs to be inductive - each program's header says which are
  which.

Per program:

| Program | Requirements | Fixes to the old source |
|---|---|---|
| HandDryer | R1-R4 of `HandDryerTheory.thy`; R5 dropped (false of the program: it blows as long as hands stay) | none |
| BaggageCarousel | none existed; R1-R3 written | `iinp[0]` misspelt port; `weight = HIGH \|\| stuck = DETECTED` assigned where it compared; `TURN_ON`/`TURN_OFF` declared `time` |
| Barrier | none existed; R1-R6 written | none - the same program as ReflexVCG's `newBarrier.rcs` fixture |
| TrainBarrier | none existed; R1-R5 written | no `clock`; 100 ms assumed |
| TrafficLights | R1-R5 of `trafficLightsTheory.thy`, cycle counts as times (150 cycles = 15 s) | constants `green`/`red` renamed `GREEN`/`RED`, since `green` is also a state |
| BottleFilling | R1 of `BottleFillingOrigin/Requirements.thy`; R2, R3 written | none (ported from `BottleFilling.rcs`, not the Origin variant) |
| GasSeparator | none existed; R1-R4 written | ports declared narrower than the bits read (13 for 14 inputs, 22 for 24 outputs) |

One thing the modern semantics makes visible: the initial state reads every input before any
process has run. A requirement relating an input to an output therefore fails at that first
boundary. TrainBarrier's R3 is stated from the first cycle on (`previously(true) && ...`) for
this reason, and its `openned` invariant does not claim the white light, which the first cycle
switches on.

## Proofs

Proving was time-boxed to five minutes per program, using the one-line structural proof of
`tools/check-with-isabelle.sh` (`@structural`: carry every wrapped invariant across the cycle,
then `auto`).

| Program | Conditions | Proved | Open |
|---|---|---|---|
| TrainBarrier | 11 | 9 | 2, timeouts at 150 s |
| HandDryer | 6 | 2 | 4, timeouts at 90 s |
| BaggageCarousel | 12 | 0 | all, timeouts at 50 s |
| Barrier | 33 | 0 | all, timeouts at 20 s - the budget allowed no more |
| TrafficLights | 12 | 0 | all, timeouts at 60 s |
| BottleFilling | 705 | 0 | sample of 12 tried, all timeouts at 60 s |
| GasSeparator | 6602 | 0 | not reached within the budget |

Every failure is a timeout; none is a counterexample. So this says the one-line proof does not
scale past simple state invariants, not that any requirement is false. Where it does work is
TrainBarrier, whose requirements are all quantifier-free at a boundary (`previously` at most).
What defeats it elsewhere:

- temporal requirements - `within`, `stable`, `during`, `cooldown` - are nested quantifiers
  over boundaries, and `auto` has to find the instantiations itself;
- every condition carries all of `inv`, so a hard conjunct costs every condition;
- the large programs are many processes: `inv` grows with every state invariant, and every
  condition re-proves all of it.

HandDryer was taken furthest. Its R3 (`within`) is not inductive alone, and the fifth
annotation is the strengthening that makes it so: since hands left, the dryer has stayed in
Work and its timer has counted every cycle, which the timeout bounds. The argument per cycle:
a window opened at or before the previous boundary, in which neither the dryer stopped nor
hands came back, extends by one cycle; the timer goes up by 100 ms with it; and the timeout
not having fired caps the window below 2 s. A structured Isabelle proof along these lines,
with general lemmas for `previously` (the nearest boundary before a boundary is its `predEnv`)
and for carrying a `during` across a cycle, was drafted; the lemmas check, the proof did not
finish within the budget.

## Regenerating

From the ReflexVCG tree, for each program:

```
mvn package -DskipTests
tools/export-case-study.sh <copy of program.rcs> <copy of program.proofs> \
    D:/Reflex-case-studies/ReflexVCG3/Real/<Program>
```

The script copies both files into the destination, so pass copies kept elsewhere rather than
the ones already in the folder.
