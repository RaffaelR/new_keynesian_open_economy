function outvalue = welfare_calculator_nc(x_opt,upper,lower, x_opt_name,inst,outparams,x_full_name)

global oo_ options_ M_

%% set parameter for use in Dynare
set_dynare_seed('default');
ii=1;

for ii=1:length(x_opt_name)
    M_.params(strmatch(x_opt_name{ii},M_.param_names,'exact'))=x_opt(ii);
end

if inst==1 || inst == 3
    for ii=(length(x_opt_name)+1):length(x_full_name)
        M_.params(strmatch(x_full_name{ii},M_.param_names,'exact'))=outparams(ii-length(x_opt_name));
    end
elseif inst==2 || inst==4
    for ii=1:(length(x_full_name)-length(x_opt_name))
        M_.params(strmatch(x_full_name{ii},M_.param_names,'exact'))=outparams(ii);
    end
end

if (any(x_opt<lower) || any(x_opt>upper)) %make sure parameters are inside their bounds
    outvalue=[10e6]; %penalty function
    return
end
if inst==1
    var_list_ = char('WF1');
elseif inst==2
    var_list_ = char('WF2');
elseif inst==3 || inst == 4
    var_list_ = char('WF');
end
    %[info, oo_, options_] = stoch_simul(M_, options_, oo_, var_list_);
    info = stoch_simul(var_list_);

if info(1) %filter out error code
    outvalue=[10e6];
    return;
end

if inst==1
W_pos=strmatch('WF1',M_.endo_names,'exact');
elseif inst==2
W_pos=strmatch('WF2',M_.endo_names,'exact');
elseif inst==3 || inst==4
W_pos=strmatch('WF',M_.endo_names,'exact');
end

outvalue=[-(oo_.dr.ys(W_pos)+0.5*oo_.dr.ghs2(oo_.dr.inv_order_var(W_pos)))]; %extract Welfare