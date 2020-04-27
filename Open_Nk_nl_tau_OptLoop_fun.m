%
% Status : main Dynare file
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

if isoctave || matlab_ver_less_than('8.6')
    clear all
else
    clearvars -global
    clear_persistent_variables(fileparts(which('dynare')), false)
end
tic0 = tic;
% Save empty dates and dseries objects in memory.
dates('initialize');
dseries('initialize');
% Define global variables.
global M_ options_ oo_ estim_params_ bayestopt_ dataset_ dataset_info estimation_info ys0_ ex0_
options_ = [];
M_.fname = 'Open_Nk_nl_tau_OptLoop_fun';
M_.dynare_version = '4.5.7';
oo_.dynare_version = '4.5.7';
options_.dynare_version = '4.5.7';
%
% Some global variables initialization
%
global_initialization;
diary off;
diary('Open_Nk_nl_tau_OptLoop_fun.log');
M_.exo_names = 'e_a';
M_.exo_names_tex = 'e\_a';
M_.exo_names_long = 'e_a';
M_.endo_names = 'C';
M_.endo_names_tex = 'C';
M_.endo_names_long = 'C';
M_.endo_names = char(M_.endo_names, 'C_star');
M_.endo_names_tex = char(M_.endo_names_tex, 'C\_star');
M_.endo_names_long = char(M_.endo_names_long, 'C_star');
M_.endo_names = char(M_.endo_names, 'V');
M_.endo_names_tex = char(M_.endo_names_tex, 'V');
M_.endo_names_long = char(M_.endo_names_long, 'V');
M_.endo_names = char(M_.endo_names, 'V_star');
M_.endo_names_tex = char(M_.endo_names_tex, 'V\_star');
M_.endo_names_long = char(M_.endo_names_long, 'V_star');
M_.endo_names = char(M_.endo_names, 'N');
M_.endo_names_tex = char(M_.endo_names_tex, 'N');
M_.endo_names_long = char(M_.endo_names_long, 'N');
M_.endo_names = char(M_.endo_names, 'N_star');
M_.endo_names_tex = char(M_.endo_names_tex, 'N\_star');
M_.endo_names_long = char(M_.endo_names_long, 'N_star');
M_.endo_names = char(M_.endo_names, 'Pi_H');
M_.endo_names_tex = char(M_.endo_names_tex, 'Pi\_H');
M_.endo_names_long = char(M_.endo_names_long, 'Pi_H');
M_.endo_names = char(M_.endo_names, 'Pi_F_star');
M_.endo_names_tex = char(M_.endo_names_tex, 'Pi\_F\_star');
M_.endo_names_long = char(M_.endo_names_long, 'Pi_F_star');
M_.endo_names = char(M_.endo_names, 'Pi_new');
M_.endo_names_tex = char(M_.endo_names_tex, 'Pi\_new');
M_.endo_names_long = char(M_.endo_names_long, 'Pi_new');
M_.endo_names = char(M_.endo_names, 'Pi_new_star');
M_.endo_names_tex = char(M_.endo_names_tex, 'Pi\_new\_star');
M_.endo_names_long = char(M_.endo_names_long, 'Pi_new_star');
M_.endo_names = char(M_.endo_names, 'R');
M_.endo_names_tex = char(M_.endo_names_tex, 'R');
M_.endo_names_long = char(M_.endo_names_long, 'R');
M_.endo_names = char(M_.endo_names, 'R_star');
M_.endo_names_tex = char(M_.endo_names_tex, 'R\_star');
M_.endo_names_long = char(M_.endo_names_long, 'R_star');
M_.endo_names = char(M_.endo_names, 'r');
M_.endo_names_tex = char(M_.endo_names_tex, 'r');
M_.endo_names_long = char(M_.endo_names_long, 'r');
M_.endo_names = char(M_.endo_names, 'r_star');
M_.endo_names_tex = char(M_.endo_names_tex, 'r\_star');
M_.endo_names_long = char(M_.endo_names_long, 'r_star');
M_.endo_names = char(M_.endo_names, 'W');
M_.endo_names_tex = char(M_.endo_names_tex, 'W');
M_.endo_names_long = char(M_.endo_names_long, 'W');
M_.endo_names = char(M_.endo_names, 'W_star');
M_.endo_names_tex = char(M_.endo_names_tex, 'W\_star');
M_.endo_names_long = char(M_.endo_names_long, 'W_star');
M_.endo_names = char(M_.endo_names, 'X1');
M_.endo_names_tex = char(M_.endo_names_tex, 'X1');
M_.endo_names_long = char(M_.endo_names_long, 'X1');
M_.endo_names = char(M_.endo_names, 'X2');
M_.endo_names_tex = char(M_.endo_names_tex, 'X2');
M_.endo_names_long = char(M_.endo_names_long, 'X2');
M_.endo_names = char(M_.endo_names, 'X1_star');
M_.endo_names_tex = char(M_.endo_names_tex, 'X1\_star');
M_.endo_names_long = char(M_.endo_names_long, 'X1_star');
M_.endo_names = char(M_.endo_names, 'X2_star');
M_.endo_names_tex = char(M_.endo_names_tex, 'X2\_star');
M_.endo_names_long = char(M_.endo_names_long, 'X2_star');
M_.endo_names = char(M_.endo_names, 'Y');
M_.endo_names_tex = char(M_.endo_names_tex, 'Y');
M_.endo_names_long = char(M_.endo_names_long, 'Y');
M_.endo_names = char(M_.endo_names, 'Y_star');
M_.endo_names_tex = char(M_.endo_names_tex, 'Y\_star');
M_.endo_names_long = char(M_.endo_names_long, 'Y_star');
M_.endo_names = char(M_.endo_names, 'Tau');
M_.endo_names_tex = char(M_.endo_names_tex, 'Tau');
M_.endo_names_long = char(M_.endo_names_long, 'Tau');
M_.endo_names = char(M_.endo_names, 'Tau_star');
M_.endo_names_tex = char(M_.endo_names_tex, 'Tau\_star');
M_.endo_names_long = char(M_.endo_names_long, 'Tau_star');
M_.endo_names = char(M_.endo_names, 'G');
M_.endo_names_tex = char(M_.endo_names_tex, 'G');
M_.endo_names_long = char(M_.endo_names_long, 'G');
M_.endo_names = char(M_.endo_names, 'G_star');
M_.endo_names_tex = char(M_.endo_names_tex, 'G\_star');
M_.endo_names_long = char(M_.endo_names_long, 'G_star');
M_.endo_names = char(M_.endo_names, 'D_norm');
M_.endo_names_tex = char(M_.endo_names_tex, 'D\_norm');
M_.endo_names_long = char(M_.endo_names_long, 'D_norm');
M_.endo_names = char(M_.endo_names, 'D_norm_star');
M_.endo_names_tex = char(M_.endo_names_tex, 'D\_norm\_star');
M_.endo_names_long = char(M_.endo_names_long, 'D_norm_star');
M_.endo_names = char(M_.endo_names, 'S');
M_.endo_names_tex = char(M_.endo_names_tex, 'S');
M_.endo_names_long = char(M_.endo_names_long, 'S');
M_.endo_names = char(M_.endo_names, 'Epsi_c');
M_.endo_names_tex = char(M_.endo_names_tex, 'Epsi\_c');
M_.endo_names_long = char(M_.endo_names_long, 'Epsi_c');
M_.endo_names = char(M_.endo_names, 'Epsi_c_star');
M_.endo_names_tex = char(M_.endo_names_tex, 'Epsi\_c\_star');
M_.endo_names_long = char(M_.endo_names_long, 'Epsi_c_star');
M_.endo_names = char(M_.endo_names, 'chi');
M_.endo_names_tex = char(M_.endo_names_tex, 'chi');
M_.endo_names_long = char(M_.endo_names_long, 'chi');
M_.endo_names = char(M_.endo_names, 'chi_star');
M_.endo_names_tex = char(M_.endo_names_tex, 'chi\_star');
M_.endo_names_long = char(M_.endo_names_long, 'chi_star');
M_.endo_names = char(M_.endo_names, 'WF');
M_.endo_names_tex = char(M_.endo_names_tex, 'WF');
M_.endo_names_long = char(M_.endo_names_long, 'WF');
M_.endo_names = char(M_.endo_names, 'A');
M_.endo_names_tex = char(M_.endo_names_tex, 'A');
M_.endo_names_long = char(M_.endo_names_long, 'A');
M_.endo_names = char(M_.endo_names, 'A_star');
M_.endo_names_tex = char(M_.endo_names_tex, 'A\_star');
M_.endo_names_long = char(M_.endo_names_long, 'A_star');
M_.endo_names = char(M_.endo_names, 'Mk');
M_.endo_names_tex = char(M_.endo_names_tex, 'Mk');
M_.endo_names_long = char(M_.endo_names_long, 'Mk');
M_.endo_names = char(M_.endo_names, 'Mk_star');
M_.endo_names_tex = char(M_.endo_names_tex, 'Mk\_star');
M_.endo_names_long = char(M_.endo_names_long, 'Mk_star');
M_.endo_names = char(M_.endo_names, 'theta');
M_.endo_names_tex = char(M_.endo_names_tex, 'theta');
M_.endo_names_long = char(M_.endo_names_long, 'theta');
M_.endo_names = char(M_.endo_names, 'theta_star');
M_.endo_names_tex = char(M_.endo_names_tex, 'theta\_star');
M_.endo_names_long = char(M_.endo_names_long, 'theta_star');
M_.endo_partitions = struct();
M_.param_names = 'betta';
M_.param_names_tex = 'betta';
M_.param_names_long = 'betta';
M_.param_names = char(M_.param_names, 'sigma_n');
M_.param_names_tex = char(M_.param_names_tex, 'sigma\_n');
M_.param_names_long = char(M_.param_names_long, 'sigma_n');
M_.param_names = char(M_.param_names, 'phi_pi_h');
M_.param_names_tex = char(M_.param_names_tex, 'phi\_pi\_h');
M_.param_names_long = char(M_.param_names_long, 'phi_pi_h');
M_.param_names = char(M_.param_names, 'phi_y_h');
M_.param_names_tex = char(M_.param_names_tex, 'phi\_y\_h');
M_.param_names_long = char(M_.param_names_long, 'phi_y_h');
M_.param_names = char(M_.param_names, 'phi_pi_f');
M_.param_names_tex = char(M_.param_names_tex, 'phi\_pi\_f');
M_.param_names_long = char(M_.param_names_long, 'phi_pi_f');
M_.param_names = char(M_.param_names, 'phi_y_f');
M_.param_names_tex = char(M_.param_names_tex, 'phi\_y\_f');
M_.param_names_long = char(M_.param_names_long, 'phi_y_f');
M_.param_names = char(M_.param_names, 'phi_pi_h_star');
M_.param_names_tex = char(M_.param_names_tex, 'phi\_pi\_h\_star');
M_.param_names_long = char(M_.param_names_long, 'phi_pi_h_star');
M_.param_names = char(M_.param_names, 'phi_y_h_star');
M_.param_names_tex = char(M_.param_names_tex, 'phi\_y\_h\_star');
M_.param_names_long = char(M_.param_names_long, 'phi_y_h_star');
M_.param_names = char(M_.param_names, 'phi_pi_f_star');
M_.param_names_tex = char(M_.param_names_tex, 'phi\_pi\_f\_star');
M_.param_names_long = char(M_.param_names_long, 'phi_pi_f_star');
M_.param_names = char(M_.param_names, 'phi_y_f_star');
M_.param_names_tex = char(M_.param_names_tex, 'phi\_y\_f\_star');
M_.param_names_long = char(M_.param_names_long, 'phi_y_f_star');
M_.param_names = char(M_.param_names, 'rho_Epsi_c');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_Epsi\_c');
M_.param_names_long = char(M_.param_names_long, 'rho_Epsi_c');
M_.param_names = char(M_.param_names, 'rho_r');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_r');
M_.param_names_long = char(M_.param_names_long, 'rho_r');
M_.param_names = char(M_.param_names, 'sigma_c');
M_.param_names_tex = char(M_.param_names_tex, 'sigma\_c');
M_.param_names_long = char(M_.param_names_long, 'sigma_c');
M_.param_names = char(M_.param_names, 'kappa');
M_.param_names_tex = char(M_.param_names_tex, 'kappa');
M_.param_names_long = char(M_.param_names_long, 'kappa');
M_.param_names = char(M_.param_names, 'nu');
M_.param_names_tex = char(M_.param_names_tex, 'nu');
M_.param_names_long = char(M_.param_names_long, 'nu');
M_.param_names = char(M_.param_names, 'rho_tau');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_tau');
M_.param_names_long = char(M_.param_names_long, 'rho_tau');
M_.param_names = char(M_.param_names, 'rho_g');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_g');
M_.param_names_long = char(M_.param_names_long, 'rho_g');
M_.param_names = char(M_.param_names, 'gamma_tau');
M_.param_names_tex = char(M_.param_names_tex, 'gamma\_tau');
M_.param_names_long = char(M_.param_names_long, 'gamma_tau');
M_.param_names = char(M_.param_names, 'rho_tau_star');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_tau\_star');
M_.param_names_long = char(M_.param_names_long, 'rho_tau_star');
M_.param_names = char(M_.param_names, 'gamma_tau_star');
M_.param_names_tex = char(M_.param_names_tex, 'gamma\_tau\_star');
M_.param_names_long = char(M_.param_names_long, 'gamma_tau_star');
M_.param_names = char(M_.param_names, 'rho_a');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_a');
M_.param_names_long = char(M_.param_names_long, 'rho_a');
M_.param_names = char(M_.param_names, 'rho_a_star');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_a\_star');
M_.param_names_long = char(M_.param_names_long, 'rho_a_star');
M_.param_names = char(M_.param_names, 'rho_mk');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_mk');
M_.param_names_long = char(M_.param_names_long, 'rho_mk');
M_.param_names = char(M_.param_names, 'rho_mk_star');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_mk\_star');
M_.param_names_long = char(M_.param_names_long, 'rho_mk_star');
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 1;
M_.endo_nbr = 40;
M_.param_nbr = 24;
M_.orig_endo_nbr = 40;
M_.aux_vars = [];
M_.Sigma_e = zeros(1, 1);
M_.Correlation_matrix = eye(1, 1);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = 1;
M_.det_shocks = [];
options_.block=0;
options_.bytecode=0;
options_.use_dll=0;
M_.hessian_eq_zero = 0;
erase_compiled_function('Open_Nk_nl_tau_OptLoop_fun_static');
erase_compiled_function('Open_Nk_nl_tau_OptLoop_fun_dynamic');
M_.orig_eq_nbr = 40;
M_.eq_nbr = 40;
M_.ramsey_eq_nbr = 0;
M_.set_auxiliary_variables = exist(['./' M_.fname '_set_auxiliary_variables.m'], 'file') == 2;
M_.lead_lag_incidence = [
 0 13 53;
 0 14 54;
 1 15 0;
 2 16 0;
 0 17 0;
 0 18 0;
 0 19 55;
 0 20 56;
 0 21 0;
 0 22 0;
 3 23 0;
 4 24 0;
 0 25 0;
 0 26 0;
 0 27 0;
 0 28 0;
 0 29 57;
 0 30 58;
 0 31 59;
 0 32 60;
 0 33 0;
 0 34 0;
 5 35 0;
 6 36 0;
 7 37 0;
 8 38 0;
 9 39 0;
 10 40 0;
 11 41 61;
 0 42 62;
 0 43 63;
 0 44 0;
 0 45 0;
 0 46 64;
 12 47 0;
 0 48 0;
 0 49 0;
 0 50 0;
 0 51 0;
 0 52 0;]';
M_.nstatic = 17;
M_.nfwrd   = 11;
M_.npred   = 11;
M_.nboth   = 1;
M_.nsfwrd   = 12;
M_.nspred   = 12;
M_.ndynamic   = 23;
M_.equations_tags = {
};
M_.static_and_dynamic_models_differ = 0;
M_.exo_names_orig_ord = [1:1];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(40, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(1, 1);
M_.params = NaN(24, 1);
M_.NNZDerivatives = [189; 531; -1];
M_.params( 1 ) = .99;
betta = M_.params( 1 );
M_.params( 13 ) = 2;
sigma_c = M_.params( 13 );
M_.params( 2 ) = 1;
sigma_n = M_.params( 2 );
M_.params( 3 ) = 3;
phi_pi_h = M_.params( 3 );
M_.params( 4 ) = 0;
phi_y_h = M_.params( 4 );
M_.params( 5 ) = 0;
phi_pi_f = M_.params( 5 );
M_.params( 6 ) = 0;
phi_y_f = M_.params( 6 );
M_.params( 7 ) = 0;
phi_pi_h_star = M_.params( 7 );
M_.params( 8 ) = 0;
phi_y_h_star = M_.params( 8 );
M_.params( 9 ) = 2.5;
phi_pi_f_star = M_.params( 9 );
M_.params( 10 ) = 0;
phi_y_f_star = M_.params( 10 );
M_.params( 11 ) = .8;
rho_Epsi_c = M_.params( 11 );
M_.params( 12 ) = .7;
rho_r = M_.params( 12 );
M_.params( 14 ) = .85;
kappa = M_.params( 14 );
M_.params( 15 ) = 1;
nu = M_.params( 15 );
M_.params( 16 ) = 0.7;
rho_tau = M_.params( 16 );
M_.params( 19 ) = 0.7;
rho_tau_star = M_.params( 19 );
M_.params( 17 ) = .87;
rho_g = M_.params( 17 );
M_.params( 18 ) = 0.26;
gamma_tau = M_.params( 18 );
M_.params( 20 ) = 0.46;
gamma_tau_star = M_.params( 20 );
M_.params( 21 ) = .8556;
rho_a = M_.params( 21 );
M_.params( 22 ) = .8556;
rho_a_star = M_.params( 22 );
M_.params( 23 ) = .7;
rho_mk = M_.params( 23 );
M_.params( 24 ) = .7;
rho_mk_star = M_.params( 24 );
%
% INITVAL instructions
%
options_.initval_file = 0;
oo_.steady_state( 39 ) = 5;
oo_.steady_state( 40 ) = 5;
oo_.steady_state( 37 ) = oo_.steady_state(39)/(oo_.steady_state(39)-1);
oo_.steady_state( 38 ) = oo_.steady_state(40)/(oo_.steady_state(40)-1);
oo_.steady_state( 30 ) = 1;
oo_.steady_state( 31 ) = 1;
oo_.steady_state( 35 ) = 1;
oo_.steady_state( 36 ) = 1;
oo_.steady_state( 5 ) = 2^(M_.params(13)/(M_.params(13)+M_.params(2)));
oo_.steady_state( 6 ) = 2^(M_.params(13)/(M_.params(13)+M_.params(2)));
oo_.steady_state( 25 ) = oo_.steady_state(5)/2;
oo_.steady_state( 26 ) = oo_.steady_state(6)/2;
oo_.steady_state( 23 ) = 0.3333333333333333;
oo_.steady_state( 24 ) = 0.3333333333333333;
oo_.steady_state( 1 ) = oo_.steady_state(5)/2;
oo_.steady_state( 2 ) = oo_.steady_state(6)/2;
oo_.steady_state( 3 ) = 1;
oo_.steady_state( 4 ) = 1;
oo_.steady_state( 7 ) = 1;
oo_.steady_state( 9 ) = oo_.steady_state(7);
oo_.steady_state( 8 ) = 1;
oo_.steady_state( 10 ) = oo_.steady_state(8);
oo_.steady_state( 11 ) = 1/M_.params(1);
oo_.steady_state( 13 ) = oo_.steady_state(11)/oo_.steady_state(7);
oo_.steady_state( 12 ) = 1/M_.params(1);
oo_.steady_state( 14 ) = oo_.steady_state(12)/oo_.steady_state(8);
oo_.steady_state( 15 ) = 1/(1-oo_.steady_state(23));
oo_.steady_state( 16 ) = 1/(1-oo_.steady_state(24));
oo_.steady_state( 17 ) = oo_.steady_state(5)*oo_.steady_state(1)^(-M_.params(13))*oo_.steady_state(15)/oo_.steady_state(35)/(1-M_.params(1)*M_.params(14));
oo_.steady_state( 18 ) = oo_.steady_state(5)*oo_.steady_state(1)^(-M_.params(13))/(1-M_.params(1)*M_.params(14));
oo_.steady_state( 19 ) = oo_.steady_state(6)*oo_.steady_state(2)^(-M_.params(13))*oo_.steady_state(16)/oo_.steady_state(36)/(1-M_.params(1)*M_.params(14));
oo_.steady_state( 20 ) = oo_.steady_state(6)*oo_.steady_state(2)^(-M_.params(13))/(1-M_.params(1)*M_.params(14));
oo_.steady_state( 21 ) = oo_.steady_state(5);
oo_.steady_state( 22 ) = oo_.steady_state(6);
oo_.steady_state( 27 ) = oo_.steady_state(5)*(-(0.5-oo_.steady_state(23)/(1-oo_.steady_state(23))))/(1-M_.params(1));
oo_.steady_state( 28 ) = oo_.steady_state(6)*(-(0.5-oo_.steady_state(24)/(1-oo_.steady_state(24))))/(1-M_.params(1));
oo_.steady_state( 29 ) = 1;
oo_.steady_state( 32 ) = 1-(oo_.steady_state(39)-1)*(1-oo_.steady_state(23))/oo_.steady_state(39);
oo_.steady_state( 33 ) = 1-(oo_.steady_state(40)-1)*(1-oo_.steady_state(24))/oo_.steady_state(40);
oo_.steady_state( 34 ) = 0.5*1/(1-M_.params(1))*(oo_.steady_state(1)^(1-M_.params(13))*oo_.steady_state(30)^M_.params(13)/(1-M_.params(13))+oo_.steady_state(25)^(1-M_.params(13))/(1-M_.params(13))-oo_.steady_state(5)^(1+M_.params(2))/(1+M_.params(2))+oo_.steady_state(2)^(1-M_.params(13))*oo_.steady_state(31)^M_.params(13)/(1-M_.params(13))+oo_.steady_state(26)^(1-M_.params(13))/(1-M_.params(13))-oo_.steady_state(6)^(1+M_.params(2))/(1+M_.params(2)));
if M_.exo_nbr > 0
	oo_.exo_simul = ones(M_.maximum_lag,1)*oo_.exo_steady_state';
end
if M_.exo_det_nbr > 0
	oo_.exo_det_simul = ones(M_.maximum_lag,1)*oo_.exo_det_steady_state';
end
%
% SHOCKS instructions
%
M_.exo_det_length = 0;
M_.Sigma_e(1, 1) = (.0064)^2;
resid(1);
model_diagnostics(M_,options_,oo_);
oo_.dr.eigval = check(M_,options_,oo_);
options_.irf = 100;
options_.order = 2;
options_.pruning = 1;
var_list_ = char('C','C_star','Y','Y_star','N','N_star','R','R_star','Pi_H','Pi_F_star','S','Tau','Tau_star','D_norm','D_norm_star','WF');
info = stoch_simul(var_list_);
save('Open_Nk_nl_tau_OptLoop_fun_results.mat', 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save('Open_Nk_nl_tau_OptLoop_fun_results.mat', 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save('Open_Nk_nl_tau_OptLoop_fun_results.mat', 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save('Open_Nk_nl_tau_OptLoop_fun_results.mat', 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save('Open_Nk_nl_tau_OptLoop_fun_results.mat', 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save('Open_Nk_nl_tau_OptLoop_fun_results.mat', 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save('Open_Nk_nl_tau_OptLoop_fun_results.mat', 'oo_recursive_', '-append');
end


disp(['Total computing time : ' dynsec2hms(toc(tic0)) ]);
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
diary off
