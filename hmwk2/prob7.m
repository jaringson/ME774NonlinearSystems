[ts,ys] = ode45(@(t,x)fun(t,x),[0,50],[0;2;0]);
plot3(ys(:,1),ys(:,2),ys(:,3))
hold on

[ts,ys] = ode45(@(t,x)fun(t,x),[0,50],[0;-2;0]);
plot3(ys(:,1),ys(:,2),ys(:,3))

[ts,ys] = ode45(@(t,x)fun(t,x),[0,50],[0;2.01;0]);
plot3(ys(:,1),ys(:,2),ys(:,3))

% [ts,ys] = ode45(@(t,x)fun(t,x),[0,50],[1;5.01;-1]);
% plot3(ys(:,1),ys(:,2),ys(:,3))

hold off

function [y] = fun(t,x)
    sig = 10;
    b = 8/3;
    r = 28;
    y = [sig*(x(2)-x(1)); r*x(1)-x(2)-x(1)*x(3); x(1)*x(2)-b*x(3)];
end