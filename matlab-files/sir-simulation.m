function SIR_stoch_run
    % Simulation of the stochastic SIR model with vaccination dynamics
    
    % Model parameters
    params.m = 0.005; % Host birth/death rate
    params.b = 0.2;   % Infection rate
    params.v = 0;     % Pathogen-induced mortality rate
    params.r = 0.05;  % Recovery rate
    params.a = 0.01;  % Vaccination rate
    params.c = 0.1;   % Cost of vaccine
    
    % Initial population sizes
    initial.S = 45;  % Susceptible individuals
    initial.I = 5;   % Infected individuals
    initial.R = 0;   % Recovered individuals
    initial.V = 30;  % Vaccinated individuals
    initial.Vp = 40; % Pro-vaccine individuals
    initial.Vn = 10; % Anti-vaccine individuals
    
    % Basic reproduction number
    Ro = params.b / (params.r + params.m);
    
    % Simulation parameters
    end_time = 700;  % Simulation duration
    run_count = 5;   % Number of runs
    
    % Initialize result structures
    result = initialize_results();
    result1 = initialize_results();
    c1 = initialize_results();
    
    mu = [];
    jc = [];
    
    % Run multiple stochastic simulations
    for n = 1:run_count
        out = SIR_stoch(params, initial, end_time);
        result = store_results(result, out);
    end
    
    % Vary cost of vaccine parameter and collect statistics
    for c = 0:0.1:1
        for n = 1:run_count
            out = SIR_stoch(params, initial, end_time);
            result1 = store_results(result1, out);
        end
        jc = [jc, joincount(result1.Vp, result1.Vn)];
        mu = [mu, mutInfo(result1.S, result1.Vp)];
        c1 = store_final_state(c1, result1);
    end
    
    % Plot results
    plot_results(mu, jc, result);
end
