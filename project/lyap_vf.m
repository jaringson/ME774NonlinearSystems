clear
figure(1)

vectfield(@(t,x)fun(t,x),-4:.25:4,-4:.25:4)
% vectfieldn(@(t,x)fun(t,x),-10:1:10,-10:1:10)
hold on

[ts,ys] = ode45(@(t,x)fun(t,x),[0,100],[0;-4]);
plot(ys(:,1),ys(:,2))

[ts,ys] = ode45(@(t,x)fun(t,x),[0,100],[1;4]);
plot(ys(:,1),ys(:,2))

hold off

% fun(0,[0;10000])

function [y] = fun(t,x)
    rho = 1.0;
    gamma = -0.75;
    v = 1; 
    
    n_hat = [0; 0; 1];
    r_bar = [x(1); x(2); 0];
    r_bar_n = (r_bar' * n_hat) * n_hat;
    r_bar_t = (eye(3) - n_hat * n_hat') * r_bar;
    
    
    r_n = r_bar'*n_hat;
    r_t = norm(r_bar_t);
    r_hat_t = r_bar_t / r_t;
    
    
    alpha = 1/v * (r_n^2 + (r_t-rho)^2 + rho^2 * gamma^2)^0.5;
    
%     S_r_bar = gamma * normalize(cross(n_hat, r_bar_t)) / (alpha);
    S_r_bar = gamma * cross(n_hat, r_hat_t) / (alpha);
    
    Vf = 0.5 * (r_bar_n' * n_hat)^2 + 0.5*(r_bar_t' * r_hat_t - rho)^2;
    Vf_dot = r_n * n_hat' + (r_t - rho) * r_hat_t';
    
    Gamma = 1/alpha * eye(3);
    
    h = -(Vf_dot * Gamma)' + S_r_bar;
    
    if x(1) == 1 & x(2) == 0
       p = 0 
    end
    
    y = [h(1);h(2)];
end


