dynare Open_Nk_nl_tau_Ramsey_tst noclearall
WF_Ramsey = evaluate_planner_objective(M_,options_,oo_);
format long;

dynare Open_Nk_nl_tau_OptRule_tst noclearall
global oo_ options_ M_

M_.params(strmatch('WF_Ram',M_.param_names,'exact'))=WF_Ramsey(1);

lambda_conditional_demand=csolve('get_consumption_equivalent_conditional_welfare',0,[],1e-8,1000)
