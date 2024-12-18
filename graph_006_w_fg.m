set(gca, 'XLim', [ 0   tk ]);


xlabel('t, с');
ylabel('\omega, град');

Y_max = max(abs(w_deg), [], 'all');
set(gca, 'YLim', [-1.1*Y_max 1.1*Y_max]);

set(gca, 'ColorOrder', Red);
plot(t, zeros(1,K), '--b', 'LineWidth', 1)

    set(gca, 'ColorOrder', BlueDark);
    plot(t(1:K_stop(1)), w_deg(1,1:K_stop(1)), '-', 'LineWidth', 1)
    
    if flag_stop(1) == 1
        if flag_break(1) == 1   %++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            set(gca, 'ColorOrder', Red);
        else
            set(gca, 'ColorOrder', YellowOrange);
        end
        plot(t(K_stop(1)), w_deg(1,K_stop(1)), '*', 'LineWidth', 10)
    end
