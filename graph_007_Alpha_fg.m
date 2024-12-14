
% f0007 =  figure('Name', 'Epsilon','NumberTitle','off','color', 'w', 'position', [L_left   L_bottom   L_width  L_height]);

cla reset

hold on;
grid on;
box on;

xlabel('t, с');
ylabel('epsilon, градусы');

if sw_obup_1 == 1
    set(gca, 'ColorOrder', BlueDark);
    plot(t(1:K_stop(1)), alpha_deg(1,1:K_stop(1)), '-', 'LineWidth', 1)
    
    if flag_stop(1) == 1
        set(gca, 'ColorOrder', YellowOrange);
        plot(t(K_stop(1)), alpha_deg(1,K_stop(1)), '*', 'LineWidth', 10)
    end
end