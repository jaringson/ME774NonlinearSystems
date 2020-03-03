n = 200;
x1 = linspace(-1,1,n);
x2 = linspace(-1,1,n);
[x1m,x2m] = meshgrid(x1,x2);

A = [0,-1;1,-1];
P = lyap(A',eye(2));

% V = [x1;x2]'*P*[x1;x2];
V = x1m.*(x1m*P(1,1) + x2m*P(1,2)) + x2m.*(x1m*P(2,1) + x2m*P(2,2));
contour(x1m,x2m,V,30)
hold on

x1dot = x1m.^3-x2m;
x2dot = x1m-x2m;
Vdot = 2*(x1dot.*(x1m*P(1,1) + x2m*P(1,2))+x2dot.*(x1m*P(2,1) + x2m*P(2,2)));

% contour(x1m,x2m,Vdot)

min_r = 1e8;

x = 0;
y = 0;

for i=1:n
    for j=1:n
        if Vdot(i,j) >= 0
            r = norm([x;y] - [x1m(i,j);x2m(i,j)],2);
            if r < min_r
                min_r = r;
            end

        end
    end

end
min_r

th = 0:pi/50:2*pi;
xunit = min_r * cos(th) + x;
yunit = min_r * sin(th) + y;
h = plot(xunit, yunit);


% vectfieldn(@(t,x)fun(t,x),-2:.1:2,-2:.1:2)

hold off

function [y] = fun(t,x)
    y = [x(1)^3-x(2);
        x(1)-x(2)];
end