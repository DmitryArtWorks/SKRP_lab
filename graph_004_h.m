set(gca, 'XLim', [ 0   tk ]);

%-----------------------------------------
Y_max = max(abs(h), [], 'all');
set(gca, 'YLim', [-1.1*Y_max 1.1*Y_max]);
%----------------------------------------
xlabel('t, ñ');
ylabel('h, ì');

plot(t, zeros(1,K), '--b', 'LineWidth', 1)

set(gca, 'ColorOrder', BlueDark);
plot(t(1:K_stop(1)), h(1,1:K_stop(1)), '-', 'LineWidth', 1)
    
if flag_stop(1) == 1
    if flag_break(1) == 1
        set(gca, 'ColorOrder', Red);
    else
        set(gca, 'ColorOrder', YellowOrange);
    end
    plot(t(K_stop(1)), h(1,K_stop(1)), '*', 'LineWidth', 10)
end
