# new_keynesian_open_economy
Codes for a New Keynesian Open economy model with two countries of the same size, income-tax, stochastic government spending and government debt with possibility of home bias and multiple shocks (from now on NK1). Codes include the calculation of Ramsey_policy equilibrium; and a simple-rules economy with a routine that finds, in a grid-search, the parameters in these rules that maximize conditional welfare both under cooperation and non-cooperation of the authorities. By conditional welfare we denote the welfare under the condition that the initial state of the economy is the steady-state.

# The Simple_Rules_Cooperative branch is composed by four files: 
It calculates the second-order accurate cooperative conditional welfare that is maximized by the parameters in each smple-rule.

- Open_Nk_nl_OptLoop_fun.mod is a NK1 non-linear model with simple rules for home and foreign nominal interest rates and home and foreign income-tax.
- OptParams.m is the routine that calculates the parameters in the simple-rules that maximize conditional union-wide welfare. Run this routine to obtain the results.
- find_func_min_point.m finds the parameters that maximize conditional welfare
- welfare_calculator.m is a subroutine called by find_func_min_point.m to run a stochastic simulation of Open_Nk_nl_OptLoop_fun.mod and calculate the conditional welfare given the values passed by OptParams.m.

# The Simple_Rules_Non_Cooperative branch is composed by six files: 
It calculates, with a recursive logic, the second-order accurate non-cooperative conditional welfare that is maximized by the parameters in each smple-rule.

- Open_Nk_nl_Opt_fun_nc.mod is a NK1 non-linear model that runs second-order acurate union-wide welfare
- Open_Nk_nl_Opt1.mod is a NK1 non-linear model that runs second-order acurate home-country welfare
- Open_Nk_nl_Opt2.mod is a NK1 non-linear model that runs second-order acurate foreign-country welfare
- OptParams_nc.m is the routine that calculates the parameters in the simple-rules that maximize conditional union-wide welfare. Run this routine to obtain the results.
- find_func_min_point_nc.m finds the parameters that maximize conditional welfare
- welfare_calculator_nc.m is a subroutine called by find_func_min_point_nc.m to home, foreign or union-wide conditional welfare given the values passed by OptParams_nc.m.

# The Ramsey_Policy_Cooperative branche is composed by three files:
It calculates the ramsey equilibrium with instruments being home and foreign nominal interest rates; home and foreign income-taxes.

- Open_NK_nl_tau_Ramsey.mod is a NK1 non-linear model with ramsey_policy function that calculates the optimal Ramsey_policy with instruments being home and foreign nominal interest rates and income-taxes. Run this routine to obtain the results.
- find.n1 and find.n2 calculate the value of home and foreign output, respectively, as a function of the instruments (nominal interest rates and taxes), as the steady_state in ramsey_policy is a function of the instruments.

# The Equivalent_Consumption branche is composed by six files:
It calculates the equivalent-consumption, i.e. the percentage of each-period consumption given to home and foreign representative agents for the simple-rules economy to achieve the same welfare as the Ramsey-economy.

- Equivalent_Consump.m runs Open_Nk_nl_tau_Ramsey_tst.mod file to save the welfare and calls. Run this routine to obtain the results get_consumption_equivalent_conditional_welfare.m to find the equivalent_consumption between Ramsey-economy and Open_Nk_nl_tau_OptRule_tst.mod. Run this routine to obtain the results.
- get_consumption_equivalent_conditional_welfare.m finds the equivalent-consumption in a loop approach.
- Open_Nk_nl_tau_OptRule_tst.mod is a NK1 non-linear model with simple rules for home and foreign nominal interest rates and home and foreign income-tax. User must set the parameters in this routine before performing the calculation of the equivalent-consumption.
- Open_Nk_nl_tau_Ramsey_tst.mod is a NK1 non-linear model with ramsey_policy function that calculates the optimal Ramsey_policy with instruments being home and foreign nominal interest rates and income-taxes.
- find_n1_eq.m and find_n2_eq.m calculate the value of home and foreign output, respectively, as a function of the instruments (nominal interest rates and taxes), as the steady_state in ramsey_policy is a function of the instruments.




