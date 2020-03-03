n = 200;
x1 = linspace(-1,3,n);
x2 = linspace(-1,3,n);

x = 0;
y = 0;


z1 = x1 - 1;
z2 = x2 - 1;

% [x1m,x2m] = meshgrid(x1,x2);
[z1m,z2m] = meshgrid(z1,z2);


% A = [-1,2;2,-1];
A = [-4,2;2,-4];
P = lyap(A',eye(2));

% V = x1m.*(x1m*P(1,1) + x2m*P(1,2)) + x2m.*(x1m*P(2,1)+x2m*P(2,2));
% contour(x1m,x2m,V)
V = z1m.*(z1m*P(1,1) + z2m*P(1,2)) + z2m.*(z1m*P(2,1)+z2m*P(2,2));
contour(z1m,z2m,V,25)

hold on

% x1dot = -(x1m+x1m.^3)+2*x2m;
% x2dot = 2*x1m-(x2m+x2m.^3);
% Vdot = 2*(x1dot.*(x1m*P(1,1) + x2m*P(1,2)) + x2dot.*(x1m*P(2,1)+x2m*P(2,2)));
z1dot = -(z1m+1+(z1m+1).^3)+2*(z2m+1);
z2dot = 2*(z1m+1)-(z2m+1+(z2m+1).^3);
Vdot = 2*(z1dot.*(z1m*P(1,1) + z2m*P(1,2)) + z2dot.*(z1m*P(2,1)+z2m*P(2,2)));

% contour(x1,x2,Vdot)

min_r = 1e8;



for i=1:n
    for j=1:n
        if Vdot(i,j) >= 0
%             r = norm([x;y] - [x1m(i,j);x2m(i,j)],2);
            r = norm([x;y] - [z1m(i,j);z2m(i,j)],2);
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