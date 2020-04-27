function outvalue = welfare_calculator(x_opt,upper,lower, x_opt_name)

global oo_ options_ M_

format long

%% set parameter for use in Dynare
set_dynare_seed('default');
ii=1;
for ii=1:length(x_opt_name)
    M_.params(strmatch(x_opt_name{ii},M_.param_names,'exact'))=x_opt(ii);
end

if (any(x_opt<lower) || any(x_opt>upper)) %make sure parameters are inside their bounds
    outvalue=+10e6+sum([x_opt].^2); %penalty function
    return
end

var_list_ = char('WF');
%[info, oo_, options_] = stoch_simul(M_, options_, oo_, var_list_);
info = stoch_simul(var_list_);

if info(1) %filter out error code
    outvalue=10e6+sum([x_opt].^2);
    return;
end
W_pos=strmatch('WF',M_.endo_names,'exact');
outvalue=-(oo_.dr.ys(W_pos)+0.5*oo_.dr.ghs2(oo_.dr.inv_order_var(W_pos))); %extract Welfare