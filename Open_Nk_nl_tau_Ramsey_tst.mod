var

% Endogenous variables
C            % home consumption
C_star            %foreign consumption
V            % home price dispersion
V_star      % foreign price dispersion
N            % home hours
N_star            % foreign hours
Pi_H           % home-products home inflation
Pi_F_star       % foreign-products foreign inflation
Pi_new      % home reset price inflation
Pi_new_star % foreign reset price inflation
R            % home nominal interest rate
R_star            % foreign nominal foreign interest rate
r            % home real interest rate
r_star      % foreign real interest rate
W            % home real wage
W_star      % foreign real wage
X1           % home price variable 1 
X2           % home price variable 2
X1_star           % foreign price variable 1 
X2_star           % foreign price variable 2
Y            % home output
Y_star            % foreign output
Tau          % home income tax
Tau_star          % foreign income tax
G               % home Government spending
G_star            % foreign Government spending
D            % home Government Debt
D_star            % foreign Government Debt
S            % Terms of Trade
A            %home productivity factor
A_star      %foreign productivity factor
% Exogenous variables
Epsi_c            %home demand shock
Epsi_c_star            %foreign demand shock
chi             %home steady-state lump-sum tax
chi_star        %foreign steady-state lump-sum tax
;

% Shocks
varexo 
%e_Epsi_c          % home demand shock
%e_Epsi_c_star       % foreign demand shock
%e_g                 % home government shock
%e_g_star        % foreign government shock
e_a             % home productivity shock
%e_a_star        % foreign productivity shock
;

%--------------------------------------------------------------------------
% Parameters
%--------------------------------------------------------------------------

parameters 

betta           % discount factor
theta           % intermediate good elasticity of substitution
sigma_n         % inverse Frisch elasticity
rho_Epsi_c      % autocorrelation technology shock
rho_r           % Taylor rule smoothing
sigma_c         % intertemporal elasticity of substitution
kappa          % Calvo price
nu
rho_g
rho_a
rho_tau
rho_tau_star
gamma_tau
gamma_tau_star
phi_pi_h          % Taylor rule inflation
phi_y_h           % Taylor rule output
phi_pi_f          % Taylor rule inflation
phi_y_f           % Taylor rule output
phi_pi_h_star          % Taylor rule inflation
phi_y_h_star           % Taylor rule output
phi_pi_f_star          % Taylor rule inflation
phi_y_f_star           % Taylor rule output
rho_r
;

betta=.99 ;        % discount factor
theta=5    ;       % intermediate good elasticity of substitution
sigma_n=1  ;       % inverse Frisch elasticity
rho_Epsi_c=.8;     % autocorrelation technology shock
rho_r= .7;        % Taylor rule smoothing
sigma_c=2;         % intertemporal elasticity of substitution
kappa=.85;          % Calvo price
nu=1;
rho_g=.87;
rho_a=.8556;
rho_tau= .7;
rho_tau_star= .7;
gamma_tau= 0.01;
gamma_tau_star= 0.01;
phi_pi_h=1.001;          % Taylor rule inflation
phi_y_h=0;           % Taylor rule output
phi_pi_f=0;          % Taylor rule inflation
phi_y_f=0;           % Taylor rule output
phi_pi_h_star=0;          % Taylor rule inflation
phi_y_h_star=0;           % Taylor rule output
phi_pi_f_star=1.001;          % Taylor rule inflation
phi_y_f_star=0;           % Taylor rule output
%--------------------------------------------------------------------------
% Model
%--------------------------------------------------------------------------

model;

% Prices
%--------------------------------------------------------------------------
% Eqn 14,15: Price index
Pi_H^(1-theta) = (1 - kappa) * Pi_new^(1-theta) + kappa;
Pi_F_star^(1-theta) = (1 - kappa) * Pi_new_star^(1-theta) + kappa;

% Eqn 16,17: FOC price 1
X1 = (Epsi_c^(sigma_c))*(C^(-sigma_c))*Y*(S^(nu/2-1))*W/A + kappa*betta* (Pi_H(+1)^(theta)) * X1(+1);
X1_star = (Epsi_c_star^(sigma_c))*(C_star^(-sigma_c))*Y_star*(S^(1-nu/2))*W_star/A_star + kappa*betta* (Pi_F_star(+1)^(theta)) * X1_star(+1);

% Eqn 18,19: FOC price 2
X2 = (Epsi_c^(sigma_c))*(C^(-sigma_c))*Y*(S^(nu/2-1)) + kappa * betta*(Pi_H(+1)^(theta-1)) * X2(+1);
X2_star = (Epsi_c_star^(sigma_c))*(C_star^(-sigma_c))*Y_star*(S^(1-nu/2)) + kappa * betta*(Pi_F_star(+1)^(theta-1)) * X2_star(+1);

% Eqn 20,21: Optimal price
Pi_new = (theta/(theta-1))*(1-chi) *Pi_H* X1 / X2;
Pi_new_star = (theta/(theta-1))*(1-chi_star) *Pi_F_star* X1_star / X2_star;

% Monetary Policy and Production
%--------------------------------------------------------------------------

% Eqn 24, 25: Resource constraint
Y=(nu/2)*(S^(1-nu/2))*C+(1-nu/2)*(S^(nu/2))*C_star+G;
Y_star=(1-nu/2)*(S^(-nu/2))*C+(nu/2)*(S^(nu/2-1))*C_star+G_star;

% Eqn 26,27: Production function
Y = A*N / V;
Y_star = A_star*N_star / V_star;

% Eqn 28,29: Price dispersion
V = (1 - kappa) * (Pi_new^(-theta)) * (Pi_H^theta) + kappa* (Pi_H^theta) * V(-1);
V_star = (1 - kappa) * (Pi_new_star^(-theta)) * (Pi_F_star^theta) + kappa* (Pi_F_star^theta) * V_star(-1);

% Households
%--------------------------------------------------------------------------
% Eqn 30,31: Labor supply
(Epsi_c^(-sigma_c))*(N^sigma_n) * (C^sigma_c) = W*(1-Tau)*(S^(nu/2-1)); 
(Epsi_c_star^(-sigma_c))*(N_star^sigma_n) * (C_star^sigma_c) = W_star*(1-Tau_star)*(S^(1-nu/2)); 

% Eqn 32-33: Euler equation
(Epsi_c^sigma_c)*(C^(-sigma_c))=betta*R*(Epsi_c(+1)^sigma_c)*(C(+1)^(-sigma_c))*(S^(1-nu/2))/(Pi_H(+1)*(S(+1)^(1-nu/2)));
(Epsi_c_star^sigma_c)*(C_star^(-sigma_c))=betta*R_star*(Epsi_c_star(+1)^sigma_c)*(C_star(+1)^(-sigma_c))*(S^(nu/2-1))/(Pi_F_star(+1)*(S(+1)^(nu/2-1)));

% Eqn 34: Perfect Risk Sharing (\nu is the home bias and in the symmetric case is equal to 1)
(Epsi_c_star^sigma_c)*(C_star^(-sigma_c))=(Epsi_c^sigma_c)*(C^(-sigma_c))*S^(nu-1);

%Eqn 35,36: Government Debt
D=R*(S^(nu/2-1))*((D(-1)*(S(-1)^(1-nu/2))/Pi_H)+G-Tau*W*N);
D_star=R_star*(S^(1-nu/2))*((D_star(-1)*(S(-1)^(nu/2-1))/Pi_F_star)+G_star-Tau_star*W_star*N_star);

% Additional Equations
%--------------------------------------------------------------------------

% Eqn 37,38: Lump-sum for efficient S.S.
chi=1-(1-steady_state(Tau))*(theta-1)/theta;
chi_star=1-(1-steady_state(Tau_star))*(theta-1)/theta;

% Eqn 39,40: real interest rates
r = R / Pi_H(+1);
r_star = R_star / Pi_F_star(+1);

%Eqn 43-46: Government Spending
ln(G)=rho_g*ln(G(-1))+(1-rho_g)*ln(steady_state(G)); %+e_g;
ln(G_star)=rho_g*ln(G_star(-1))+(1-rho_g)*ln(steady_state(G_star));%+e_g_star;
%Tau= rho_tau*Tau(-1)+(1-rho_tau)*steady_state(Tau)+(1-rho_tau)*gamma_tau*(D/Y-steady_state(D)/steady_state(Y));
%Tau_star= rho_tau_star*Tau_star(-1)+(1-rho_tau_star)*steady_state(Tau_star)+(1-rho_tau_star)*gamma_tau_star*(D_star/Y_star-steady_state(D_star)/steady_state(Y_star));
%R / steady_state(R) = ((R(-1) / steady_state(R))^rho_r) * ((Pi_H^phi_pi_h *Pi_F_star^phi_pi_f * (Y / steady_state(Y))^phi_y_h*(Y_star / steady_state(Y_star))^phi_y_f)^(1-rho_r));
%R_star / steady_state(R_star) = ((R_star(-1) / steady_state(R_star))^rho_r) * ((Pi_F_star^phi_pi_f_star *Pi_H^phi_pi_h_star *(Y_star / steady_state(Y_star))^phi_y_f_star*(Y / steady_state(Y))^phi_y_h_star)^(1-rho_r));

%Eqn 47-50: Shocks
%ln(Epsi_c) = rho_Epsi_c * ln(Epsi_c(-1)) + (1/sigma_c)*e_Epsi_c;
%ln(Epsi_c_star) = rho_Epsi_c * ln(Epsi_c_star(-1)) + (1/sigma_c)*e_Epsi_c_star;
Epsi_c=1;
Epsi_c_star=1;
ln(A) = rho_a * ln(A(-1)) + e_a;
A_star=1;
%ln(A_star) = rho_a * ln(A_star(-1)) + (1/sigma_c)*e_a_star;
%ln(Epsi_c_star) = rho_Epsi_c * ln(Epsi_c_star(-1)) + (1/sigma_c)*e_Epsi_c_star;

end;

%--------------------------------------------------------------------------
% Initval
%--------------------------------------------------------------------------

initval;
Tau= 1/3;         % home income tax
Tau_star= 1/3;         % foreign income tax
R =1/betta;           % home nominal interest rate
R_star =1/betta;           % foreign nominal interest rate
end;

%--------------------------------------------------------------------------
% Steady State
%--------------------------------------------------------------------------

steady_state_model;
%Tau= 1/3;         % home income tax
%Tau_star= 1/3;         % foreign income tax
%R =1/betta;           % home nominal interest rate
%R_star =1/betta;           % foreign nominal interest rate
Epsi_c     = 1;
Epsi_c_star     = 1;
A=1;
A_star=1;
W=1/(1-Tau);            % real wage
W_star=1/(1-Tau_star);            % real wage
Pi_H =betta*R;
Pi_F_star =betta*R_star;
Pi_new=((Pi_H^(1-theta)-kappa)/(1 - kappa))^(1/(1-theta));
Pi_new_star=((Pi_F_star^(1-theta)-kappa)/(1 - kappa))^(1/(1-theta));
V = (1 - kappa) * (Pi_new^(-theta)) * (Pi_H^theta)/(1-kappa* (Pi_H^theta));
V_star = (1 - kappa) * (Pi_new_star^(-theta)) * (Pi_F_star^theta)/(1- kappa* (Pi_F_star^theta));
N=find_n1_eq(V,V_star,Tau,Tau_star,nu,sigma_n,sigma_c);            % hours
N_star=find_n2_eq(V,V_star,Tau,Tau_star,nu,sigma_n,sigma_c);            % hours
Y=A*N/V;
Y_star=A_star*N_star/V_star;
G=N*Tau/(1-Tau);            % Government spending
G_star=N_star*Tau_star/(1-Tau_star);            % Government spending
C=Y-G;            % consumption
C_star=Y_star-G_star;            % consumption
S=1;
X1 = (Epsi_c^(sigma_c))*(C^(-sigma_c))*Y*(S^(nu/2-1))*W/(1-kappa*betta* (Pi_H^(theta)));
X1_star = (Epsi_c_star^(sigma_c))*(C_star^(-sigma_c))*Y_star*(S^(1-nu/2))*W_star/(1- kappa*betta* (Pi_F_star^(theta)));
X2 = (Epsi_c^(sigma_c))*(C^(-sigma_c))*Y*(S^(nu/2-1))/(1-kappa * betta*(Pi_H^(theta-1)));
X2_star = (Epsi_c_star^(sigma_c))*(C_star^(-sigma_c))*Y_star*(S^(1-nu/2))/(1- kappa * betta*(Pi_F_star^(theta-1)));
r = R/Pi_H;           % real interest rate
r_star = R_star/Pi_F_star;           % real interest rate
D=0;            % Government Debt
D_star=0;            % Government Debt
chi=1-(1-Tau)*(theta-1)/theta;
chi_star=1-(1-Tau_star)*(theta-1)/theta;
end;

%--------------------------------------------------------------------------
% Shocks
%--------------------------------------------------------------------------

shocks;
%var e_Epsi_c;      stderr .0064;
%var e_g;      stderr .016;
%var e_Epsi_c_star;      stderr .0064;
%var e_g_star;      stderr .016;
%var e_a_star;        stderr .0064;
var e_a;        stderr .0064;
end;

%--------------------------------------------------------------------------
% Simulation
%--------------------------------------------------------------------------
options_.debug=1
model_diagnostics;

planner_objective((1/2)*(C^(1-sigma_c)*Epsi_c^(sigma_c)/(1-sigma_c)+G^(1-sigma_c)/(1-sigma_c)-N^(1+sigma_n)/(1+sigma_n)+C_star^(1-sigma_c)*Epsi_c_star^(sigma_c)/(1-sigma_c)+G_star^(1-sigma_c)/(1-sigma_c)-N_star^(1+sigma_n)/(1+sigma_n)));
%ramsey_model(planner_discount=betta,instruments=(Tau,Tau_star,R,R_star));
%steady;
ramsey_policy(planner_discount=betta,order=1,instruments=(R,R_star,Tau,Tau_star),irf=100,nograph,noprint) C C_star N N_star R R_star Pi_H Pi_F_star Tau Tau_star D D_star;