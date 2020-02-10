


% f = @(t,x) [-x(1)^3+x(2); x(1)-x(2)^3];

vectfieldn(@(t,x)fun(t,x),-10:.5:10,-10:.5:10)
hold on
% for i=-2:0.2:2
%   [ts,ys] = ode45(@(t,x)fun(t,x),[0,1],[1;i]);
%   plot(ys(:,1),ys(:,2))
%   
%   [ts,ys] = ode45(@(t,x)fun(t,x),[0,1],[i;-1]);
%   plot(ys(:,1),ys(:,2))
%   
%   [ts,ys] = ode45(@(t,x)fun(t,x),[0,1],[-1;i]);
%   plot(ys(:,1),ys(:,2))
%   
%   [ts,ys] = ode45(@(t,x)fun(t,x),[0,1],[i;1]);
%   plot(ys(:,1),ys(:,2))
% end
% hold off

[ts,ys] = ode45(@(t,x)fun(t,x),[0,1],[-10;0]);
plot(ys(:,1),ys(:,2))

[ts,ys] = ode45(@(t,x)fun(t,x),[0,1],[-2;2]);
plot(ys(:,1),ys(:,2))

hold off

function [y] = fun(t,x)
%     u = 0;
    u = 0.9*x(1)-3.2*x(2);
    sat = 10;
    if u > sat
        u = sat;
    end
    if u < -sat
        u = sat;
    end
    y = [x(2);-0.5*x(1)+1.5*x(2)+0.5*u];
end