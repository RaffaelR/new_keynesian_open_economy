function outvalue=get_consumption_equivalent_conditional_welfare(par_value_lambda)

global oo_ M_ options_

if par_value_lambda<-1 %do not allow negative consumption
    outvalue=1e5+par_value_lambda^2;
end

M_.params(strmatch('lambda_utility',M_.param_names,'exact'))=par_value_lambda;
if isempty(options_.qz_criterium)
    options_.qz_criterium = 1+1e-6;
end
[oo_.dr,info,M_,options_,oo_] = resol(0,M_,options_,oo_); %get decision rules
if info(1) %filter out error codes
    outvalue=1e5+par_value_lambda^2;
    return;
end

%% simulate conditional welfare
initial_condition_states = repmat(oo_.dr.ys,1,M_.maximum_lag); %get steady state as initial condition
shock_matrix = zeros(1,M_.exo_nbr); %create shock matrix with number of time periods in rows
set_dynare_seed('default');
y_sim = simult_(initial_condition_states,oo_.dr,shock_matrix,options_.order); %simulate one period to get value

W1=strmatch('WF_Ram',M_.param_names,'exact');
outvalue= (M_.params(W1)-y_sim(strmatch('WF',M_.endo_names,'exact'),2)); %read out gap