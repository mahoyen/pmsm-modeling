%% Conversion numbers
rpm2radps = 2*pi/60;

%% Motor data
nom_rpm = 3500; %rpm
nom_torque = 3.3; %Nm
nom_efficiency = 0.926;
voltage_constant = 8.5/1000; %V/rpm
torque_constant = 0.09; %Nm/A
stator_inductance = 4/1000000; %H
stator_resistance = 35/1000; %Ohm

%% Derived motor data

nom_power = (nom_rpm * rpm2radps * nom_torque);
nom_elec_power = nom_power / nom_efficiency;
nom_current = nom_elec_power/torque_constant;
nom_voltage = voltage_constant * nom_rpm;
pm_psi = nom_voltage/nom_rpm;

%% Missing Motor data
n_pole_pairs = 4;
inertia = 0.0027; % kgm^2
viscous_damping = 4.924e-4; % Nm/rad/s
static_friction = 0; % Nm

%% Per Unit
V_b = sqrt(2)/sqrt(3) * nom_voltage; % Base Voltage
I_b = sqrt(2) * nom_current; % base Current
S_b = 3/2 * V_b * I_b; % Apparant Base Power
Z_b = V_b/I_b; % base impediance
w_b = nom_rpm*2*pi/60; % base angular speed
psi_b = V_b/w_b;

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
