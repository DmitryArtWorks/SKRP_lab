%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% объект управления
z_1_0 =  handles.datz11 * 10^3;%50 *10^3;     % координата z [м]
x_1_0 = handles.datx11 * 10^3;%25 *10^3;     % координата x [м]

V_1_0 = handles.dat_V11;%400;          % скорость [м/с]

psi_1_deg_0 = handles.dat_psi11;%5;      % курс [град]


% цель
z_2_0 = handles.datz21 * 10^3;%70 *10^3;     % координата z [м]
x_2_0 = handles.datx21 * 10^3;%70 *10^3;     % координата x [м]

V_2_0 = handles.datV2;%200;          % скорость [м/с]

psi_2_deg_0 = handles.datpsi2;%75;     % курс [град]






D_rk = handles.dat_K_31* 10^3;%19 *10^3;     % дальность этапа радиокоррекции
T_rk = handles.dat_K_32;%10;           % период радиокоррекции

D_sn = handles.dat_K_1* 10^3;%5 *10^3;     % дальность самонаведения


sw_manevr_celi = handles.dat2;%2;  % маневр цели


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Lab_3_2
T = 0.1;
K_rk = T_rk/T;


sw_obup_1 = 1;
sw_obup_2 = 0;
sw_obup_3 = 0;
sw_obup_4 = 0;

sw_cel = 0;

% sw_manevr_celi = 0;     
                        j_2ppr_m1 = + 1.5;

                        T_sin = 120;
                        j_2ppr_m2 = - 10;


N_m3 = 3;

sw_j_1ppr_gr = 0;
                        j_1ppr_gr = 5;

sw_inerc = 0;
                        T_j = 10;

sw_stop = 1;

sw_linviz_1 = handles.dat09;
sw_linviz_2 = 0;
sw_linviz_3 = 0;
sw_linviz_4 = 0;


D_por = 30;

t_linviz = 10;



t0 = 0;
tk = handles.dat_tk;%500;

t = t0:T:tk;
K = numel(t);

C = [ sw_obup_1 sw_obup_2 sw_obup_3 sw_obup_4 ].*[ 1 2 3 4 ];
C(~C) = [];

for i = 1:1

z_1        = zeros(4,K);
x_1        = zeros(4,K);
V_1        = zeros(4,K);
psi_1      = zeros(4,K);
psi_1_deg  = zeros(4,K);
j_1prd     = zeros(4,K);
j_1ppr     = zeros(4,K);

V_1z       = zeros(4,K);
V_1x       = zeros(4,K);
a_1        = zeros(4,K);
psi_a1     = zeros(4,K);
psi_a1_deg = zeros(4,K);
a_1z       = zeros(4,K);
a_1x       = zeros(4,K);
 

z_2        = zeros(4,K);
x_2        = zeros(4,K);
V_2        = zeros(4,K);
psi_2      = zeros(4,K);
psi_2_deg  = zeros(4,K);
j_2prd     = zeros(4,K);
j_2ppr     = zeros(4,K);

V_2z       = zeros(4,K);
V_2x       = zeros(4,K);
a_2        = zeros(4,K);
psi_a2     = zeros(4,K);
psi_a2_deg = zeros(4,K);
a_2z       = zeros(4,K);
a_2x       = zeros(4,K);


alpha      = zeros(4,K);
alpha_deg  = zeros(4,K);
phi_1      = zeros(4,K);
phi_1_deg  = zeros(4,K);
phi_2      = zeros(4,K);
phi_2_deg  = zeros(4,K);
D          = zeros(4,K);
w          = zeros(4,K);
w_deg      = zeros(4,K);
V_r        = zeros(4,K);
V_t        = zeros(4,K);
V_o        = zeros(4,K);
h          = zeros(4,K);

phi_1_treb = zeros(4,K);
w_treb     = zeros(4,K);

flag_stop  =  zeros(4,1);
K_stop     = K*ones(4,1);

flag_plot  =  zeros(4,1);

D_0        =  zeros(4,1);

flag_break =  zeros(4,1);   %++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

S_h        =  zeros(4,1);   %++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


%--------------------------------------------------------------------------
V_r_a      =  zeros(4,1);
delta_V_r  =  zeros(4,1);

D_a        =  zeros(4,1);
delta_D    =  zeros(4,1);

V_t_a      =  zeros(4,1);
delta_V_t  =  zeros(4,1);

w_a      =  zeros(4,1);
delta_w  =  zeros(4,1);

w_a_deg     = zeros(4,1);
delta_w_deg = zeros(4,1);

end


z_1(:,1) = [  z_1_0     z_1_0    100*10^3    150*10^3 ];    % координата z [м]
x_1(:,1) = [  x_1_0     x_1_0    110*10^3     60*10^3 ];    % координата x [м]

V_1(:,1) =       [ V_1_0    V_1_0    400    400 ];    % скорость [м/с]

psi_1_deg(:,1) = [  psi_1_deg_0      psi_1_deg_0      0      0 ];    % курс [град]
psi_1(:,1) = psi_1_deg(:,1) *pi/180;              % курс [рад]

j_1prd(:,1) =    [   0      0      0      0 ];    % продольное ускорение [м/с^2]
j_1ppr(:,1) =    [   0      0      0      0 ];    % поперечное ускорение [м/с^2]

for j = C

    V_1z(j,1) = V_1(j,1)*sin(psi_1(j,1));                          % проекция скорости на ось z [м/с]
    V_1x(j,1) = V_1(j,1)*cos(psi_1(j,1));                          % проекция скорости на ось x [м/с]
	
    a_1(j,1) = sqrt(j_1prd(j,1)^2 + j_1ppr(j,1)^2);                % ускорение [м/с^2]

    psi_a1(j,1)     = psi_1(j,1) + atan2(j_1ppr(j,1),j_1prd(j,1)); % направление ускорения [рад]
    psi_a1(j,1)     = ANGLE_CORRECT( psi_a1(j,1) );
    psi_a1_deg(j,1) = psi_a1(j,1) *180/pi;                         % направление ускорения [град]

    a_1z(j,1) = a_1(j,1)*sin(psi_a1(j,1));                         % проекция ускорения на ось z [м/с^2]
    a_1x(j,1) = a_1(j,1)*cos(psi_a1(j,1));                         % проекция ускорения на ось x [м/с^2]

end

z_2(:,1) = [  z_2_0     80*10^3     80*10^3    140*10^3 ];
x_2(:,1) = [  x_2_0     80*10^3     20*10^3     40*10^3 ];

V_2(:,1) =       [ V_2_0    200    200    200 ];    % скорость [м/с]

psi_2_deg(:,1) = [  psi_2_deg_0     70     70     70 ];    % курс [град]
psi_2(:,1) = psi_2_deg(:,1) *pi/180;              % курс [рад]

j_2prd(:,1) =    [   0      0      0      0 ];    % продольное ускорение [м/с^2]
j_2ppr(:,1) =    [   0      0      0      0 ];    % поперечное ускорение [м/с^2]

switch sw_cel
    case 0
        
        V_2z(1,1) = V_2(1,1)*sin(psi_2(1,1));                          % проекция скорости на ось z [м/с]
        V_2x(1,1) = V_2(1,1)*cos(psi_2(1,1));                          % проекция скорости на ось x [м/с]

        a_2(1,1) = sqrt(j_2prd(1,1)^2 + j_2ppr(1,1)^2);                % ускорение [м/с^2]

        psi_a2(1,1)     = psi_2(1,1) + atan2(j_2ppr(1,1),j_2prd(1,1)); % направление ускорения [рад]
        psi_a2(1,1)     = ANGLE_CORRECT( psi_a2(1,1) );
        psi_a2_deg(1,1) = psi_a2(1,1) *180/pi;                         % направление ускорения [град]

        a_2z(1,1) = a_2(1,1)*sin(psi_a2(1,1));                         % проекция ускорения на ось z [м/с^2]
        a_2x(1,1) = a_2(1,1)*cos(psi_a2(1,1));                         % проекция ускорения на ось x [м/с^2]
    
    case 1
        
        for j = C

            V_2z(j,1) = V_2(j,1)*sin(psi_2(j,1));                          % проекция скорости на ось z [м/с]
            V_2x(j,1) = V_2(j,1)*cos(psi_2(j,1));                          % проекция скорости на ось x [м/с]

            a_2(j,1) = sqrt(j_2prd(j,1)^2 + j_2ppr(j,1)^2);                % ускорение [м/с^2]

            psi_a2(j,1)     = psi_2(j,1) + atan2(j_2ppr(j,1),j_2prd(j,1)); % направление ускорения [рад]
            psi_a2(j,1)     = ANGLE_CORRECT( psi_a2(j,1) );
            psi_a2_deg(j,1) = psi_a2(j,1) *180/pi;                         % направление ускорения [град]

            a_2z(j,1) = a_2(j,1)*sin(psi_a2(j,1));                         % проекция ускорения на ось z [м/с^2]
            a_2x(j,1) = a_2(j,1)*cos(psi_a2(j,1));                         % проекция ускорения на ось x [м/с^2]

        end
end

switch sw_cel
    case 0
        
        for j = C
            
            alpha(j,1)     = atan2((x_2(1,1) - x_1(j,1)),(z_2(1,1) - z_1(j,1)));
            alpha_deg(j,1) = alpha(j,1) *180/pi;

            phi_1(j,1)     = pi/2 - psi_1(j,1) - alpha(j,1);
            phi_1(j,1)     = ANGLE_CORRECT( phi_1(j,1) );
            phi_1_deg(j,1) = phi_1(j,1) *180/pi;

            phi_2(j,1)     = pi/2 - psi_2(1,1) - alpha(j,1);
            phi_2(j,1)     = ANGLE_CORRECT( phi_2(j,1) );
            phi_2_deg(j,1) = phi_2(j,1) *180/pi;

            D(j,1) = sqrt((z_2(1,1) - z_1(j,1))^2 + (x_2(1,1) - x_1(j,1))^2);

            w(j,1) = (V_1(j,1)*sin(phi_1(j,1)) - V_2(1,1)*sin(phi_2(j,1)))/D(j,1);
            w_deg(j,1) = w(j,1) *180/pi;

            V_r(j,1) = V_1(j,1)*cos(phi_1(j,1)) - V_2(1,1)*cos(phi_2(j,1));

            V_t(j,1) = V_1(j,1)*sin(phi_1(j,1)) - V_2(1,1)*sin(phi_2(j,1));

            V_o(j,1) = sqrt(V_r(j,1)^2 + V_t(j,1)^2);

%             h(j,1) = D(j,1)^2*abs(w(j,1))/V_o(j,1);
            h(j,1) = D(j,1)^2*w(j,1)/V_o(j,1);
            
            %--------------------------------------------------------------
            V_r_a(j,1) = V_r(j,1);
            delta_V_r(j,1) = V_r(j,1) - V_r_a(j,1);
            
            D_a(j,1) = D(j,1);
            delta_D(j,1) = D(j,1) - D_a(j,1);
            
            V_t_a(j,1) = V_t(j,1);
            delta_V_t(j,1) = V_t(j,1) - V_t_a(j,1);
            
            w_a(j,1) = w(j,1);
            delta_w(j,1) = w(j,1) - w_a(j,1);
            
            w_a_deg(j,1) = w_a(j,1) *180/pi;
            delta_w_deg(j,1) = delta_w(j,1) *180/pi;
            
        end

    case 1
        
        for j = C

            alpha(j,1)     = atan2((x_2(j,1) - x_1(j,1)),(z_2(j,1) - z_1(j,1)));
            alpha_deg(j,1) = alpha(j,1) *180/pi;

            phi_1(j,1)     = pi/2 - psi_1(j,1) - alpha(j,1);
            phi_1(j,1)     = ANGLE_CORRECT( phi_1(j,1) );
            phi_1_deg(j,1) = phi_1(j,1) *180/pi;

            phi_2(j,1)     = pi/2 - psi_2(j,1) - alpha(j,1);
            phi_2(j,1)     = ANGLE_CORRECT( phi_2(j,1) );
            phi_2_deg(j,1) = phi_2(j,1) *180/pi;

            D(j,1) = sqrt((z_2(j,1) - z_1(j,1))^2 + (x_2(j,1) - x_1(j,1))^2);

            w(j,1) = (V_1(j,1)*sin(phi_1(j,1)) - V_2(j,1)*sin(phi_2(j,1)))/D(j,1);
            w_deg(j,1) = w(j,1) *180/pi;

            V_r(j,1) = V_1(j,1)*cos(phi_1(j,1)) - V_2(j,1)*cos(phi_2(j,1));

            V_t(j,1) = V_1(j,1)*sin(phi_1(j,1)) - V_2(j,1)*sin(phi_2(j,1));

            V_o(j,1) = sqrt(V_r(j,1)^2 + V_t(j,1)^2);

%             h(j,1) = D(j,1)^2*abs(w(j,1))/V_o(j,1);
            h(j,1) = D(j,1)^2*w(j,1)/V_o(j,1);
            
            %--------------------------------------------------------------
            V_r_a(j,1) = V_r(j,1);
            delta_V_r(j,1) = V_r(j,1) - V_r_a(j,1);
            
            
            D_a(j,1) = D(j,1);
            delta_D(j,1) = D(j,1) - D_a(j,1);
            
            V_t_a(j,1) = V_t(j,1);
            delta_V_t(j,1) = V_t(j,1) - V_t_a(j,1);
            
            w_a(j,1) = w(j,1);
            delta_w(j,1) = w(j,1) - w_a(j,1);
            
            w_a_deg(j,1) = w_a(j,1) *180/pi;
            delta_w_deg(j,1) = delta_w(j,1) *180/pi;

        end
end


for k = 2:K
    
    for j = C
        
        if flag_stop(j) == 0
            
            z_1(j,k) = z_1(j,k-1) + V_1z(j,k-1)*T + a_1z(j,k-1)*T^2/2;
            x_1(j,k) = x_1(j,k-1) + V_1x(j,k-1)*T + a_1x(j,k-1)*T^2/2;
            
            V_1(j,k) = V_1(j,k-1) + j_1prd(j,k-1)*T;
            
            psi_1(j,k)     = psi_1(j,k-1) + j_1ppr(j,k-1)/V_1(j,k-1)*T;
            psi_1(j,k)     = ANGLE_CORRECT( psi_1(j,k) );
            psi_1_deg(j,k) = psi_1(j,k) *180/pi;
            
            
            if j == 1
                j_1ppr(j,k) = N_m3*V_r_a(j,k-1)*w_a(j,k-1);
            else
                j_1ppr(j,k) = N_m3*V_r(j,k-1)*w(j,k-1);
            end
            
            
            
            if sw_j_1ppr_gr == 1
                if j_1ppr(j,k) > j_1ppr_gr
                    j_1ppr(j,k) = j_1ppr_gr;
                end
                if j_1ppr(j,k) < - j_1ppr_gr
                    j_1ppr(j,k) = - j_1ppr_gr;
                end
            end
            
            
            if sw_inerc == 1

%                 j_1ppr(j,k) = T/T_j*j_1ppr(j,k) + (1 - T/T_j)*j_1ppr(j,k-1);
                j_1ppr(j,k) = T/(T_j + T)*j_1ppr(j,k) + T_j/(T_j + T)*j_1ppr(j,k-1);
                
            end
            
            
            
            j_1prd(j,k) = 0;
            
            V_1z(j,k) = V_1z(j,k-1) + a_1z(j,k-1)*T;
            V_1x(j,k) = V_1x(j,k-1) + a_1x(j,k-1)*T;
            
            a_1(j,k) = sqrt(j_1prd(j,k)^2 + j_1ppr(j,k)^2);
            
            psi_a1(j,k)     = psi_1(j,k) + atan2(j_1ppr(j,k),j_1prd(j,k));
            psi_a1(j,k)     = ANGLE_CORRECT( psi_a1(j,k) );
            psi_a1_deg(j,k) = psi_a1(j,k) *180/pi;
            
            a_1z(j,k) = a_1(j,k)*sin(psi_a1(j,k));
            a_1x(j,k) = a_1(j,k)*cos(psi_a1(j,k));
            
        end
    end
    
    %----------------------------------------------------------------------
    
    switch sw_cel
        
        case 0
            
            z_2(1,k) = z_2(1,k-1) + V_2z(1,k-1)*T + a_2z(1,k-1)*T^2/2;
            x_2(1,k) = x_2(1,k-1) + V_2x(1,k-1)*T + a_2x(1,k-1)*T^2/2;

            V_2(1,k) = V_2(1,k-1) + j_2prd(1,k-1)*T;

            psi_2(1,k)     = psi_2(1,k-1) + j_2ppr(1,k-1)/V_2(1,k-1)*T;
            psi_2(1,k)     = ANGLE_CORRECT( psi_2(1,k) );
            psi_2_deg(1,k) = psi_2(1,k) *180/pi;
            
            j_2prd(1,k) = 0;

            switch sw_manevr_celi
                case 0
                    j_2ppr(1,k) = 0;
                case 1 
                    j_2ppr(1,k) = j_2ppr_m1;
                case 2
                    j_2ppr(1,k) = j_2ppr_m2*sin(2*pi*k*T/T_sin + pi/2);
            end
    
            V_2z(1,k) = V_2z(1,k-1) + a_2z(1,k-1)*T;
            V_2x(1,k) = V_2x(1,k-1) + a_2x(1,k-1)*T;

            a_2(1,k) = sqrt(j_2prd(1,k)^2 + j_2ppr(1,k)^2);

            psi_a2(1,k)     = psi_2(1,k) + atan2(j_2ppr(1,k),j_2prd(1,k));
            psi_a2(1,k)     = ANGLE_CORRECT( psi_a2(1,k) );
            psi_a2_deg(1,k) = psi_a2(1,k) *180/pi;

            a_2z(1,k) = a_2(1,k)*sin(psi_a2(1,k));
            a_2x(1,k) = a_2(1,k)*cos(psi_a2(1,k));
            
        case 1
            
            for j = C

                z_2(j,k) = z_2(j,k-1) + V_2z(j,k-1)*T + a_2z(j,k-1)*T^2/2;
                x_2(j,k) = x_2(j,k-1) + V_2x(j,k-1)*T + a_2x(j,k-1)*T^2/2;

                V_2(j,k) = V_2(j,k-1) + j_2prd(j,k-1)*T;

                psi_2(j,k)     = psi_2(j,k-1) + j_2ppr(j,k-1)/V_2(j,k-1)*T;
                psi_2(j,k)     = ANGLE_CORRECT( psi_2(j,k) );
                psi_2_deg(j,k) = psi_2(j,k) *180/pi;

                j_2prd(j,k) = 0;

            switch sw_manevr_celi
                case 0
                    j_2ppr(j,k) = 0;
                case 1 
                    j_2ppr(j,k) = j_2ppr_m1;
                case 2
                    j_2ppr(j,k) = j_2ppr_m2*sin(2*pi*k*T/T_sin + pi/2);
            end

                V_2z(j,k) = V_2z(j,k-1) + a_2z(j,k-1)*T;
                V_2x(j,k) = V_2x(j,k-1) + a_2x(j,k-1)*T;

                a_2(j,k) = sqrt(j_2prd(j,k)^2 + j_2ppr(j,k)^2);

                psi_a2(j,k)     = psi_2(j,k) + atan2(j_2ppr(j,k),j_2prd(j,k));
                psi_a2(j,k)     = ANGLE_CORRECT( psi_a2(j,k) );
                psi_a2_deg(j,k) = psi_a2(j,k) *180/pi;

                a_2z(j,k) = a_2(j,k)*sin(psi_a2(j,k));
                a_2x(j,k) = a_2(j,k)*cos(psi_a2(j,k));

            end
            
    end
    
    %----------------------------------------------------------------------
    
    for j = C
        
        if flag_stop(j) == 0
            
            switch sw_cel
        
                case 0

                    alpha(j,k)     = atan2((x_2(1,k) - x_1(j,k)),(z_2(1,k) - z_1(j,k)));
                    alpha_deg(j,k) = alpha(j,k) *180/pi;

                    phi_1(j,k)     = pi/2 - psi_1(j,k) - alpha(j,k);
                    phi_1(j,k)     = ANGLE_CORRECT( phi_1(j,k) );
                    phi_1_deg(j,k) = phi_1(j,k) *180/pi;

                    phi_2(j,k)     = pi/2 - psi_2(1,k) - alpha(j,k);
                    phi_2(j,k)     = ANGLE_CORRECT( phi_2(j,k) );
                    phi_2_deg(j,k) = phi_2(j,k) *180/pi;

                    D(j,k) = sqrt((z_2(1,k) - z_1(j,k))^2 + (x_2(1,k) - x_1(j,k))^2);

                    w(j,k)     = (V_1(j,k)*sin(phi_1(j,k)) - V_2(1,k)*sin(phi_2(j,k)))/D(j,k);
                    w_deg(j,k) = w(j,k) *180/pi;

                    V_r(j,k) = V_1(j,k)*cos(phi_1(j,k)) - V_2(1,k)*cos(phi_2(j,k));

                    V_t(j,k) = V_1(j,k)*sin(phi_1(j,k)) - V_2(1,k)*sin(phi_2(j,k));

                    V_o(j,k) = sqrt(V_r(j,k)^2 + V_t(j,k)^2);

%                     h(j,k) = D(j,k)^2*abs(w(j,k))/V_o(j,k);
                    h(j,k) = D(j,k)^2*w(j,k)/V_o(j,k);
                    
                    
                    S_h(j,k) = S_h(j,k-1) + abs((h(j,k-1)+h(j,k))/2*T);    % +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
                    
                    
                    %--------------------------------------------------------------
                    V_r_a(j,k) = V_r_a(j,k-1);
                    delta_V_r(j,k) = V_r(j,k) - V_r_a(j,k);
                    
                    
                    D_a(j,k) = D_a(j,k-1) - V_r_a(j,k-1)*T;
                    delta_D(j,k) = D(j,k) - D_a(j,k);
                    
                    V_t_a(j,k) = V_t_a(j,k-1) - j_1ppr(j,k-1)*T;
                    delta_V_t(j,k) = V_t(j,k) - V_t_a(j,k);
                    
                    w_a(j,k) = V_t_a(j,k)/D_a(j,k);
                    delta_w(j,k) = w(j,k) - w_a(j,k);
                    
                    w_a_deg(j,k) = w_a(j,k) *180/pi;
                    delta_w_deg(j,k) = delta_w(j,k) *180/pi;
                    
                    if D(j,k) < D_rk
                        
                        if mod(k,K_rk) == 0
                            
                            V_r_a(j,k) = V_r(j,k);
                            delta_V_r(j,k) = V_r(j,k) - V_r_a(j,k);

                            D_a(j,k) = D(j,k);
                            delta_D(j,k) = D(j,k) - D_a(j,k);

                            V_t_a(j,k) = V_t(j,k);
                            delta_V_t(j,k) = V_t(j,k) - V_t_a(j,k);

                            w_a(j,k) = w(j,k);
                            delta_w(j,k) = w(j,k) - w_a(j,k);

                            w_a_deg(j,k) = w_a(j,k) *180/pi;
                            delta_w_deg(j,k) = delta_w(j,k) *180/pi;
                        
                        end
                        
                    end
                    
                    if D(j,k) < D_sn
                        
                        V_r_a(j,k) = V_r(j,k);
                        delta_V_r(j,k) = V_r(j,k) - V_r_a(j,k);

                        D_a(j,k) = D(j,k);
                        delta_D(j,k) = D(j,k) - D_a(j,k);

                        V_t_a(j,k) = V_t(j,k);
                        delta_V_t(j,k) = V_t(j,k) - V_t_a(j,k);

                        w_a(j,k) = w(j,k);
                        delta_w(j,k) = w(j,k) - w_a(j,k);

                        w_a_deg(j,k) = w_a(j,k) *180/pi;
                        delta_w_deg(j,k) = delta_w(j,k) *180/pi;
                        
                    end
        
                case 1
                    
                    alpha(j,k)     = atan2((x_2(j,k) - x_1(j,k)),(z_2(j,k) - z_1(j,k)));
                    alpha_deg(j,k) = alpha(j,k) *180/pi;

                    phi_1(j,k)     = pi/2 - psi_1(j,k) - alpha(j,k);
                    phi_1(j,k)     = ANGLE_CORRECT( phi_1(j,k) );
                    phi_1_deg(j,k) = phi_1(j,k) *180/pi;

                    phi_2(j,k)     = pi/2 - psi_2(j,k) - alpha(j,k);
                    phi_2(j,k)     = ANGLE_CORRECT( phi_2(j,k) );
                    phi_2_deg(j,k) = phi_2(j,k) *180/pi;

                    D(j,k) = sqrt((z_2(j,k) - z_1(j,k))^2 + (x_2(j,k) - x_1(j,k))^2);

                    w(j,k)     = (V_1(j,k)*sin(phi_1(j,k)) - V_2(j,k)*sin(phi_2(j,k)))/D(j,k);
                    w_deg(j,k) = w(j,k) *180/pi;

                    V_r(j,k) = V_1(j,k)*cos(phi_1(j,k)) - V_2(j,k)*cos(phi_2(j,k));

                    V_t(j,k) = V_1(j,k)*sin(phi_1(j,k)) - V_2(j,k)*sin(phi_2(j,k));

                    V_o(j,k) = sqrt(V_r(j,k)^2 + V_t(j,k)^2);

%                     h(j,k) = D(j,k)^2*abs(w(j,k))/V_o(j,k);
                    h(j,k) = D(j,k)^2*w(j,k)/V_o(j,k);
                    
                    
                    S_h(j,k) = S_h(j,k-1) + abs((h(j,k-1)+h(j,k))/2*T);    % +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
                    
                    
                    %--------------------------------------------------------------
                    V_r_a(j,k) = V_r_a(j,k-1);
                    delta_V_r(j,k) = V_r(j,k) - V_r_a(j,k);
                    
                    
                    D_a(j,k) = D_a(j,k-1) - V_r_a(j,k-1)*T;
                    delta_D(j,k) = D(j,k) - D_a(j,k);
                    
                    V_t_a(j,k) = V_t_a(j,k-1) - j_1ppr(j,k-1)*T;
                    delta_V_t(j,k) = V_t(j,k) - V_t_a(j,k);
                    
                    w_a(j,k) = V_t_a(j,k)/D_a(j,k);
                    delta_w(j,k) = w(j,k) - w_a(j,k);
                    
                    w_a_deg(j,k) = w_a(j,k) *180/pi;
                    delta_w_deg(j,k) = delta_w(j,k) *180/pi;
                    
                    if D(j,k) < D_rk
                        
                        if mod(k,K_rk) == 0
                            
                            V_r_a(j,k) = V_r(j,k);
                            delta_V_r(j,k) = V_r(j,k) - V_r_a(j,k);

                            D_a(j,k) = D(j,k);
                            delta_D(j,k) = D(j,k) - D_a(j,k);

                            V_t_a(j,k) = V_t(j,k);
                            delta_V_t(j,k) = V_t(j,k) - V_t_a(j,k);

                            w_a(j,k) = w(j,k);
                            delta_w(j,k) = w(j,k) - w_a(j,k);

                            w_a_deg(j,k) = w_a(j,k) *180/pi;
                            delta_w_deg(j,k) = delta_w(j,k) *180/pi;
                        
                        end
                        
                    end
                    
                    if D(j,k) < D_sn
                        
                        V_r_a(j,k) = V_r(j,k);
                        delta_V_r(j,k) = V_r(j,k) - V_r_a(j,k);

                        D_a(j,k) = D(j,k);
                        delta_D(j,k) = D(j,k) - D_a(j,k);

                        V_t_a(j,k) = V_t(j,k);
                        delta_V_t(j,k) = V_t(j,k) - V_t_a(j,k);

                        w_a(j,k) = w(j,k);
                        delta_w(j,k) = w(j,k) - w_a(j,k);

                        w_a_deg(j,k) = w_a(j,k) *180/pi;
                        delta_w_deg(j,k) = delta_w(j,k) *180/pi;
                        
                    end
                
            end
                
                
            
            if sw_stop == 1
                if ( V_r(j,k) < 0 )&&( (V_r(j,k) - V_r(j,k-1)) < -10 ) % +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
%                 if ( V_r(j,k) > 1000000 )
                    flag_stop(j) = 1;
                    K_stop(j)    = k;
                    flag_break(j) = 1;
                else
                    if ( D(j,k) <= D_por )
                        flag_stop(j) = 1;
                        K_stop(j)    = k;
                    end
                end
            end
        end
    end
end

%toc

f_Colours

% положение и размер окна
% L_left   = 200 - 1920 ;
L_left   = 200  ;
L_bottom = 50   ;
L_width  = 1500 ;
L_height = 900  ;
% L_width  = 800;
% L_height = 600;

        
        

% graph_001_traektorii_fg
sw_obup_2 = 0;
% graph_002_D
% 
% graph_003_j_ppr
% 
% graph_004_h
% 
% 
% 
% graph__01_delta_V_r
% 
% graph__02_delta_D
% 
% graph__03_delta_V_t
% 
% graph__04_delta_w
sw_graph = handles.dat3;
switch sw_graph
    case 1
        graph_001_traektorii_fg
    case 2
        graph_002_D
    case 3
        graph_003_j_ppr
    case 4
        graph_004_h
    case 5
        graph_005_S_h_fg
    case 6 
        graph_006_w_fg
    case 7 
        graph_007_Alpha_fg
end
%toc

