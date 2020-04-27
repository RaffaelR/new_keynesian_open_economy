 dynare Open_Nk_nl_tau_OptLoop_fun.mod
 
 %x_opt_name={'phi_pi_h','phi_y_h','phi_pi_f','phi_y_f','gamma_tau','phi_pi_f_star','phi_y_f_star','phi_pi_h_star','phi_y_h_star','gamma_tau_star'};
 %upper = [3.001,3,3,1.5,.51,3.001,3,.1,.2,.51];
 %lower = [1.001,0,0,0,.01,1.001,0,0,0,.01];
 %steps= [2,3,1.5,.5,.1,.1,3,.1,.1,.1];
 
 %x_opt_name={'phi_pi_f','phi_y_f','gamma_tau','phi_pi_f_star','phi_pi_h_star','gamma_tau_star'};
 %upper = [1,1,.51,3,.5,.51];
 %lower = [1,0.9,.21,1.8,0,.21];
 %steps= [0,.1,.1,.1,.05,.01];
 
 %x_opt_name={'phi_pi_h','gamma_tau','phi_pi_f_star','phi_pi_h_star','phi_y_h_star','gamma_tau_star'};
 %upper = [3.001,.1,3.001,1,1,.5];
 %lower = [2.001,0.01,1.001,0,0,0];
 %steps= [1,.09,2,1,1,.1];
 
 % R, R_star, tau_, tau_star
 %x_opt_name={'phi_pi_h','phi_y_h','rho_tau','gamma_tau','phi_pi_f_star','phi_y_f_star','rho_tau_star','gamma_tau_star'};
 %upper = [1.801,1.8,1,.1,1.801,1.8,1,.1];
 %lower = [1.001,0,0,0,1.001,0,0,0];
 %steps=[.8,1.8,.4,.05,.8,1.8,.4,.05];
 
 x_opt_name={'phi_pi_h','phi_y_h','gamma_tau','phi_pi_f_star','phi_y_f_star','gamma_tau_star'};
 upper = [1.2,3,.51,1.2,3,.51];
 lower = [1.1,0,.01,1.1,0,.01];
 steps=[.1,.5,.1,.1,.5,.1];
 
 answer = find_func_min_point(x_opt_name,upper,lower,steps);