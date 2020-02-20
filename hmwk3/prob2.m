lambda = 1;


w3 = fun_w3(0.1,0.1);

[ts,ys] = ode45(@(t,x)fun(t,x),[0,200],[0.1,0.1,w3]);
plot3(ys(:,1),ys(:,2),ys(:,3))
hold on


for w1=-4:.25:4
    for w2=-4:.25:4
        w3 = fun_w3(w1,w2);
        if isreal(w3)
            [ts,ys] = ode45(@(t,x)fun(t,x),[0,200],[w1;w2;w3]);
            plot3(ys(:,1),ys(:,2),ys(:,3))
            [ts,ys] = ode45(@(t,x)fun(t,x),[0,200],[w1;w2;-w3]);
            plot3(ys(:,1),ys(:,2),ys(:,3))
        end
        
    end
end

for w1=-4:.1:4
    for w2=-4:.1:4
        w3 = fun_w3(w1,w2);
        if isreal(w3)
            [ts,ys] = ode45(@(t,x)fun(t,x),[0,200],[w1;w2;w3]);
            plot3(ys(:,1),ys(:,2),ys(:,3))
            [ts,ys] = ode45(@(t,x)fun(t,x),[0,200],[w1;w2;-w3]);
            plot3(ys(:,1),ys(:,2),ys(:,3))
        end
        
    end
end


hold off

function out = fun_w3(w1,w2)
    I1 = 3;
    I2 = 2;
    I3 = 1;
    lambda = 1;
    out = ( (lambda^2 - I1^2*w1^2 - I2^2*w2^2) / I3^3) ^ 0.5;
end

function [y] = fun(t,x)
    I1 = 3;
    I2 = 2;
    I3 = 1;
    lambda = 1;
    y = [(1.0/I1)*(I2-I3)*x(2)*x(3);
        (1.0/I2)*(I3-I1)*x(1)*x(3);
        (1.0/I3)*(I1-I2)*x(1)*x(2)];
end