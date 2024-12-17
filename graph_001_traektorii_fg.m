
%-------------------------------------------------------------------------%
%- ����� ����������� -----------------------------------------------------%
%-------------------------------------------------------------------------%
step_lv = t_linviz/T;   % ���������� ������ ����� �������� ��
% set(gca, 'ColorOrder', BlueBright);
if sw_linviz_1
    for n = 1:step_lv:K_stop
        plot( [z_1(1,n) z_2(1,n)], [x_1(1,n) x_2(1,n)], 'LineWidth', 1, 'Color', BlueBright)
    end
end
       
%-------------------------------------------------------------------------%
%- ���������� ------------------------------------------------------------%
%-------------------------------------------------------------------------%       
% ����
% set(gca, 'ColorOrder', Red);


% ��
% set(gca, 'ColorOrder', BlueDark);
% plot( z_1(1,1:K_stop), x_1(1,1:K_stop), '-', 'LineWidth', 1) % ���������� �������� ��
% plot( z_1(1,1), x_1(1,1), '*', 'LineWidth', 2) % �������� ����� ��

% ��������� ���������
% if flag_stop(1) == 1
    if flag_break(1) == 1   % ����� "�������"
        % set(gca, 'ColorOrder', Red);
        line( z_1(1,K_stop), x_1(1,K_stop), 'Marker', '*', 'LineWidth', 10, 'Color', Red )

        line( z_2(1,1:K_stop), x_2(1,1:K_stop), 'LineWidth', 1, 'Color', BlueDark ) % ���������� �������� ����
        line( z_2(1,1), x_2(1,1), 'Marker', '*', 'LineWidth', 2, 'Color', BlueDark) % �������� ����� ����

        line( z_1(1,1:K_stop), x_1(1,1:K_stop), 'LineStyle', '-', 'LineWidth', 1, 'Color', BlueDark ) % ���������� �������� ��
        line( z_1(1,1), x_1(1,1), 'Marker', '*', 'LineWidth', 2, 'Color', BlueDark ) % �������� ����� ��
        disp('������ � ����� �������')
    
    else % ����� "���������"
        % set(gca, 'ColorOrder', YellowOrange);
        line( z_1(1,K_stop), x_1(1,K_stop), 'Marker', '*', 'LineWidth', 10, 'Color', YellowOrange )

        line( z_2(1,1:K_stop), x_2(1,1:K_stop), 'LineWidth', 1, 'Color', YellowOrange) % ���������� �������� ����
        line( z_2(1,1), x_2(1,1), 'Marker', '*', 'LineWidth', 2, 'Color', YellowOrange ) % �������� ����� ����

        line( z_1(1,1:K_stop), x_1(1,1:K_stop), 'LineStyle', '-', 'LineWidth', 1, 'Color', YellowOrange ) % ���������� �������� ��
        line( z_1(1,1), x_1(1,1), 'Marker', '*', 'LineWidth', 2, 'Color', YellowOrange ) % �������� ����� ��
        disp('������ � ����� ���������')
    end
    
% end

% ������� � �������� ������
h_ou1 = text(z_1(1,1), x_1(1,1), '��1', ...
             'VerticalAlignment', 'top', ...
             'HorizontalAlignment', 'center',...
             'FontSize', 12);

h_c = text(z_2(1,1), x_2(1,1), '�', ...
          'VerticalAlignment', 'top', ...
          'HorizontalAlignment', 'center',...
          'FontSize', 12);

