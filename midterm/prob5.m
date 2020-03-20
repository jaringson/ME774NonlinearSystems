
% vectfieldn(@(t,x)fun(t,x),-2:.1:2,-2:.1:2)
% vectfieldn(@(t,x)fun(t,x),-10:1:10,-10:1:10)

[ts,ys] = ode45(@(t,x)fun(t,x),[0,100],[2;2;-1;0;0;0]);
plot3(ys(:,1),ys(:,2),ys(:,3))
hold on

% [ts,ys] = ode45(@(t,x)fun(t,x),[0,100],[-2;4;5;0;0;0]);
% plot3(ys(:,1),ys(:,2),ys(:,3))
% 
% [ts,ys] = ode45(@(t,x)fun(t,x),[0,100],[-2;4;5;0;0;0]);
% plot(ys(:,1),ys(:,2))
% 
% [ts,ys] = ode45(@(t,x)fun(t,x),[0,10],[-1;1.1]);
% plot(ys(:,1),ys(:,2))
% 
% [ts,ys] = ode45(@(t,x)fun(t,x),[0,10],[-2;0.9]);
% plot(ys(:,1),ys(:,2))
% 
% [ts,ys] = ode45(@(t,x)fun(t,x),[0,10],[1;-2]);
% plot(ys(:,1),ys(:,2))

function [y] = fun(t,x)
    I1 = 3;
    I2 = 2;
    I3 = 1;
    d = 1;
    k = 1;
    y = [(1/I1)*((I2-I3)*x(2)*x(3)-k*x(1)-x(4)-d);
        (1/I2)*((I3-I1)*x(1)*x(3)-k*x(2)-x(5)-d);
        (1/I3)*((I1-I2)*x(1)*x(2)-k*x(3)-x(6)-d);
        x(1);
        x(2);
        x(3)];
end