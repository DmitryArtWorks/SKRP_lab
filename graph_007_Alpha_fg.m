
xlabel('t, с');
ylabel('epsilon, град');
set(gca, 'ColorOrder', BlueDark);
plot(t(1:K_stop(1)), alpha_deg(1:K_stop(1)), '-', 'LineWidth', 1)
    
if flag_stop == 1
    set(gca, 'ColorOrder', YellowOrange);
    plot(t(K_stop(1)), alpha_deg(K_stop(1)), '*', 'LineWidth', 10)
end
