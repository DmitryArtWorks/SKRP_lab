
% f001 = figure('color', 'w', 'position', [L_left   L_bottom   L_width  L_height]);
figure_template

hold on;
grid on;
box on;
axis equal;

set(gca, 'FontSize', 12);

set(gca, 'XLim', [ 0  200*10^3 ]);
set(gca, 'YLim', [ 0  140*10^3 ]);

xlabel('Z, Ï');
ylabel('X, Ï');

%-------------------------------------------------------------------------%
%- À»Õ»» ¬»«»–Œ¬¿Õ»ﬂ -----------------------------------------------------%
%-------------------------------------------------------------------------%
step_lv = t_linviz/T;   % ÍÓÎË˜ÂÒÚ‚Ó Ú‡ÍÚÓ‚ ÏÂÊ‰Û ‚˚‚Ó‰‡ÏË À¬
set(gca, 'ColorOrder', BlueBright);
switch sw_cel
    case 0
        if (sw_linviz_1 && sw_obup_1) == 1
            for n = 1:step_lv:K_stop(1)
                plot([z_1(1,n) z_2(1,n)], [x_1(1,n) x_2(1,n)], 'LineWidth', 1)
            end
        end
        if (sw_linviz_2 && sw_obup_2) == 1
            for n = 1:step_lv:K_stop(2)
                plot([z_1(2,n) z_2(1,n)], [x_1(2,n) x_2(1,n)], 'LineWidth', 1)
            end
        end
        if (sw_linviz_3 && sw_obup_3) == 1
            for n = 1:step_lv:K_stop(3)
                plot([z_1(3,n) z_2(1,n)], [x_1(3,n) x_2(1,n)], 'LineWidth', 1)
            end
        end
        if (sw_linviz_4 && sw_obup_4) == 1
            for n = 1:step_lv:K_stop(4)
                plot([z_1(4,n) z_2(1,n)], [x_1(4,n) x_2(1,n)], 'LineWidth', 1)
            end
        end
    case 1
        if (sw_linviz_1 && sw_obup_1) == 1
            for n = 1:step_lv:K_stop(1)
                plot([z_1(1,n) z_2(1,n)], [x_1(1,n) x_2(1,n)], 'LineWidth', 1)
            end
        end
        if (sw_linviz_2 && sw_obup_2) == 1
            for n = 1:step_lv:K_stop(2)
                plot([z_1(2,n) z_2(2,n)], [x_1(2,n) x_2(2,n)], 'LineWidth', 1)
            end
        end
        if (sw_linviz_3 && sw_obup_3) == 1
            for n = 1:step_lv:K_stop(3)
                plot([z_1(3,n) z_2(3,n)], [x_1(3,n) x_2(3,n)], 'LineWidth', 1)
            end
        end
        if (sw_linviz_4 && sw_obup_4) == 1
            for n = 1:step_lv:K_stop(4)
                plot([z_1(4,n) z_2(4,n)], [x_1(4,n) x_2(4,n)], 'LineWidth', 1)
            end
        end
end
        
%-------------------------------------------------------------------------%
%- “–¿≈ “Œ–»» ------------------------------------------------------------%
%-------------------------------------------------------------------------%       

switch sw_cel
    
    case 0
        
        set(gca, 'ColorOrder', Red);
        plot(z_2(1,1:max(K_stop)), x_2(1,1:max(K_stop)), 'LineWidth', 1)
        plot(z_2(1,1), x_2(1,1), '*', 'LineWidth', 2)

        h_c = text(z_2(1,1), x_2(1,1), '÷', 'VerticalAlignment', 'top', 'HorizontalAlignment', 'center',...
            'FontSize', 12);
        
        if sw_obup_1 == 1
            set(gca, 'ColorOrder', BlueDark);
            plot(z_1(1,1:K_stop(1)), x_1(1,1:K_stop(1)), '-', 'LineWidth', 1)
            plot(z_1(1,1), x_1(1,1), '*', 'LineWidth', 2)
            
            if flag_stop(1) == 1
                if flag_break(1) == 1   %++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
                    set(gca, 'ColorOrder', Red);
                else
                    set(gca, 'ColorOrder', YellowOrange);
                end
                plot(z_1(1,K_stop(1)), x_1(1,K_stop(1)), '*', 'LineWidth', 10)
            end

            h_ou1 = text(z_1(1,1), x_1(1,1), 'Œ”1', 'VerticalAlignment', 'top', 'HorizontalAlignment', 'center',...
            'FontSize', 12);
        end
        
        if sw_obup_2 == 1
            set(gca, 'ColorOrder', BlueDark);
            plot(z_1(2,1:K_stop(2)), x_1(2,1:K_stop(2)), '--', 'LineWidth', 1)
            plot(z_1(2,1), x_1(2,1), '*', 'LineWidth', 2)
            
            if flag_stop(2) == 1
                if flag_break(2) == 1   %++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
                    set(gca, 'ColorOrder', Red);
                else
                    set(gca, 'ColorOrder', YellowOrange);
                end
                plot(z_1(2,K_stop(2)), x_1(2,K_stop(2)), '*', 'LineWidth', 10)
            end

            h_ou2 = text(z_1(2,1), x_1(2,1), 'Œ”2', 'VerticalAlignment', 'top', 'HorizontalAlignment', 'center',...
            'FontSize', 12);
        end
        
        if sw_obup_3 == 1
            set(gca, 'ColorOrder', BlueDark);
            plot(z_1(3,1:K_stop(3)), x_1(3,1:K_stop(3)), '-.', 'LineWidth', 1)
            plot(z_1(3,1), x_1(3,1), '*', 'LineWidth', 2)
            
            if flag_stop(3) == 1
                if flag_break(3) == 1   %++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
                    set(gca, 'ColorOrder', Red);
                else
                    set(gca, 'ColorOrder', YellowOrange);
                end
                plot(z_1(3,K_stop(3)), x_1(3,K_stop(3)), '*', 'LineWidth', 10)
            end

            h_ou3 = text(z_1(3,1), x_1(3,1), 'Œ”3', 'VerticalAlignment', 'bot', 'HorizontalAlignment', 'center',...
            'FontSize', 12);
        end
        
        if sw_obup_4 == 1
            set(gca, 'ColorOrder', BlueDark);
            plot(z_1(4,1:K_stop(4)), x_1(4,1:K_stop(4)), ':', 'LineWidth', 2)
            plot(z_1(4,1), x_1(4,1), '*', 'LineWidth', 2)
            
            if flag_stop(4) == 1
                if flag_break(4) == 1   %++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
                    set(gca, 'ColorOrder', Red);
                else
                    set(gca, 'ColorOrder', YellowOrange);
                end
                plot(z_1(4,K_stop(4)), x_1(4,K_stop(4)), '*', 'LineWidth', 10)
            end

            h_ou4 = text(z_1(4,1), x_1(4,1), 'Œ”4', 'VerticalAlignment', 'top', 'HorizontalAlignment', 'center',...
            'FontSize', 12);
        end
        
    case 1
        
        if sw_obup_1 == 1
            
            set(gca, 'ColorOrder', Red);
            plot(z_2(1,1:max(K_stop)), x_2(1,1:max(K_stop)), '-', 'LineWidth', 1)
            plot(z_2(1,1), x_2(1,1), '*', 'LineWidth', 2)

            h_c1 = text(z_2(1,1), x_2(1,1), '÷1', 'VerticalAlignment', 'top', 'HorizontalAlignment', 'center',...
                'FontSize', 12);
            
            set(gca, 'ColorOrder', BlueDark);
            plot(z_1(1,1:K_stop(1)), x_1(1,1:K_stop(1)), '-', 'LineWidth', 1)
            plot(z_1(1,1), x_1(1,1), '*', 'LineWidth', 2)

            if flag_stop(1) == 1
                if flag_break(1) == 1   %++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
                    set(gca, 'ColorOrder', Red);
                else
                    set(gca, 'ColorOrder', YellowOrange);
                end
                plot(z_1(1,K_stop(1)), x_1(1,K_stop(1)), '*', 'LineWidth', 10)
            end

            h_ou1 = text(z_1(1,1), x_1(1,1), 'Œ”1', 'VerticalAlignment', 'top', 'HorizontalAlignment', 'center',...
            'FontSize', 12);
        end
        
        if sw_obup_2 == 1
            
            set(gca, 'ColorOrder', Red);
            plot(z_2(2,1:max(K_stop)), x_2(2,1:max(K_stop)), '--', 'LineWidth', 1)
            plot(z_2(2,1), x_2(2,1), '*', 'LineWidth', 2)

            h_c2 = text(z_2(2,1), x_2(2,1), '÷2', 'VerticalAlignment', 'top', 'HorizontalAlignment', 'center',...
                'FontSize', 12);
            
            set(gca, 'ColorOrder', BlueDark);
            plot(z_1(2,1:K_stop(2)), x_1(2,1:K_stop(2)), '--', 'LineWidth', 1)
            plot(z_1(2,1), x_1(2,1), '*', 'LineWidth', 2)

            if flag_stop(2) == 1
                if flag_break(2) == 1   %++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
                    set(gca, 'ColorOrder', Red);
                else
                    set(gca, 'ColorOrder', YellowOrange);
                end
                plot(z_1(2,K_stop(2)), x_1(2,K_stop(2)), '*', 'LineWidth', 10)
            end

            h_ou2 = text(z_1(2,1), x_1(2,1), 'Œ”2', 'VerticalAlignment', 'top', 'HorizontalAlignment', 'center',...
            'FontSize', 12);
        end
        
        if sw_obup_3 == 1
            
            set(gca, 'ColorOrder', Red);
            plot(z_2(3,1:max(K_stop)), x_2(3,1:max(K_stop)), '-.', 'LineWidth', 1)
            plot(z_2(3,1), x_2(3,1), '*', 'LineWidth', 2)

            h_c3 = text(z_2(3,1), x_2(3,1), '÷3', 'VerticalAlignment', 'top', 'HorizontalAlignment', 'center',...
                'FontSize', 12);
            
            set(gca, 'ColorOrder', BlueDark);
            plot(z_1(3,1:K_stop(3)), x_1(3,1:K_stop(3)), '-.', 'LineWidth', 1)
            plot(z_1(3,1), x_1(3,1), '*', 'LineWidth', 2)

            if flag_stop(3) == 1
                if flag_break(3) == 1   %++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
                    set(gca, 'ColorOrder', Red);
                else
                    set(gca, 'ColorOrder', YellowOrange);
                end
                plot(z_1(3,K_stop(3)), x_1(3,K_stop(3)), '*', 'LineWidth', 10)
            end

            h_ou3 = text(z_1(3,1), x_1(3,1), 'Œ”3', 'VerticalAlignment', 'bot', 'HorizontalAlignment', 'center',...
            'FontSize', 12);
        end
        
        if sw_obup_4 == 1
            
            set(gca, 'ColorOrder', Red);
            plot(z_2(4,1:max(K_stop)), x_2(4,1:max(K_stop)), ':', 'LineWidth', 2)
            plot(z_2(4,1), x_2(4,1), '*', 'LineWidth', 2)

            h_c4 = text(z_2(4,1), x_2(4,1), '÷4', 'VerticalAlignment', 'top', 'HorizontalAlignment', 'center',...
                'FontSize', 12);
            
            set(gca, 'ColorOrder', BlueDark);
            plot(z_1(4,1:K_stop(4)), x_1(4,1:K_stop(4)), ':', 'LineWidth', 2)
            plot(z_1(4,1), x_1(4,1), '*', 'LineWidth', 2)

            if flag_stop(4) == 1
                if flag_break(4) == 1   %++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
                    set(gca, 'ColorOrder', Red);
                else
                    set(gca, 'ColorOrder', YellowOrange);
                end
                plot(z_1(4,K_stop(4)), x_1(4,K_stop(4)), '*', 'LineWidth', 10)
            end

            h_ou4 = text(z_1(4,1), x_1(4,1), 'Œ”4', 'VerticalAlignment', 'top', 'HorizontalAlignment', 'center',...
            'FontSize', 12);
        end
end

