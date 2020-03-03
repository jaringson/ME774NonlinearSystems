syms x1 x2
z1 = x1 - 1;
z2 = x2 - 1;

% A = [-1,2;2,-1];
A = [-4,2;2,-4];
P = lyap(A',eye(2));

% x1dot = -(x1+x1^3)+2*x2;
% x2dot = 2*x1-(x2+x2^3);
% Vdot = 2*(x1dot*(x1*P(1,1) + x2*P(1,2)) + x2dot*(x1*P(2,1)+x2*P(2,2)));

z1dot = -(z1+1+(z1+1)^3)+2*(z2+1);
z2dot = 2*(z1+1)-(z2+1+(z2+1)^3);
Vdot = 2*(z1dot*(z1*P(1,1) + z2*P(1,2)) + z2dot*(z1*P(2,1)+z2*P(2,2)));

all_i = [];
all_j = [];
min_r = 1e8;

x = 0;
y = 0;

for i=-1.5:0.1:1.5
    for j=-1.5:0.1:1.5
    
        if subs(Vdot,{x1,x2}, {i+1,j+1}) >= 0
            all_i = [all_i, i];
            all_j = [all_j, j];
            
            r = norm([x;y] - [i;j],2);
            if r < min_r && i ~= x
                min_r = r;
            end
        end
    end
end

scatter(all_i, all_j, 'filled')
hold on

min_r 


th = 0:pi/50:2*pi;
xunit = min_r * cos(th) + x;
yunit = min_r * sin(th) + y;
h = plot(xunit, yunit);



vectfield(@(t,x)fun(t,x),-2:.1:2,-2:.1:2)
% hold on
% 
% [ts,ys] = ode45(@(t,x)fun(t,x),[0,50],[0;1]);
% plot(ys(:,1),ys(:,2))
% 
% [ts,ys] = ode45(@(t,x)fun(t,x),[0,50],[0;-1]);
% plot(ys(:,1),ys(:,2))
% 
% [ts,ys] = ode45(@(t,x)fun(t,x),[0,50],[0;1.01]);
% plot(ys(:,1),ys(:,2))
% 
% [ts,ys] = ode45(@(t,x)fun(t,x),[0,50],[-1;1.1]);
% plot(ys(:,1),ys(:,2))
% 
% [ts,ys] = ode45(@(t,x)fun(t,x),[0,50],[-1;0.9]);
% plot(ys(:,1),ys(:,2))
% 
% [ts,ys] = ode45(@(t,x)fun(t,x),[0,50],[1;-1.1]);
% plot(ys(:,1),ys(:,2))

hold off

function [y] = fun(t,x)
    y = [-(x(1)+1+(x(1)+1)^3)+2*(x(2)+1);
        2*(x(1)+1)-(x(2)+1+(x(2)+1)^3)];
end