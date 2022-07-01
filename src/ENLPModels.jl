module ENLPModels
using NLPModels

#the for loop was found at https://discourse.julialang.org/t/exportall/4970/14




include("extendedfuncs.jl")
#export all functions defined in ENLPModels
for n in names(@__MODULE__; all=true)
    if Base.isidentifier(n) && !(n in (Symbol(@__MODULE__), :eval, :include))
        @eval export $n
    end
end
#Export all functions exported by NLPModels
for n in names(NLPModels; all=true)
    if Base.isidentifier(n) && !(n in (Symbol(NLPModels), :eval, :include))
        @eval export $n
    end
end
end # module
