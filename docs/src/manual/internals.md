# Internals

```@meta
CurrentModule = Simulate
```

## Clocks

`Simulate.jl` contains two clock types: [`Clock`](@ref) and [`ActiveClock`](@ref). Both are implemented as state machines. The implementation functions and types are not exported.

We have some definitions for them to work.

```@docs
AbstractClock
```

### States

Defined clock states.

```@docs
SState
Undefined
Idle
Empty
Busy
Halted
```

### Events

Defined events.

```@docs
SEvent
Init
Setup
Switch
Log
Step
Run
Reset
Query
Diag
Response
Register
Sync
Start
Stop
Resume
Clear
```

### Multithreading

Internal functions used for multithreading.

```@docs
start_threads
activeClock
spawnid
```

### Transition functions

The internal clock transition function has several methods for different combinations of clock types, states and events:

```@docs
step!
```

## Other internal types and functions
```@docs
SimEvent
SimCond
Sample
sconvert
nextevent
nextevtime
checktime
evaluate
evExec
sfExec
setTimes
do_event!
do_tick!
do_step!
do_run!
startup!
register!
wakeup
init!
loop
scale
```