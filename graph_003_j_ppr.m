
% f003 = figure('color', 'w', 'position', [L_left   L_bottom   L_width  L_height]);
%figure_template

hold on;
grid on;
box on;

set(gca, 'FontSize', 12);

set(gca, 'XLim', [ 0   tk ]);
% set(gca, 'XLim', [ 0   t(min(K_stop)) ]);

%------------------
Y_max = max(max(abs(j_1ppr)));
set(gca, 'YLim', [-Y_max Y_max]);
%max(max(abs(j_1ppr)))
%max(max(abs(j_2ppr)))
%------------------

% if sw_j_1ppr_gr == 1
%     set(gca, 'YLim', [ -2*j_1ppr_gr   2*j_1ppr_gr ]);
% end

xlabel('t, с');
if sw_j_1ppr_gr == 1
    ylabel('j_{1ппр}, j_{1гр}, j_{2ппр}, м/с^2');
else
    ylabel('j_{1ппр}, j_{2ппр}, м/с^2');
end

%- поперечное ускорение цели ---------------------------------------------%
set(gca, 'ColorOrder', Red);
plot(t, j_2ppr(1,:), '-', 'LineWidth', 1)

%- граничные значения ускорения ------------------------------------------%
if sw_j_1ppr_gr == 1
    set(gca, 'ColorOrder', Green);
    plot(t, - j_1ppr_gr*ones(1,K), t, j_1ppr_gr*ones(1,K), '-', 'LineWidth', 1)
end

%- поперечное ускорение ОУ -----------------------------------------------%
if sw_obup_1 == 1
    set(gca, 'ColorOrder', BlueDark);
    plot(t(1:K_stop(1)), j_1ppr(1,1:K_stop(1)), '-', 'LineWidth', 1)
    
    if flag_stop(1) == 1
        if flag_break(1) == 1   %++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            set(gca, 'ColorOrder', Red);
        else
            set(gca, 'ColorOrder', YellowOrange);
        end
        plot(t(K_stop(1)), j_1ppr(1,K_stop(1)), '*', 'LineWidth', 10)
    end
end

if sw_obup_2 == 1
    set(gca, 'ColorOrder', BlueDark);
    plot(t(1:K_stop(2)), j_1ppr(2,1:K_stop(2)), '--', 'LineWidth', 1)
    
    if flag_stop(2) == 1
        if flag_break(2) == 1   %++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            set(gca, 'ColorOrder', Red);
        else
            set(gca, 'ColorOrder', YellowOrange);
        end
        plot(t(K_stop(2)), j_1ppr(2,K_stop(2)), '*', 'LineWidth', 10)
    end
end

if sw_obup_3 == 1
    set(gca, 'ColorOrder', BlueDark);
    plot(t(1:K_stop(3)), j_1ppr(3,1:K_stop(3)), '-.', 'LineWidth', 1)
    
    if flag_stop(3) == 1
        if flag_break(3) == 1   %++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            set(gca, 'ColorOrder', Red);
        else
            set(gca, 'ColorOrder', YellowOrange);
        end
        plot(t(K_stop(3)), j_1ppr(3,K_stop(3)), '*', 'LineWidth', 10)
    end
end

if sw_obup_4 == 1
    set(gca, 'ColorOrder', BlueDark);
    plot(t(1:K_stop(4)), j_1ppr(4,1:K_stop(4)), ':', 'LineWidth', 2)
    
    if flag_stop(4) == 1
        if flag_break(4) == 1   %++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            set(gca, 'ColorOrder', Red);
        else
            set(gca, 'ColorOrder', YellowOrange);
        end
        plot(t(K_stop(4)), j_1ppr(4,K_stop(4)), '*', 'LineWidth', 10)
    end
end




