set(gca, 'XLim', [ 0   tk ]);

Y_max = max(abs(j_1ppr), [], 'all');
set(gca, 'YLim', [-1.1*Y_max 1.1*Y_max]);

xlabel('t, �');
if sw_j_1ppr_gr == 1
    ylabel('j_{1���}, j_{1��}, j_{2���}, �/�^2');
else
    ylabel('j_{1���}, j_{2���}, �/�^2');
end

%- ���������� ��������� ���� ---------------------------------------------%
set(gca, 'ColorOrder', Red);
plot(t, j_2ppr(1,:), '--b', 'LineWidth', 1)

%- ��������� �������� ��������� ------------------------------------------%
if sw_j_1ppr_gr == 1
    set(gca, 'ColorOrder', Green);
    plot(t, - j_1ppr_gr*ones(1,K), t, j_1ppr_gr*ones(1,K), '-', 'LineWidth', 1)
end

%- ���������� ��������� �� -----------------------------------------------%
    set(gca, 'ColorOrder', BlueDark);
    plot(t(1:K_stop(1)), j_1ppr(1:K_stop(1)), '-', 'LineWidth', 1)
    
    if flag_stop(1) == 1
        if flag_break(1) == 1   %++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            set(gca, 'ColorOrder', Red);
        else
            set(gca, 'ColorOrder', YellowOrange);
        end
        plot(t(K_stop(1)), j_1ppr(K_stop(1)), '*', 'LineWidth', 10)
    end