
% f002 = figure('color', 'w', 'position', [L_left   L_bottom   L_width  L_height]);
figure_template

hold on;
grid on;
box on;

set(gca, 'FontSize', 12);

set(gca, 'XLim', [ 0   tk ]);
% set(gca, 'XLim', [ 0   t(min(K_stop)) ]);

xlabel('t, ñ');
ylabel('V_t, ì/ñ');

if sw_obup_1 == 1
    set(gca, 'ColorOrder', BlueDark);
    plot(t(1:K_stop(1)), V_t(1,1:K_stop(1)), '-', 'LineWidth', 1)
    
    if flag_stop(1) == 1
        set(gca, 'ColorOrder', YellowOrange);
        plot(t(K_stop(1)), V_t(1,K_stop(1)), '*', 'LineWidth', 10)
    end
    
    set(gca, 'ColorOrder', GreenDark);
    plot(t(1:K_stop(1)), V_t_a(1,1:K_stop(1)), '-', 'LineWidth', 1)
    
    if flag_stop(1) == 1
        set(gca, 'ColorOrder', YellowOrange);
        plot(t(K_stop(1)), V_t_a(1,K_stop(1)), '*', 'LineWidth', 10)
    end
end

if sw_obup_2 == 1
    set(gca, 'ColorOrder', BlueDark);
    plot(t(1:K_stop(2)), V_t(2,1:K_stop(2)), '--', 'LineWidth', 1)
    
    if flag_stop(2) == 1
        set(gca, 'ColorOrder', YellowOrange);
        plot(t(K_stop(2)), V_t(2,K_stop(2)), '*', 'LineWidth', 10)
    end
    
    set(gca, 'ColorOrder', GreenDark);
    plot(t(1:K_stop(2)), V_t_a(2,1:K_stop(2)), '--', 'LineWidth', 1)
    
    if flag_stop(2) == 1
        set(gca, 'ColorOrder', YellowOrange);
        plot(t(K_stop(2)), V_t_a(2,K_stop(2)), '*', 'LineWidth', 10)
    end
end

if sw_obup_3 == 1
    set(gca, 'ColorOrder', BlueDark);
    plot(t(1:K_stop(3)), V_t(3,1:K_stop(3)), '-.', 'LineWidth', 1)
    
    if flag_stop(3) == 1
        set(gca, 'ColorOrder', YellowOrange);
        plot(t(K_stop(3)), V_t(3,K_stop(3)), '*', 'LineWidth', 10)
    end
end

if sw_obup_4 == 1
    set(gca, 'ColorOrder', BlueDark);
    plot(t(1:K_stop(4)), V_t(4,1:K_stop(4)), ':', 'LineWidth', 2)
    
    if flag_stop(4) == 1
        set(gca, 'ColorOrder', YellowOrange);
        plot(t(K_stop(4)), V_t(4,K_stop(4)), '*', 'LineWidth', 10)
    end
end




