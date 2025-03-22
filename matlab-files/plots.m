function plot_results(mu, jc, result)
    % Function to plot results
    c = 0:0.1:1;
    
    figure;
    plot(c, mu);
    xlabel('c');
    ylabel('Mutual Information');
    
    figure;
    plot(c, jc);
    xlabel('c');
    ylabel('Join Count');
    
    [time, m, ~] = unique(result.time);
    S = result.S(m);
    I = result.I(m);
    R = result.R(m);
    V = result.V(m);
    Vp = result.Vp(m);
    Vn = result.Vn(m);
    
    figure;
    hold on;
    plot(time, V, 'b');
    plot(time, S, 'g');
    plot(time, Vp, 'r');
    plot(time, Vn, 'm');
    hold off;
    legend('V', 'S', 'Vp', 'Vn');
    xlabel('Time');
    ylabel('Number of Individuals');
    ylim([0, 50]);
end
