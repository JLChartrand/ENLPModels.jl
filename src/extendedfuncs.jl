"""
    AbstractStochasticNLPModels
Base type for metadata related to a stochastic optimization model.
"""
abstract type AbstractStochasticNLPModels{T, S} <: AbstractNLPModel{T, S} end
#a simpler name
const ASNLPM = AbstractStochasticNLPModels
function nobs(nlp::ASNLPM)::Int
    @warn "nobs not extended for model of type $(typeof(nlp))"
end
"""
    f = objs!(nlp, x, values; sample, inplace)
Evaluate ``[f_{k_1}(x), f_{k_2}(x), ..., f_{k_N}(x)]``, the objective function of `nlp` at `x` for all k_i in sample and stores it
in values. If inplace is true: f_{k_i} is stored at values[k_i], otherwise: f_{k_i} is stored at values[i]
"""
function objs!(nlp::ASNLPM, x::AbstractVector, values::AbstractVector; sample::AbstractVector{Int} = [-1], inplace::Bool = false) 
    @warn "objs! not extended for model of type $(typeof(nlp))"
end
"""
    f = objs(nlp, x, values; sample)
Evaluate ``[f_{k_1}(x), f_{k_2}(x), ..., f_{k_N}(x)]``, the objective function of `nlp` at `x` for all k_i in sample
"""
function objs(nlp::ASNLPM, x::AbstractVector{T}; sample::AbstractVector{Int} = [-1]) where T
    @lencheck nlp.meta.nvar x
    values = Array{T, 1}(undef, length(sample))
    objs!(nlp, x, values; sample = sample, inplace = false)
    return values
end
"""
    gs = grads!(nlp, x, gs; sample, inplace)
Evaluate ``[df_{k_1}(x) df_{k_2}(x) ... df_{k_N}(x)]``, the gradient (``df``) of the objective function of `nlp` at `x` for all k_i in sample and stores it
in the matrix gs. If inplace is true: df_{k_i}(x) is stored at gs[:, k_i] (the k_i-th colomn of the matrix gs), otherwise: df_{k_i}(x) is stored at gs[:, i] ( the 
i-th colomn of the matrix gs)
"""
function grads!(nlp::ASNLPM, x::AbstractVector, gs::AbstractMatrix; sample::AbstractVector{Int} = [-1], inplace::Bool = false)
    @warn "grads! not extended for model of type $(typeof(nlp))"
end
"""
    gs = grads(nlp, x; sample, inplace)
Evaluate ``[df_{k_1}(x) df_{k_2}(x) ... df_{k_N}(x)]``, the gradient (``df``) of the objective function of `nlp` at `x` for all k_i in sample and returns it as a matrix
"""
function grads(nlp::ASNLPM, x::AbstractVector{T}; sample::AbstractVector{Int} = [-1]) where T
    @lencheck nlp.meta.nvar x
    gs = Array{T, 2}(undef, length(x), length(sample))
    grads!(nlp, x, gs; sample = sample, inplace = false)
    return gs
end
function hess!(nlp::ASNLPM, x::AbstractVector, B::AbstractMatrix; sample::AbstractVector{Int} = [-1])
    @warn "hess! not extended for model of type $(typeof(nlp))"
end

function bhhh!(nlp::ASNLPM, x::AbstractVector, B::AbstractMatrix; sample::AbstractVector{Int} = [-1])
    @warn "bhhh! not extended for model of type $(typeof(nlp))"
end
function bhhh(nlp::ASNLPM, x::AbstractVector{T}; sample::AbstractVector{Int} = [-1]) where T
    @lencheck nlp.meta.nvar x
    B = array{T, 2}(undef, length(x), length(x))
    bhhh!(nlp, x, B; sample = sample)
end
function bhhhprod!(nlp::ASNLPM, x::AbstractVector, ac::AbstractVector, v::AbstractVector; sample::AbstractVector{Int} = [-1])
    @warn "bhhhprodv! not extended for model of type $(typeof(nlp))"
end
function bhhhprod(nlp::ASNLPM, x::AbstractVector{T}, v::AbstractVector; sample::AbstractVector{Int} = [-1]) where T
    @lencheck nlp.meta.nvar x
    ac = array{T, 1}(undef, length(x))
    bhhhprod!(nlp, x, ac, v; sample = sample)
end