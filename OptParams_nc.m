format long
stopper = 10e6;
last_welf=10e6;
inst=1;
x_full_name={'phi_pi_h','phi_y_h','gamma_tau','phi_pi_f_star','phi_y_f_star','gamma_tau_star'};
outparams1=[1.001,0,.01];
inter=0;
while abs(stopper)>1e-6
    if inst==1
        dynare Open_Nk_nl_tau_Opt1.mod;
        x_opt_name={'phi_pi_h','phi_y_h','gamma_tau'};
        upper = [3,1,.02];
        lower = [0,0,.01];
        steps=[3,1,.01];
        answer = find_func_min_point_nc(x_opt_name,upper,lower,steps,inst,outparams1,x_full_name);
        counter=2;
    end
    if inst==2
        dynare Open_Nk_nl_tau_Opt2.mod;
        x_opt_name={'phi_pi_f_star','phi_y_f_star','gamma_tau_star'};
        upper = [1,.16,.02];
        lower = [0,.1,.01];
        steps=[1,.06,.01];
        answer = find_func_min_point_nc(x_opt_name,upper,lower,steps,inst,outparams1,x_full_name);
        counter=1;
    end
    outparams2 = outparams1; 
    outparams1 = answer(2:end);
if answer(1) == 10e6
    stopper=10e6;
else
    stopper=last_welf-answer(1);
end
    last_welf=answer(1);
    inst=counter;
    if inst==2
        resp=[last_welf outparams1 outparams2];
    else
        resp=[last_welf outparams2 outparams1];
    end
    inter=inter+1;
    fprintf('%d / %d\n',stopper,inter);
end