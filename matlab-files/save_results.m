function result = store_results(result, out)
    % Function to store simulation results
    result.time = [result.time, out.time];
    result.S = [result.S, out.S];
    result.I = [result.I, out.I];
    result.R = [result.R, out.R];
    result.V = [result.V, out.V];
    result.Vp = [result.Vp, out.Vp];
    result.Vn = [result.Vn, out.Vn];
end
