function r = find_n2_eq(V,V_star,Tau,Tau_star,nu,sigma_n,sigma_c)
n0=[2*0.793701,2*0.793701];
n = fsolve(@(n) n_ss(n(1),n(2),V,V_star,Tau,Tau_star,nu,sigma_n,sigma_c),n0);
r=n(2);
end

function n2 = n_ss(n,n_star,V,V_star,Tau,Tau_star,nu,sigma_n,sigma_c)
n2(1) = n/V-n*(Tau)/(1-Tau)-(nu/2)*n^(-sigma_n/sigma_c)-(1-nu/2)*n_star^(-sigma_n/sigma_c);
n2(2) = n_star/V_star-n_star*(1-2*Tau_star)/(1-Tau_star)-(1-nu/2)*n^(-sigma_n/sigma_c)-(nu/2)*n_star^(-sigma_n/sigma_c);
end
