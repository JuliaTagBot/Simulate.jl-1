#
# This file is part of the Simulate.jl Julia package, MIT license
#
# Paul Bayer, 2019
#
# This is a Julia package for discrete event simulation
#

"a state machine is undefined (after creation)"
struct Undefined <: SState end

"a state machine is idle"
struct Idle <: SState end

"a state machine is empty"
struct Empty <: SState end

"a state machine is busy"
struct Busy <: SState end

"a state machine is halted"
struct Halted <: SState end

"`Init(info)`: Init event with some info."
struct Init <: SEvent
    info::Any
end

"`Setup(vars::Array{Symbol,1}, scope::Module)`: setup a logger with some info."
struct Setup <: SEvent
    vars::Array{Symbol,1}
    scope::Module
end

"`Switch(to)`: switch to some other mode"
struct Switch <: SEvent
    to
end

"`Log()`: record command for logging"
struct Log <: SEvent end

"`Step()`: command"
struct Step <: SEvent end

"`Run()`: command"
struct Run <: SEvent
    duration::Float64
end

"`Register()`: command"
struct Register{T <: Union{SimEvent,SimCond,Sample}} <: SEvent
    x::T
end

"`Sync()`: command"
struct Sync{T <: AbstractClock} <: SEvent
    clock::T
end

"`Start()`: command"
struct Start <: SEvent end

"`Stop()`: command"
struct Stop <: SEvent end

"`Resume()`: command"
struct Resume <: SEvent end

"`Clear()`: command"
struct Clear <: SEvent end

"`Query()`: command, causes an active clock to send its clock data."
struct Query <: SEvent end

"`Diag()`: command, causes an active clock to send the last stacktrace."
struct Diag <: SEvent end

"`Reset()`: command"
struct Reset <: SEvent end

"`Response()`: response from an active clock"
struct Response <: SEvent
    x::Any
end

"""
    step!(A::AbstractClock, q::SState, σ::SEvent)

Default transition for clock state machines.

This is called if no otherwise defined transition occurs.

# Arguments
- `A::AbstractClock`: state machine for which a transition is called
- `q::SState`:  state of the state machine
- `σ::SEvent`:  event, triggering the transition
"""
function step!(A::AbstractClock, q::SState, σ::SEvent)
    println(stderr, "Warning: undefined transition ",
            "$(typeof(A)), ::$(typeof(q)), ::$(typeof(σ)))")
end
