z_1 = z1(Dir,:); x_1 = x1(Dir,:);
z_2 = z2(Dir,:); x_2 = x2(Dir,:);
K_stop = K_stop_multilaunch(Dir);
flag_break = flag_miss(Dir);
xlabel('Z, м'); ylabel('X, м');
%-------------------------------------------------------------------------%
%- ЛИНИИ ВИЗИРОВАНИЯ -----------------------------------------------------%
%-------------------------------------------------------------------------%
step_lv = t_linviz/T;   % количество тактов между выводами ЛВ
% set(gca, 'ColorOrder', BlueBright);
if sw_linviz_1
    for n = 1:step_lv:K_stop
        plot( [z_1(n) z_2(n)], [x_1(1,n) x_2(1,n)], 'LineWidth', 1, 'Color', BlueBright)
    end
end
       
%-------------------------------------------------------------------------%
%- ТРАЕКТОРИИ И ИНДИКАТОР ПОПАДАНИЯ --------------------------------------%
%-------------------------------------------------------------------------%       

% Индикатор попадания
if flag_break(1) == 1   % Ветка "промаха"
    line( z_1(K_stop), x_1(K_stop), 'Marker', '*', 'LineWidth', 10, 'Color', Red ) % метка конца траектории
        
    % Цель
    line( z_2(1:K_stop), x_2(1:K_stop), 'LineWidth', 1, 'Color', BlueDark ) % траектория движения цели
    line( z_2(1), x_2(1), 'Marker', '*', 'LineWidth', 2, 'Color', BlueDark) % Исходная точка цели

    % ОУ
    line( z_1(1,1:K_stop), x_1(1,1:K_stop), 'LineStyle', '-', 'LineWidth', 1, 'Color', BlueDark ) % траектория движения ОУ
    line( z_1(1,1), x_1(1,1), 'Marker', '*', 'LineWidth', 2, 'Color', BlueDark ) % Исходная точка ОУ
    
else % Ветка "попадания"
    line( z_1(K_stop), x_1(K_stop), 'Marker', '*', 'LineWidth', 10, 'Color', YellowOrange ) % Метка конца траектории
        
    % Цель
    line( z_2(1:K_stop), x_2(1:K_stop), 'LineWidth', 1, 'Color', YellowOrange) % траектория движения цели
    line( z_2(1), x_2(1), 'Marker', '*', 'LineWidth', 2, 'Color', YellowOrange ) % Исходная точка цели
        
    % ОУ
    line( z_1(1:K_stop), x_1(1:K_stop), 'LineStyle', '-', 'LineWidth', 1, 'Color', YellowOrange ) % траектория движения ОУ
    line( z_1(1), x_1(1), 'Marker', '*', 'LineWidth', 2, 'Color', YellowOrange ) % Исходная точка ОУ
end
    

% Подписи к исходным точкам
h_ou1 = text(z_1(1,1), x_1(1,1), 'ОУ1', ...
             'VerticalAlignment', 'top', ...
             'HorizontalAlignment', 'center',...
             'FontSize', 12);

h_c = text(z_2(1,1), x_2(1,1), 'Ц', ...
          'VerticalAlignment', 'top', ...
          'HorizontalAlignment', 'center',...
          'FontSize', 12);

