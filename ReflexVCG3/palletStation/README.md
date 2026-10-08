# palletStation

**This is not a real controller.** It was written to exercise the verification condition
generator, not to run a machine and not to be correct. It carries every kind of annotation
Reflex-AL offers and every operator, across four states chosen to differ in how they loop —
one with no loop, one with a single loop, one with two loops in a row, and one with a loop
inside a loop. Read it as a test fixture. Nothing here describes a palletising station
anyone should build, and several of the properties it claims are false of the program that
claims them.

That last point matters for the proofs. A condition that does not go through here usually
means the annotation asked for something the program does not do — not that the generator
produced something wrong.

## What is in the folder

| | |
|---|---|
| `palletStation.rcs` | the program |
| `PalletStationTheory.thy` | `ltime` against the program's clock, and the `constants` predicate |
| `Requirements.thy` | `inv`, the invariants written on the program, its processes and their states |
| `LoopInvariants.thy` | one definition per loop, each a predicate of the state the run began at and the state it is claimed at |
| `ReflexBase/Lemmas/Patterns.thy` | the semantics and the facts built on it, copied in so the folder stands alone |
| `PalletStation_*.thy` | the 62 conditions, one per file |
| `palletStation.proofs` | which proof closes which condition, and why each open one is open |
| `ROOT` | builds the lot as one session |

Condition names carry the number the file was written under. Those shift whenever the
program does, so regenerate the folder rather than renumbering it by hand.

## Proofs

36 of the 62 close, each by one of two proofs:

```
using assms by (simp add: setVarVal_def constants_def inv_def)
using assms by (auto simp add: setVarVal_def constants_def inv_def substate_refl
                               loopInv0_def loopInv1_def loopInv2_def loopInv3_def loopInv4_def)
```

That is every loop entry, every variant bound, every variant decrease, and six of the seven
loop steps. The remaining 26 carry `sorry` and a comment pointing at `palletStation.proofs`,
which says why each is open. In short:

- **`LOOPSTEP47`** — the one condition open because of the generator. A loop nested in
  another needs a boundary predicate of its own: the inner loop's exit state is opaque and
  declared a boundary, which makes it a boundary of the *outer* loop's run too, so the outer
  invariant is demanded half-way through an outer iteration where it does not hold.
  Restricted to the iteration's end the step proves automatically; restricted to the inner
  loop's exit it is not provable.
- **the 13 cycle conditions** — each must show all of `inv`, which conjoins invariants this
  program does not implement: nothing stops the belts on `jam`, nothing bounds the time spent
  in `packing`. One false conjunct sinks the whole condition. Restricted to the conjuncts the
  program does establish, a cycle condition proves automatically, induction across the cycle
  boundary included.
- **the 12 annotation conditions** — each states more than its path establishes: an `assume`
  over a free input the environment supplies, a claim about an earlier cycle that `inv` does
  not record, or a `next(...)` asking about a boundary the path has not reached.

The session builds with `quick_and_dirty`, since the open conditions use `sorry`.

## Regenerating

From the ReflexVCG tree:

```
mvn package -DskipTests
tools/export-case-study.sh src/test/resources/programs-new/palletStation.rcs \
    tools/palletStation.proofs D:/Reflex-case-studies/palletStation
```

Generated against Isabelle2025-2.
