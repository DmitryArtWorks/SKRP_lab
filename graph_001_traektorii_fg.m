grid on;
box on;
axis fill;

set(gca, 'FontSize', 12);


xlabel('Z, м');
ylabel('X, м');

%-------------------------------------------------------------------------%
%- ЛИНИИ ВИЗИРОВАНИЯ -----------------------------------------------------%
%-------------------------------------------------------------------------%
step_lv = t_linviz/T;   % количество тактов между выводами ЛВ
set(gca, 'ColorOrder', BlueBright);
if sw_linviz_1
    for n = 1:step_lv:K_stop
        plot( [z_1(1,n) z_2(1,n)], [x_1(1,n) x_2(1,n)], 'LineWidth', 1)
    end
end
        
%-------------------------------------------------------------------------%
%- ТРАЕКТОРИИ ------------------------------------------------------------%
%-------------------------------------------------------------------------%       
set(gca, 'ColorOrder', Red);
plot( z_2(1,1:K_stop), x_2(1,1:K_stop), 'LineWidth', 1)
plot( z_2(1,1), x_2(1,1), '*', 'LineWidth', 2)

h_c = text(z_2(1,1), x_2(1,1), 'Ц', ...
          'VerticalAlignment', 'top', ...
          'HorizontalAlignment', 'center',...
          'FontSize', 12);

set(gca, 'ColorOrder', BlueDark);
plot( z_1(1,1:K_stop), x_1(1,1:K_stop), '-', 'LineWidth', 1)
plot( z_1(1,1), x_1(1,1), '*', 'LineWidth', 2)
    
if flag_stop(1) == 1
    if flag_break(1) == 1   %++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
        set(gca, 'ColorOrder', Red);
    else
        set(gca, 'ColorOrder', YellowOrange);
    end
    plot( z_1(1,K_stop), x_1(1,K_stop), '*', 'LineWidth', 10)
end

h_ou1 = text(z_1(1,1), x_1(1,1), 'ОУ1', ...
             'VerticalAlignment', 'top', ...
             'HorizontalAlignment', 'center',...
             'FontSize', 12);


