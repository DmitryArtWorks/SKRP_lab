% ������ ����������
z_1_0 =  handles.datz11 * 10^3;%50 *10^3;   % ���������� z [�]
x_1_0 = handles.datx11 * 10^3;%25 *10^3;    % ���������� x [�]

V_1_0 = handles.dat_V11;%400;   % �������� [�/�]

psi_1_deg_init = handles.dat_psi11;%5;      % ���� [����]


% ����
z_2_0 = handles.datz21 * 10^3;%70 *10^3;    % ���������� z [�]
x_2_0 = handles.datx21 * 10^3;%70 *10^3;    % ���������� x [�]

V_2_0 = handles.datV2;%200; % �������� [�/�]

psi_2_deg_0 = handles.datpsi2;%75;  % ���� [����]

D_rk = handles.dat_K_31* 10^3;%19 *10^3;    % ��������� ����� �������������� [�]
T_rk = handles.dat_K_32;%10;    % ������ �������������� [�]

D_sn = handles.dat_K_1* 10^3;%5 *10^3;  % ��������� ������������� [�]


sw_manevr_celi = handles.dat2;%2;   % ��������� ������ ���� �� ���������� 
                                    % ������������ ���������� � �����������
                                    % ��� ����������� ��������

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

T = 0.1;    % ��� ������������� [�]
K_rk = T_rk/T;  % ����� ����� �������������, �� ������� ����������� 
                % ��������� ��������������

j_2ppr_m1 = + 1.5;  % ��������� [�/�2]

T_sin = 120;    % ������ �������������� ����������
j_2ppr_m2 = - 10;   % ��������� [�/�2]


N_m3 = 3;   % ����������� ��� ������ ���������

sw_j_1ppr_gr = 0;   % ��������� ����
j_1ppr_gr = 5;  % ���������


sw_linviz_1 = handles.dat09;    % ��������� �������� �����, ������������� ������������� 
                                % ��������� ����� ����������� � ����������,
                                % ������� ����������� ��������


D_por = 30; % ��������� ����������. ���� ���������� ����� �� � ����� ����� 
            % ������ ����� ��������, �� ������������� ���������� (�����
            % ��������� ���������)

t_linviz = 10;  % �������� ����������� ����� �����������

multilaunch_flag = handles.dat10;   % ��������� �������� �����, ������������� ������������� 
                                    % ��������������� ����� �� � ����������,
                                    % ������� ����������� ��������
num_launches = handles.dat_LaunchCnt;   % ��������� �������� �� ����, � 
                                        % ������� �������� ����� ��������, 
                                        % � ���������� ������� �����������
                                        % ��������

launch_angles = handles.dat_LaunchAngles;   % ��������� �������� �� ����, � 
                                            % ������� �������� ������ ������� ��������, 
                                            % � ���������� ������� �����������
                                            % ��������

if  multilaunch_flag == 1   % ���� ���� ���������� � 1, �� ���� ��������� ����� 
                            % ����������� ������� ���, ������� ������
    NumDirs = num_launches;
else
    NumDirs = 1;
end

t0 = 0; % ��������� ������ ������� [�]
tk = handles.dat_tk;%500;   % ������������ ����� ������������� [�]

t = t0:T:tk;    % ������ �������� ������� �������������
K = numel(t);   % ����� ��������� � �������

z1 = zeros(NumDirs,K); x1 = zeros(NumDirs,K);   % ������������� ��������, � ������� 
z2 = zeros(NumDirs,K); x2 = zeros(NumDirs,K);   % ����� ��������� ��������, �����������
K_stop_multilaunch = zeros(NumDirs);            % ��� ���������� ������ ������� ���������
flag_miss = zeros(1, NumDirs);                  % x, y - ���������� �� � ����, K_stop_... 
                                                % ������ �������� ������ ��������, �� �������
                                                % ������������� ���� �����������, flag_miss
                                                % ������ ���������� � ���, ���� �� ����������
                                                % ��������� ��������� �� ����� �������������

for angleViz = 1:NumDirs % ���� �������������. ������� ��� ��������� ����� ��� ���� ����� �����
%% (��)������������� ���� ����������, ������� ������������ ��� �������������    
    if NumDirs ~= 1 % ����� �������, � ������� ������������, ����� �� ������ ��������� ���� ����� 
                    % ��� ����� ��� ������ ����� �� ������������ ����������.

        if mod(NumDirs,2) == 0  % �����, � ������� ������������ ����� �������� ����� ����� (����� ��������
                                % ������ ������ �������, �� ����� ��� �������� ����� ����������� ����� 
                                % ��������� ���� �� ����� ����� �������� �� ���� Psi1 ������������ ����������
            psi_1_deg_0 = psi_1_deg_init + launch_angles/2 - launch_angles/NumDirs * (angleViz - 1);
        else
            psi_1_deg_0 = psi_1_deg_init + launch_angles/2 - launch_angles/(NumDirs - 1) * (angleViz - 1);
        end

    else
        psi_1_deg_0 = psi_1_deg_init;
    end

    flag_noimpact = 1; % ����, ����������� �� ��, ��� � ������ �������� ������� ��������� ��� �� ���������

    % ���������� ���������������� ��, ��� ������ �����
    z_1 = zeros(1,K); x_1 = zeros(1,K); V_1 = zeros(1,K); psi_1 = zeros(1,K); psi_1_deg = zeros(1,K); j_1prd = zeros(1,K); j_1ppr = zeros(1,K);
    z_2 = zeros(1,K); x_2 = zeros(1,K); V_2 = zeros(1,K); psi_2 = zeros(1,K); psi_2_deg = zeros(1,K); j_2prd = zeros(1,K); j_2ppr = zeros(1,K);
    V_2z = zeros(1,K); V_2x = zeros(1,K); a_2 = zeros(1,K); psi_a2 = zeros(1,K); psi_a2_deg = zeros(1,K); a_2z = zeros(1,K); a_2x = zeros(1,K);

    alpha = zeros(1,K); alpha_deg = zeros(1,K); phi_1 = zeros(1,K); phi_1_deg = zeros(1,K); phi_2 = zeros(1,K); phi_2_deg = zeros(1,K);
    D = zeros(1,K); w = zeros(1,K); w_deg = zeros(1,K); V_r = zeros(1,K); V_t = zeros(1,K); V_o = zeros(1,K); 
    h = zeros(1,K); phi_1_treb = zeros(1,K); w_treb = zeros(1,K);
    
    flag_stop = 0;
    K_stop = K;
    flag_plot = 0;
    D_0 = 0;
    flag_break = 0;
    S_h = zeros(1,K);   
    V_r_a = zeros(1,K); delta_V_r = zeros(1,K); D_a = zeros(1,K); delta_D = zeros(1,K);
    V_t_a = zeros(1,K); delta_V_t = zeros(1,K);
    w_a = zeros(1,K); delta_w = zeros(1,K);
    w_a_deg = zeros(1,K); delta_w_deg = zeros(1,K);
    
    
    z_1(1) = z_1_0; % ���������� z [�]. ����������� ������� �������� ������� �������� �� GUI
    x_1(1) = x_1_0; % ���������� x [�]. ����������� ������� �������� ������� �������� �� GUI
    
    V_1(1) =  V_1_0;    % �������� [�/�]. ����������� ������� �������� ������� �������� �� GUI
    
    psi_1_deg(1) = psi_1_deg_0; % ���� [����]
    psi_1(1) = psi_1_deg(:,1) *pi/180;  % ���� [���]
    
    j_1prd(1) = 0;  % ���������� ��������� [�/�^2]
    j_1ppr(1) = 0;  % ���������� ��������� [�/�^2]
    
    V_1z = V_1.*sin(psi_1); % �������� �������� �� ��� z [�/�]
    V_1x = V_1.*cos(psi_1); % �������� �������� �� ��� x [�/�]
    
    a_1 = sqrt(j_1prd.^2 + j_1ppr.^2);  % ��������� [�/�^2]
    
    psi_a1 = psi_1 + atan2(j_1ppr,j_1prd);  % ����������� ��������� [���]
    psi_a1 = ANGLE_CORRECT( psi_a1 );
    psi_a1_deg = psi_a1 *180/pi; % ����������� ��������� [����]
    
    a_1z = a_1.*sin(psi_a1); % �������� ��������� �� ��� z [�/�^2]
    a_1x = a_1.*cos(psi_a1); % �������� ��������� �� ��� x [�/�^2]
    
    
    z_2(1) = z_2_0; % ���������� z [�]. ����������� ������� �������� ������� �������� �� GUI
    x_2(1) = x_2_0; % ���������� x [�]. ����������� ������� �������� ������� �������� �� GUI
    
    V_2(1) = V_2_0;    % �������� [�/�]. ����������� ������� �������� ������� �������� �� GUI
    
    psi_2_deg(1) = psi_2_deg_0; % ���� [����]. ����������� ������� �������� ������� �������� �� GUI
    psi_2(1) = psi_2_deg(1) *pi/180;    % ���� [���]
    
    j_2prd(1) = 0;  % ���������� ��������� [�/�^2]
    j_2ppr(1) = 0;  % ���������� ��������� [�/�^2]
    
    
    V_2z(1) = V_2(1)*sin(psi_2(1)); % �������� �������� �� ��� z [�/�]
    V_2x(1) = V_2(1)*cos(psi_2(1)); % �������� �������� �� ��� x [�/�]
    
    a_2(1) = sqrt(j_2prd(1)^2 + j_2ppr(1)^2);   % ��������� [�/�^2]
    
    psi_a2(1) = psi_2(1) + atan2(j_2ppr(1),j_2prd(1));  % ����������� ��������� [���]
    psi_a2(1) = ANGLE_CORRECT( psi_a2(1) );
    psi_a2_deg(1) = psi_a2(1) *180/pi;  % ����������� ��������� [����]
    
    a_2z(1) = a_2(1)*sin(psi_a2(1));    % �������� ��������� �� ��� z [�/�^2]
    a_2x(1) = a_2(1)*cos(psi_a2(1));    % �������� ��������� �� ��� x [�/�^2]
    
    % ���������� ���������������� ������ �������� � ��������       
    alpha(1) = atan2((x_2(1) - x_1(1)),(z_2(1) - z_1(1)));
    alpha_deg(1) = alpha(1) *180/pi;
    
    phi_1(1) = pi/2 - psi_1(1) - alpha(1);
    phi_1(1) = ANGLE_CORRECT( phi_1(1) );
    phi_1_deg(1) = phi_1(1) *180/pi;
    
    phi_2(1) = pi/2 - psi_2(1) - alpha(1);
    phi_2(1) = ANGLE_CORRECT( phi_2(1) );
    phi_2_deg(1) = phi_2(1) *180/pi;
    
    D(1) = sqrt((z_2(1) - z_1(1))^2 + (x_2(1) - x_1(1))^2);
    
    w(1) = (V_1(1)*sin(phi_1(1)) - V_2(1)*sin(phi_2(1)))/D(1);
    w_deg(1) = w(1) *180/pi;
    
    V_r(1) = V_1(1)*cos(phi_1(1)) - V_2(1)*cos(phi_2(1));
    
    V_t(1) = V_1(1)*sin(phi_1(1)) - V_2(1)*sin(phi_2(1));
    
    V_o(1) = sqrt(V_r(1)^2 + V_t(1)^2);
    
    h(1) = D(1)^2*w(1)/V_o(1);
                
    V_r_a(1) = V_r(1);
    delta_V_r(1) = V_r(1) - V_r_a(1);
                
    D_a(1) = D(1);
    delta_D(1) = D(1) - D_a(1);
                
    V_t_a(1) = V_t(1);
    delta_V_t(1) = V_t(1) - V_t_a(1);
                
    w_a(1) = w(1);
    delta_w(1) = w(1) - w_a(1);
                
    w_a_deg(1) = w_a(1) *180/pi;
    delta_w_deg(1) = delta_w(1) *180/pi;         

    %% �������������� ����. ����� ���������� ������� ����������
    for k = 2:K
    
        if flag_stop == 0
                
            z_1(k) = z_1(k-1) + V_1z(k-1)*T + a_1z(k-1)*T^2/2;
            x_1(k) = x_1(k-1) + V_1x(k-1)*T + a_1x(k-1)*T^2/2;
                
            V_1(k) = V_1(k-1) + j_1prd(k-1)*T;
                
            psi_1(k) = psi_1(k-1) + j_1ppr(k-1)/V_1(k-1)*T;
            psi_1(k) = ANGLE_CORRECT( psi_1(k) );
            psi_1_deg(k) = psi_1(k) *180/pi;
    
            j_1ppr(k) = N_m3*V_r_a(k-1)*w_a(k-1);
    
            if sw_j_1ppr_gr == 1
                if j_1ppr(k) > j_1ppr_gr
                    j_1ppr(k) = j_1ppr_gr;
                end
                if j_1ppr(k) < - j_1ppr_gr
                    j_1ppr(k) = - j_1ppr_gr;
                end
             end            
                
                
             j_1prd(k) = 0;
                
             V_1z(k) = V_1z(k-1) + a_1z(k-1)*T;
             V_1x(k) = V_1x(k-1) + a_1x(k-1)*T;
                
             a_1(k) = sqrt(j_1prd(k)^2 + j_1ppr(k)^2);
                
             psi_a1(k) = psi_1(k) + atan2(j_1ppr(k),j_1prd(k));
             psi_a1(k) = ANGLE_CORRECT( psi_a1(k) );
             psi_a1_deg(k) = psi_a1(k) *180/pi;
                
             a_1z(k) = a_1(k)*sin(psi_a1(k));
             a_1x(k) = a_1(k)*cos(psi_a1(k));
                
        end
           
            
        if flag_stop == 0
                
            z_2(k) = z_2(k-1) + V_2z(k-1)*T + a_2z(k-1)*T^2/2;
            x_2(k) = x_2(k-1) + V_2x(k-1)*T + a_2x(k-1)*T^2/2;
            V_2(k) = V_2(k-1) + j_2prd(k-1)*T;
            psi_2(k) = psi_2(k-1) + j_2ppr(k-1)/V_2(k-1)*T;
            psi_2(k) = ANGLE_CORRECT( psi_2(k) );
            psi_2_deg(k) = psi_2(k) *180/pi;     
            j_2prd(k) = 0;
                
            switch sw_manevr_celi
                case 0
                    j_2ppr(k) = 0;
                case 1 
                    j_2ppr(k) = j_2ppr_m1;
                case 2
                    j_2ppr(k) = j_2ppr_m2*sin(2*pi*k*T/T_sin + pi/2);
            end
            
            V_2z(k) = V_2z(k-1) + a_2z(k-1)*T;
            V_2x(k) = V_2x(k-1) + a_2x(k-1)*T;
            a_2(k) = sqrt(j_2prd(k)^2 + j_2ppr(k)^2);
            psi_a2(k) = psi_2(k) + atan2(j_2ppr(k),j_2prd(k));
            psi_a2(k) = ANGLE_CORRECT( psi_a2(k) );
            psi_a2_deg(k) = psi_a2(k) *180/pi;
            a_2z(k) = a_2(k)*sin(psi_a2(k));
            a_2x(k) = a_2(k)*cos(psi_a2(k));                   
    
            alpha(k) = atan2((x_2(k) - x_1(k)),(z_2(k) - z_1(k)));
            alpha_deg(k) = alpha(k) *180/pi;
            phi_1(k) = pi/2 - psi_1(k) - alpha(k);
            phi_1(k) = ANGLE_CORRECT( phi_1(k) );
            phi_1_deg(k) = phi_1(k) *180/pi;
    
            phi_2(k) = pi/2 - psi_2(k) - alpha(k);
            phi_2(k) = ANGLE_CORRECT( phi_2(k) );
            phi_2_deg(k) = phi_2(k) *180/pi;
    
            D(k) = sqrt((z_2(k) - z_1(k))^2 + (x_2(k) - x_1(k))^2);
    
            w(k) = (V_1(k)*sin(phi_1(k)) - V_2(k)*sin(phi_2(k)))/D(k);
            w_deg(k) = w(k) *180/pi;
    
            V_r(k) = V_1(k)*cos(phi_1(k)) - V_2(k)*cos(phi_2(k));
    
            V_t(k) = V_1(k)*sin(phi_1(k)) - V_2(k)*sin(phi_2(k));
    
            V_o(k) = sqrt(V_r(k)^2 + V_t(k)^2);
    
            h(k) = D(k)^2*w(k)/V_o(k);
                        
            S_h(k) = S_h(k-1) + abs((h(k-1)+h(k))/2*T);
                        
            V_r_a(k) = V_r_a(k-1);
            delta_V_r(k) = V_r(k) - V_r_a(k);
                                    
            D_a(k) = D_a(k-1) - V_r_a(k-1)*T;
            delta_D(k) = D(k) - D_a(k);
                        
            V_t_a(k) = V_t_a(k-1) - j_1ppr(k-1)*T;
            delta_V_t(k) = V_t(k) - V_t_a(k);
                        
            w_a(k) = V_t_a(k)/D_a(k);
            delta_w(k) = w(k) - w_a(k);
                        
            w_a_deg(k) = w_a(k) *180/pi;
            delta_w_deg(k) = delta_w(k) *180/pi;
                        
            if D(k) < D_rk     
                if mod(k,K_rk) == 0          
                    V_r_a(k) = V_r(k);
                    delta_V_r(k) = V_r(k) - V_r_a(k);
    
                    D_a(k) = D(k);
                    delta_D(k) = D(k) - D_a(k);
    
                    V_t_a(k) = V_t(k);
                    delta_V_t(k) = V_t(k) - V_t_a(k);
    
                    w_a(k) = w(k);
                    delta_w(k) = w(k) - w_a(k);
    
                    w_a_deg(k) = w_a(k) *180/pi;
                    delta_w_deg(k) = delta_w(k) *180/pi;
                end                
            end
                        
            if D(k) < D_sn         
                V_r_a(k) = V_r(k);
                delta_V_r(k) = V_r(k) - V_r_a(k);
    
                D_a(k) = D(k);
                delta_D(k) = D(k) - D_a(k);
    
                V_t_a(k) = V_t(k);
                delta_V_t(k) = V_t(k) - V_t_a(k);
    
                w_a(k) = w(k);
                delta_w(k) = w(k) - w_a(k);
    
                w_a_deg(k) = w_a(k) *180/pi;
                delta_w_deg(k) = delta_w(k) *180/pi;           
            end
                
            if ( V_r(k) < 0 )&&( (V_r(k) - V_r(k-1)) < -10 )
                flag_stop  = 1;
                K_stop = k;
                flag_break = 1;
            else
                if ( D(k) <= D_por )
                    % flag_stop = 1;
                    K_stop = k;
                    flag_noimpact = 0;
                end
            end
        end
    end

    z1(angleViz,:) = z_1(1,:);
    x1(angleViz,:) = x_1(1,:);
    z2(angleViz,:) = z_2(1,:);
    x2(angleViz,:) = x_2(1,:);
    K_stop_multilaunch(angleViz) = K_stop;
    flag_miss(angleViz) = flag_noimpact;
end

f_Colours

% ������ ������� ��� ����������� ���������� �������
sw_graph = handles.dat3; % ����� ������� �� ������ ������ �� GUI
cla reset 
hold on
grid on
box on
axis fill
set(gca, 'FontSize', 12);

switch sw_graph
    case 1 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    1. ����������
        for Dir = 1:NumDirs
            z_1 = z1(Dir,:); x_1 = x1(Dir,:);
            z_2 = z2(Dir,:); x_2 = x2(Dir,:);
            K_stop = K_stop_multilaunch(Dir);
            flag_break = flag_miss(Dir);
            xlabel('Z, �'); ylabel('X, �');
            %-------------------------------------------------------------------------%
            %- ����� ����������� -----------------------------------------------------%
            %-------------------------------------------------------------------------%
            step_lv = t_linviz/T;   % ���������� ������ ����� �������� ��
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
        end
    
    case 2 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    2. ��������� �� �������
        set(gca, 'XLim', [ 0   tk ]);
        
        xlabel('t, �');
        ylabel('D, �');
        
        set(gca, 'ColorOrder', BlueDark);
        plot(t(1:K_stop(1)), D(1,1:K_stop(1)), '-', 'LineWidth', 1)
            
        if flag_stop(1) == 1
            if flag_break(1) == 1
                set(gca, 'ColorOrder', Red);
            else
                set(gca, 'ColorOrder', YellowOrange);
            end
            plot(t(K_stop(1)), D(1,K_stop(1)), '*', 'LineWidth', 10)
        end

    case 3 %%%%%%%%%%%%%%%%%%%%%%%%%%    3. ���������� ��������� �� �������
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
            if flag_break(1) == 1
                set(gca, 'ColorOrder', Red);
            else
            set(gca, 'ColorOrder', YellowOrange);
            end
            plot(t(K_stop(1)), j_1ppr(K_stop(1)), '*', 'LineWidth', 10)
        end

    case 4 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    4. �������� ������ �� �������
        set(gca, 'XLim', [ 0   tk ]);
        
        %-----------------------------------------
        Y_max = max(abs(h), [], 'all');
        set(gca, 'YLim', [-1.1*Y_max 1.1*Y_max]);
        %----------------------------------------
        xlabel('t, �');
        ylabel('h, �');
        
        plot(t, zeros(1,K), '--b', 'LineWidth', 1)
        
        set(gca, 'ColorOrder', BlueDark);
        plot(t(1:K_stop(1)), h(1,1:K_stop(1)), '-', 'LineWidth', 1)
            
        if flag_stop(1) == 1
            if flag_break(1) == 1
                set(gca, 'ColorOrder', Red);
            else
                set(gca, 'ColorOrder', YellowOrange);
            end
            plot(t(K_stop(1)), h(1,K_stop(1)), '*', 'LineWidth', 10)
        end

    case 5 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%    5. ������� ��� �������� �������
        set(gca, 'XLim', [ 0   tk ]);
        
        xlabel('t, �');
        ylabel('S_h, �*�');
        
        set(gca, 'ColorOrder', BlueDark);
        plot(t(1:K_stop(1)), S_h(1,1:K_stop(1)), '-', 'LineWidth', 1)
            
        if flag_stop(1) == 1
            if flag_break(1) == 1
                set(gca, 'ColorOrder', Red);
            else
                set(gca, 'ColorOrder', YellowOrange);
            end
            plot(t(K_stop(1)), S_h(1,K_stop(1)), '*', 'LineWidth', 10)
        end

    case 6 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    6. ������� �������� ��
        set(gca, 'XLim', [ 0   tk ]);
        
        xlabel('t, �');
        ylabel('\omega, ����');
        
        Y_max = max(abs(w_deg), [], 'all');
        set(gca, 'YLim', [-1.1*Y_max 1.1*Y_max]);
        
        set(gca, 'ColorOrder', Red);
        plot(t, zeros(1,K), '--b', 'LineWidth', 1)
    
        set(gca, 'ColorOrder', BlueDark);
        plot(t(1:K_stop(1)), w_deg(1,1:K_stop(1)), '-', 'LineWidth', 1)
        
        if flag_stop(1) == 1
            if flag_break(1) == 1
                set(gca, 'ColorOrder', Red);
            else
                set(gca, 'ColorOrder', YellowOrange);
            end
            plot(t(K_stop(1)), w_deg(1,K_stop(1)), '*', 'LineWidth', 10)
        end

    case 7 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    7. ��
        xlabel('t, �');
        ylabel('epsilon, ����');
        set(gca, 'ColorOrder', BlueDark);
        plot(t(1:K_stop(1)), alpha_deg(1:K_stop(1)), '-', 'LineWidth', 1)
        if flag_stop == 1
            set(gca, 'ColorOrder', YellowOrange);
            plot(t(K_stop(1)), alpha_deg(K_stop(1)), '*', 'LineWidth', 10)
        end
end

