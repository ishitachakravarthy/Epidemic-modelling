function c1 = store_final_state(c1, result1)
    % Function to store final state values
    c1.S = [c1.S, result1.S(end)];
    c1.I = [c1.I, result1.I(end)];
    c1.R = [c1.R, result1.R(end)];
    c1.V = [c1.V, result1.V(end)];
    c1.Vp = [c1.Vp, result1.Vp(end)];
    c1.Vn = [c1.Vn, result1.Vn(end)];
end
