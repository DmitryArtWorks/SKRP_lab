
% f002 = figure('color', 'w', 'position', [L_left   L_bottom   L_width  L_height]);
%figure_template

cla reset

hold on;
grid on;
box on;

set(gca, 'FontSize', 12);

set(gca, 'XLim', [ 0   tk ]);

% set(gca, 'XLim', [ 0   t(min(K_stop)) ]);

xlabel('t, ñ');
ylabel('D, ì');

    set(gca, 'ColorOrder', BlueDark);
    plot(t(1:K_stop(1)), D(1,1:K_stop(1)), '-', 'LineWidth', 1)
    
    if flag_stop(1) == 1
        if flag_break(1) == 1   %++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            set(gca, 'ColorOrder', Red);
        else
            set(gca, 'ColorOrder', YellowOrange);
        end
        plot(t(K_stop(1)), D(1,K_stop(1)), '*', 'LineWidth', 10)
    end






