var

% Endogenous variables
C            % consumption
C_star            % consumption
V            % price dispersion
V_star
N            % hours
N_star            % hours
Pi_H           % inflation
Pi_F_star
Pi_new      % reset price inflation
Pi_new_star
R            % nominal interest rate
R_star            % nominal interest rate
r            % real interest rate
r_star
W            % real wage
W_star
X1           % price variable 1 
X2           % price variable 2
X1_star           % price variable 1 
X2_star           % price variable 2
Y            % output
Y_star            % output
Tau          % income tax
Tau_star          % income tax
G            % Government spending
G_star            % Government spending
D            % Government Debt
D_star            % Government Debt
S            % Terms of Trade
% Exogenous variables
Epsi_c            % demand shock
Epsi_c_star            % demand shock
chi
chi_star
WF
A
A_star
Mk
Mk_star
theta
theta_star
;

% Shocks
varexo 
%e_Epsi_c          % demand shock
%e_Epsi_c_star
e_a
%e_a_star
%e_mk
%e_mk_star
;

%--------------------------------------------------------------------------
% Parameters
%--------------------------------------------------------------------------

parameters 

betta           % discount factor
sigma_n         % inverse Frisch elasticity
phi_pi_h          % Taylor rule inflation
phi_y_h           % Taylor rule output
phi_pi_f          % Taylor rule inflation
phi_y_f           % Taylor rule output
phi_pi_h_star          % Taylor rule inflation
phi_y_h_star           % Taylor rule output
phi_pi_f_star          % Taylor rule inflation
phi_y_f_star           % Taylor rule output
rho_Epsi_c      % autocorrelation technology shock
rho_r           % Taylor rule smoothing
sigma_c         % intertemporal elasticity of substitution
kappa          % Calvo price
nu
rho_tau
rho_g
gamma_tau
rho_tau_star
gamma_tau_star
rho_a
rho_a_star
rho_mk
rho_mk_star
lambda_utility
WF_Ram
;

betta=.99 ;        % discount factor
sigma_c=2;         % intertemporal elasticity of substitution
sigma_n=1  ;       % inverse Frisch elasticity
phi_pi_h=3;          % Taylor rule inflation
phi_y_h=0;           % Taylor rule output
phi_pi_f=0;          % Taylor rule inflation
phi_y_f=0;           % Taylor rule output
phi_pi_h_star=0;          % Taylor rule inflation
phi_y_h_star=0;           % Taylor rule output
phi_pi_f_star=1;          % Taylor rule inflation
phi_y_f_star=0.16;           % Taylor rule output
rho_Epsi_c=.8;     % autocorrelation technology shock
rho_r= .7;         % Taylor rule smoothing
kappa=.85;         % Calvo price
nu=1;
rho_tau= .7;
rho_tau_star= .7;
rho_g=.87;
gamma_tau= 0.01;
gamma_tau_star= 0.01;
rho_a=.8556;
rho_a_star=.8556;
rho_mk=.7;
rho_mk_star=.7;
lambda_utility=0;
WF_Ram=370;

%--------------------------------------------------------------------------
% Model
%--------------------------------------------------------------------------

model;

% Prices
%--------------------------------------------------------------------------
% Eqn 14,15: Price index
Pi_H^(1-theta) = (1 - kappa) * Pi_new^(1-theta) + kappa;
Pi_F_star^(1-theta_star) = (1 - kappa) * Pi_new_star^(1-theta_star) + kappa;

% Eqn 16,17: FOC price 1
X1 = (Epsi_c^(sigma_c))*(C^(-sigma_c))*Y*(S^(nu/2-1))*W/A + kappa*betta* (Pi_H(+1)^(theta)) * X1(+1);
X1_star = (Epsi_c_star^(sigma_c))*(C_star^(-sigma_c))*Y_star*(S^(1-nu/2))*W_star/A_star + kappa*betta* (Pi_F_star(+1)^(theta_star)) * X1_star(+1);

% Eqn 18,19: FOC price 2
X2 = (Epsi_c^(sigma_c))*(C^(-sigma_c))*Y*(S^(nu/2-1)) + kappa * betta*(Pi_H(+1)^(theta-1)) * X2(+1);
X2_star = (Epsi_c_star^(sigma_c))*(C_star^(-sigma_c))*Y_star*(S^(1-nu/2)) + kappa * betta*(Pi_F_star(+1)^(theta_star-1)) * X2_star(+1);

% Eqn 20,21: Optimal price
Pi_new = Mk*(1-chi) *Pi_H* X1 / X2;
Pi_new_star = Mk_star*(1-chi_star) *Pi_F_star* X1_star / X2_star;

% Monetary Policy and Production
%--------------------------------------------------------------------------
% Eqn 22, 23: Taylor rule
R / steady_state(R) = ((R(-1) / steady_state(R))^rho_r) * ((Pi_H^phi_pi_h *Pi_F_star^phi_pi_f * (Y / steady_state(Y))^phi_y_h*(Y_star / steady_state(Y_star))^phi_y_f)^(1-rho_r));
R_star / steady_state(R_star) = ((R_star(-1) / steady_state(R_star))^rho_r) * ((Pi_F_star^phi_pi_f_star *Pi_H^phi_pi_h_star *(Y_star / steady_state(Y_star))^phi_y_f_star*(Y / steady_state(Y))^phi_y_h_star)^(1-rho_r));

% Eqn 24, 25: Resource constraint
Y=(nu/2)*(S^(1-nu/2))*C+(1-nu/2)*(S^(nu/2))*C_star+G;
Y_star=(1-nu/2)*(S^(-nu/2))*C+(nu/2)*(S^(nu/2-1))*C_star+G_star;

% Eqn 26,27: Production function
Y = A*N / V;
Y_star = A_star*N_star / V_star;

% Eqn 28,29: Price dispersion
V = (1 - kappa) * (Pi_new^(-theta)) * (Pi_H^theta) + kappa* (Pi_H^theta) * V(-1);
V_star = (1 - kappa) * (Pi_new_star^(-theta_star)) * (Pi_F_star^theta_star) + kappa* (Pi_F_star^theta_star) * V_star(-1);

% Households
%--------------------------------------------------------------------------
% Eqn 30,31: Labor supply
(Epsi_c^(-sigma_c))*(N^sigma_n) * (C^sigma_c) = W*(1-Tau)*(S^(nu/2-1)); 
(Epsi_c_star^(-sigma_c))*(N_star^sigma_n) * (C_star^sigma_c) = W_star*(1-Tau_star)*(S^(1-nu/2)); 

% Eqn 32-34: Euler equation
(Epsi_c^sigma_c)*(C^(-sigma_c))=betta*R*(Epsi_c(+1)^sigma_c)*(C(+1)^(-sigma_c))*(S^(1-nu/2))/(Pi_H(+1)*(S(+1)^(1-nu/2)));
(Epsi_c_star^sigma_c)*(C_star^(-sigma_c))=(Epsi_c^sigma_c)*(C^(-sigma_c))*S^(nu-1);
(Epsi_c_star^sigma_c)*(C_star^(-sigma_c))=betta*R_star*(Epsi_c_star(+1)^sigma_c)*(C_star(+1)^(-sigma_c))*(S^(nu/2-1))/(Pi_F_star(+1)*(S(+1)^(nu/2-1)));

%Eqn 35,36: Government Debt
D=R*(S^(nu/2-1))*((D(-1)*(S(-1)^(1-nu/2))/Pi_H)+G-Tau*W*N);
D_star=R_star*(S^(1-nu/2))*((D_star(-1)*(S(-1)^(nu/2-1))/Pi_F_star)+G_star-Tau_star*W_star*N_star);

% Additional Equations
%--------------------------------------------------------------------------
% Eqn 37,38: Lump-sum for efficient S.S.
chi=1-(1-steady_state(Tau))*(steady_state(theta)-1)/steady_state(theta);
chi_star=1-(1-steady_state(Tau_star))*(steady_state(theta_star)-1)/steady_state(theta_star);

%Mk=rho_mk*Mk(-1)+(1-rho_mk)*steady_state(Mk)+ e_mk;
Mk=steady_state(Mk);
%Mk_star=rho_mk_star*Mk_star(-1)+(1-rho_mk_star)*steady_state(Mk_star)+ e_mk_star;
Mk_star=steady_state(Mk_star);
theta=Mk/(Mk-1);
theta_star=Mk_star/(Mk_star-1);

% Eqn 39,40: real interest rates
r = R / Pi_H(+1);
r_star = R_star / Pi_F_star(+1);

%Eqn 41-44: Politicas
ln(G)=rho_g*ln(G(-1))+(1-rho_g)*ln(steady_state(G));
Tau= rho_tau*Tau(-1)+(1-rho_tau)*steady_state(Tau)+(1-rho_tau)*gamma_tau*(D/Y-steady_state(D)/steady_state(Y));
ln(G_star)=rho_g*ln(G_star(-1))+(1-rho_g)*ln(steady_state(G_star));
Tau_star= rho_tau_star*Tau_star(-1)+(1-rho_tau_star)*steady_state(Tau_star)+(1-rho_tau_star)*gamma_tau_star*(D_star/Y_star-steady_state(D_star)/steady_state(Y_star));

%Eqn 45-48: Shock
%ln(Epsi_c) = rho_Epsi_c * ln(Epsi_c(-1)) + (1/sigma_c)*e_Epsi_c;
%ln(Epsi_c_star) = rho_Epsi_c * ln(Epsi_c_star(-1)) + (1/sigma_c)*e_Epsi_c_star;
Epsi_c=1;
Epsi_c_star=1;
ln(A) = rho_a * ln(A(-1)) + e_a;
%A=1;
A_star=1;
%ln(A_star) = rho_a * ln(A_star(-1)) + e_a_star;

%Eqn 49: Welfare
WF= (1/2)*(((1+lambda_utility)*C)^(1-sigma_c)*Epsi_c^(sigma_c)/(1-sigma_c)+G^(1-sigma_c)/(1-sigma_c)-N^(1+sigma_n)/(1+sigma_n)+((1+lambda_utility)*C_star)^(1-sigma_c)*Epsi_c_star^(sigma_c)/(1-sigma_c)+G_star^(1-sigma_c)/(1-sigma_c)-N_star^(1+sigma_n)/(1+sigma_n))+betta*WF(+1);
end;

%--------------------------------------------------------------------------
% Initval
%--------------------------------------------------------------------------
initval;
theta=5;
theta_star=5;
Mk=theta/(theta-1);
Mk_star=theta_star/(theta_star-1);
Epsi_c     = 1;
Epsi_c_star     = 1;
A=1;
A_star=1;
N=2^(sigma_c/(sigma_c+sigma_n));            % hours
N_star=2^(sigma_c/(sigma_c+sigma_n));            % hours
G=N/2;            % Government spending
G_star=N_star/2;            % Government spending
Tau= 1/3;         % income tax
Tau_star= 1/3;         % income tax
C=N/2;            % consumption
C_star=N_star/2;            % consumption
V=1;            % price dispersion
V_star=1;            % price dispersion
Pi_H =1;
Pi_new =Pi_H;     % reset price inflation
Pi_F_star =1;
Pi_new_star =Pi_F_star;     % reset price inflation
R =1/betta;           % nominal interest rate
r = R/Pi_H;           % real interest rate
R_star =1/betta;           % nominal interest rate
r_star = R_star/Pi_F_star;           % real interest rate
W=1/(1-Tau);            % real wage
W_star=1/(1-Tau_star);            % real wage
X1= (C^(-sigma_c))*N*(W/A)/(1-kappa*betta) ;         % price variable 1 
X2=  (C^(-sigma_c))*N/(1-kappa*betta);         % price variable 2
X1_star= (C_star^(-sigma_c))*N_star*(W_star/A_star)/(1-kappa*betta) ;         % price variable 1 
X2_star =  (C_star^(-sigma_c))*N_star/(1-kappa*betta);         % price variable 2
Y=N;            % output
Y_star=N_star;            % output
D=-(1/2-Tau/(1-Tau))*N/(1-betta);            % Government Debt
D_star=-(1/2-Tau_star/(1-Tau_star))*N_star/(1-betta);            % Government Debt
S=1;            % Terms of Trade
chi=1-(1-Tau)*(theta-1)/theta;
chi_star=1-(1-Tau_star)*(theta-1)/theta;
WF=(1/2)*(1/(1-betta))*((1+lambda_utility)*(C)^(1-sigma_c)*Epsi_c^(sigma_c)/(1-sigma_c)+G^(1-sigma_c)/(1-sigma_c)-N^(1+sigma_n)/(1+sigma_n)+((1+lambda_utility)*C_star)^(1-sigma_c)*Epsi_c_star^(sigma_c)/(1-sigma_c)+G_star^(1-sigma_c)/(1-sigma_c)-N_star^(1+sigma_n)/(1+sigma_n));
end;

%--------------------------------------------------------------------------
% Steady State
%--------------------------------------------------------------------------

steady_state_model;
theta=5;
theta_star=5;
Mk=theta/(theta-1);
Mk_star=theta_star/(theta_star-1);
Epsi_c     = 1;
Epsi_c_star     = 1;
A=1;
A_star=1;
N=2^(sigma_c/(sigma_c+sigma_n));            % hours
N_star=2^(sigma_c/(sigma_c+sigma_n));            % hours
G=N/2;            % Government spending
G_star=N_star/2;            % Government spending
Tau= 1/3;         % income tax
Tau_star= 1/3;         % income tax
C=N/2;            % consumption
C_star=N_star/2;            % consumption
V=1;            % price dispersion
V_star=1;            % price dispersion
Pi_H =1;
Pi_new =Pi_H;     % reset price inflation
Pi_F_star =1;
Pi_new_star =Pi_F_star;     % reset price inflation
R =1/betta;           % nominal interest rate
r = R/Pi_H;           % real interest rate
R_star =1/betta;           % nominal interest rate
r_star = R_star/Pi_F_star;           % real interest rate
W=1/(1-Tau);            % real wage
W_star=1/(1-Tau_star);            % real wage
X1= (C^(-sigma_c))*N*(W/A)/(1-kappa*betta) ;         % price variable 1 
X2=  (C^(-sigma_c))*N/(1-kappa*betta);         % price variable 2
X1_star= (C_star^(-sigma_c))*N_star*(W_star/A_star)/(1-kappa*betta) ;         % price variable 1 
X2_star =  (C_star^(-sigma_c))*N_star/(1-kappa*betta);         % price variable 2
Y=A*N;            % output
Y_star=A_star*N_star;            % output
D=-(1/2-Tau/(1-Tau))*N/(1-betta);            % Government Debt
D_star=-(1/2-Tau_star/(1-Tau_star))*N_star/(1-betta);            % Government Debt
S=1;            % Terms of Trade
chi=1-(1-Tau)*(theta-1)/theta;
chi_star=1-(1-Tau_star)*(theta-1)/theta;
WF=(1/2)*(1/(1-betta))*((1+lambda_utility)*(C)^(1-sigma_c)*Epsi_c^(sigma_c)/(1-sigma_c)+G^(1-sigma_c)/(1-sigma_c)-N^(1+sigma_n)/(1+sigma_n)+((1+lambda_utility)*C_star)^(1-sigma_c)*Epsi_c_star^(sigma_c)/(1-sigma_c)+G_star^(1-sigma_c)/(1-sigma_c)-N_star^(1+sigma_n)/(1+sigma_n));
end;

%--------------------------------------------------------------------------
% Shocks
%--------------------------------------------------------------------------

shocks;
%var e_Epsi_c;      stderr .0064;
%var e_Epsi_c_star;      stderr .0064;
var e_a;      stderr .0064;
%var e_a_star;      stderr .0064;
%var e_mk;      stderr .0064;
%var e_mk_star;      stderr .0064;

end;

%--------------------------------------------------------------------------
% Simulation
%--------------------------------------------------------------------------

resid(1);
model_diagnostics;
check;
stoch_simul(
order=2,
pruning,
nograph,
noprint,
irf         = 100
%,periods     = 100
%,bandpass_filter = [6 32] 
%,hp_filter = 1600
)WF
;