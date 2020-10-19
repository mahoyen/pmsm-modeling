%% Motor data
nom_rpm = 3500;

%% Per Unit
V_b = 48; %V
I_b = 10; %A max current
Z_b = V_b/I_b;
w_b = nom_rpm*2*pi/60; % rad/s

%% References

w_r_ref = 10;

flux_ref = 0;

%% Speed Controller

kp_speed_gain = 1;

%% Flux Controller

kp_flux_gain = 1;

%% Flux Estimation

x_s_sigma = 1;
x_ad = 1;
x_aq = 1;

x_d = x_s_sigma + x_ad;
x_q = x_s_sigma + x_aq;

flux_m = 1;

%% Current Controller
T_sum = 1;
r_s = 1;
r_q = 1;

T_d = x_d/(w_b*r_s);
T_i_d = T_d;

T_1_q = x_q/(w_b*r_q); 
T_i_q = T_1_q;

K_p_denom = 2*w_b*T_sum;
K_p_d = x_d/K_p_denom;
K_p_q = x_q/K_p_denom;

K_pcd = K_p_d;
K_icd = 1;

K_pcq = K_p_q;
K_icq = 1;
