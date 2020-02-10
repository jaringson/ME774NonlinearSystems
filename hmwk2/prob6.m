vectfieldn(@(t,x)fun(t,x),-10:.5:10,-10:.5:10)
hold on

[ts,ys] = ode45(@(t,x)fun(t,x),[0,50],[0;2]);
plot(ys(:,1),ys(:,2))
hold on

[ts,ys] = ode45(@(t,x)fun(t,x),[0,100],[0;-2]);
plot(ys(:,1),ys(:,2))

[ts,ys] = ode45(@(t,x)fun(t,x),[0,50],[0;0]);
plot(ys(:,1),ys(:,2))

hold off

function [y] = fun(t,x)
    I = 2;
    epsilon = 0.1;
    b0 = 2;
    b1 = 1 .5;
    y = [x(1)-1/3*x(1)^3-x(2)+I; epsilon*(b0+b1*x(1)-x(2))];
end