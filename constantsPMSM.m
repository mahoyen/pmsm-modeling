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

K_pcd = 1;
K_icd = 1;

K_pcq = 1;
K_icq = 1;
