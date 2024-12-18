z_1 = z1(Dir,:); x_1 = x1(Dir,:);
z_2 = z2(Dir,:); x_2 = x2(Dir,:);
K_stop = K_stop_multilaunch(Dir);
flag_break = flag_miss(Dir);
xlabel('Z, �'); ylabel('X, �');
%-------------------------------------------------------------------------%
%- ����� ����������� -----------------------------------------------------%
%-------------------------------------------------------------------------%
step_lv = t_linviz/T;   % ���������� ������ ����� �������� ��
% set(gca, 'ColorOrder', BlueBright);
if sw_linviz_1
    for n = 1:step_lv:K_stop
        plot( [z_1(n) z_2(n)], [x_1(1,n) x_2(1,n)], 'LineWidth', 1, 'Color', BlueBright)
    end
end
       
%-------------------------------------------------------------------------%
%- ���������� � ��������� ��������� --------------------------------------%
%-------------------------------------------------------------------------%       

% ��������� ���������
if flag_break(1) == 1   % ����� "�������"
    line( z_1(K_stop), x_1(K_stop), 'Marker', '*', 'LineWidth', 10, 'Color', Red ) % ����� ����� ����������
        
    % ����
    line( z_2(1:K_stop), x_2(1:K_stop), 'LineWidth', 1, 'Color', BlueDark ) % ���������� �������� ����
    line( z_2(1), x_2(1), 'Marker', '*', 'LineWidth', 2, 'Color', BlueDark) % �������� ����� ����

    % ��
    line( z_1(1,1:K_stop), x_1(1,1:K_stop), 'LineStyle', '-', 'LineWidth', 1, 'Color', BlueDark ) % ���������� �������� ��
    line( z_1(1,1), x_1(1,1), 'Marker', '*', 'LineWidth', 2, 'Color', BlueDark ) % �������� ����� ��
    
else % ����� "���������"
    line( z_1(K_stop), x_1(K_stop), 'Marker', '*', 'LineWidth', 10, 'Color', YellowOrange ) % ����� ����� ����������
        
    % ����
    line( z_2(1:K_stop), x_2(1:K_stop), 'LineWidth', 1, 'Color', YellowOrange) % ���������� �������� ����
    line( z_2(1), x_2(1), 'Marker', '*', 'LineWidth', 2, 'Color', YellowOrange ) % �������� ����� ����
        
    % ��
    line( z_1(1:K_stop), x_1(1:K_stop), 'LineStyle', '-', 'LineWidth', 1, 'Color', YellowOrange ) % ���������� �������� ��
    line( z_1(1), x_1(1), 'Marker', '*', 'LineWidth', 2, 'Color', YellowOrange ) % �������� ����� ��
end
    

% ������� � �������� ������
h_ou1 = text(z_1(1,1), x_1(1,1), '��1', ...
             'VerticalAlignment', 'top', ...
             'HorizontalAlignment', 'center',...
             'FontSize', 12);

h_c = text(z_2(1,1), x_2(1,1), '�', ...
          'VerticalAlignment', 'top', ...
          'HorizontalAlignment', 'center',...
          'FontSize', 12);

