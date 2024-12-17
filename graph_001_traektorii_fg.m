
%-------------------------------------------------------------------------%
%- ЛИНИИ ВИЗИРОВАНИЯ -----------------------------------------------------%
%-------------------------------------------------------------------------%
step_lv = t_linviz/T;   % количество тактов между выводами ЛВ
% set(gca, 'ColorOrder', BlueBright);
if sw_linviz_1
    for n = 1:step_lv:K_stop
        plot( [z_1(1,n) z_2(1,n)], [x_1(1,n) x_2(1,n)], 'LineWidth', 1, 'Color', BlueBright)
    end
end
       
%-------------------------------------------------------------------------%
%- ТРАЕКТОРИИ ------------------------------------------------------------%
%-------------------------------------------------------------------------%       
% Цель
% set(gca, 'ColorOrder', Red);


% ОУ
% set(gca, 'ColorOrder', BlueDark);
% plot( z_1(1,1:K_stop), x_1(1,1:K_stop), '-', 'LineWidth', 1) % траектория движения ОУ
% plot( z_1(1,1), x_1(1,1), '*', 'LineWidth', 2) % Исходная точка ОУ

% Индикатор попадания
% if flag_stop(1) == 1
    if flag_break(1) == 1   % Ветка "промаха"
        % set(gca, 'ColorOrder', Red);
        line( z_1(1,K_stop), x_1(1,K_stop), 'Marker', '*', 'LineWidth', 10, 'Color', Red )

        line( z_2(1,1:K_stop), x_2(1,1:K_stop), 'LineWidth', 1, 'Color', BlueDark ) % траектория движения цели
        line( z_2(1,1), x_2(1,1), 'Marker', '*', 'LineWidth', 2, 'Color', BlueDark) % Исходная точка цели

        line( z_1(1,1:K_stop), x_1(1,1:K_stop), 'LineStyle', '-', 'LineWidth', 1, 'Color', BlueDark ) % траектория движения ОУ
        line( z_1(1,1), x_1(1,1), 'Marker', '*', 'LineWidth', 2, 'Color', BlueDark ) % Исходная точка ОУ
        disp('Попали в ветку промаха')
    
    else % Ветка "попадания"
        % set(gca, 'ColorOrder', YellowOrange);
        line( z_1(1,K_stop), x_1(1,K_stop), 'Marker', '*', 'LineWidth', 10, 'Color', YellowOrange )

        line( z_2(1,1:K_stop), x_2(1,1:K_stop), 'LineWidth', 1, 'Color', YellowOrange) % траектория движения цели
        line( z_2(1,1), x_2(1,1), 'Marker', '*', 'LineWidth', 2, 'Color', YellowOrange ) % Исходная точка цели

        line( z_1(1,1:K_stop), x_1(1,1:K_stop), 'LineStyle', '-', 'LineWidth', 1, 'Color', YellowOrange ) % траектория движения ОУ
        line( z_1(1,1), x_1(1,1), 'Marker', '*', 'LineWidth', 2, 'Color', YellowOrange ) % Исходная точка ОУ
        disp('Попали в ветку попадания')
    end
    
% end

% Подписи к исходным точкам
h_ou1 = text(z_1(1,1), x_1(1,1), 'ОУ1', ...
             'VerticalAlignment', 'top', ...
             'HorizontalAlignment', 'center',...
             'FontSize', 12);

h_c = text(z_2(1,1), x_2(1,1), 'Ц', ...
          'VerticalAlignment', 'top', ...
          'HorizontalAlignment', 'center',...
          'FontSize', 12);

