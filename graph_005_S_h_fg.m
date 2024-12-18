

set(gca, 'XLim', [ 0   tk ]);
% set(gca, 'XLim', [ 0   t(min(K_stop)) ]);

xlabel('t, ñ');
ylabel('S_h, ì*ñ');


    set(gca, 'ColorOrder', BlueDark);
    plot(t(1:K_stop(1)), S_h(1,1:K_stop(1)), '-', 'LineWidth', 1)
    
    if flag_stop(1) == 1
        if flag_break(1) == 1   %++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            set(gca, 'ColorOrder', Red);
        else
            set(gca, 'ColorOrder', YellowOrange);
        end
        plot(t(K_stop(1)), S_h(1,K_stop(1)), '*', 'LineWidth', 10)
    end