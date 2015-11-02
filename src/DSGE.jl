module DSGE
    using Compat, Distributions, Roots.fzero, HDF5
    using DataStructures: SortedDict, insert!, ForwardOrdering
    
    if VERSION < v"0.4-"
        using Docile
    end

    export

        # DSGE.jl
        inpath, rawpath, workpath, tablespath, figurespath, logpath,
        
        # distributions_ext.jl
        PointMass, BetaAlt, GammaAlt,

        # settings.jl
        Setting, get_setting,

        # abstractdsgemodel.jl
        AbstractDSGEModel, tomodel!, toreal!, num_states, num_shocks_exogenous, num_shocks_expectational,
        spec, subspec, modelpathroot, datapathroot, modelpath, inpath, workpath, rawpath, tablespath,
        figurespath, logpath, filestring, reoptimize, recalculate_hessian, num_mh_blocks, num_mh_simulations,
        num_mh_burn, mh_thinning_step,
        
        # new_parameters.jl
        parameter, Transform, Untransformed, SquareRoot, Exponential, NullablePrior,
        AbstractParameter, Parameter, ParameterVector, ScaledParameter, UnscaledParameter, SteadyStateParameter,
        toreal, tomodel, update, update!, tomodel, toreal, Interval,
        
        # estimate/
        dlyap!, kalcvf2NaN, kalsmth_k93, likelihood, posterior, posterior!, csminwel, hessizero!, estimate, proposal_distribution, metropolis_hastings, compute_parameter_covariance, compute_moments, make_moment_tables, find_density_bands, prior,
        
        # models/
        steadystate!, Model990, model_specifications, eqcond, measurement, create_save_directories,

        # solve/
        ordschur, gensys, solve
    
    include("new_parameters.jl")
    include("distributions_ext.jl")
    include("abstractdsgemodel.jl")
    include("settings.jl")
    include("../test/util.jl")
    # include("parameters.jl")
    
    if VERSION <= v"0.4-"
        include("solve/ordered_qz.jl")
    end
    
    include("solve/gensys.jl")
    include("solve/solve.jl")
    
    include("estimate/kalman.jl")
    include("estimate/posterior.jl")
    include("estimate/csminwel.jl")
    include("estimate/hessian.jl")
    include("estimate/estimate.jl")
    include("estimate/moments.jl")
    
    include("models/m990/m990.jl")
    include("models/m990/eqcond.jl")
    include("models/m990/measurement.jl")
    
end
