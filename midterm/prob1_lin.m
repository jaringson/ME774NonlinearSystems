clear
figure(2)

vectfieldn(@(t,x)fun(t,x),-2:.1:2,-2:.1:2)
% vectfieldn(@(t,x)fun(t,x),-10:1:10,-10:1:10)
hold on

[ts,ys] = ode45(@(t,x)fun(t,x),[0,10],[0;2]);
plot(ys(:,1),ys(:,2))

[ts,ys] = ode45(@(t,x)fun(t,x),[0,10],[0;-1]);
plot(ys(:,1),ys(:,2))

[ts,ys] = ode45(@(t,x)fun(t,x),[0,10],[0;1.01]);
plot(ys(:,1),ys(:,2))

[ts,ys] = ode45(@(t,x)fun(t,x),[0,10],[-1;1.1]);
plot(ys(:,1),ys(:,2))

[ts,ys] = ode45(@(t,x)fun(t,x),[0,10],[-2;0.9]);
plot(ys(:,1),ys(:,2))

[ts,ys] = ode45(@(t,x)fun(t,x),[0,10],[1;-2]);
plot(ys(:,1),ys(:,2))

hold off

function [y] = fun(t,x)
    mu = 0;
    A = [0,1;-1,mu];
    y = A * x;
end