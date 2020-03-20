
% vectfieldn(@(t,x)fun(t,x),-2:.1:2,-2:.1:2)
% vectfieldn(@(t,x)fun(t,x),-10:1:10,-10:1:10)

[ts,ys] = ode45(@(t,x)fun(t,x),[0,100],[2;2;1]);
plot3(ys(:,1),ys(:,2),ys(:,3))
hold on

% for i=-2:1:2
%    for j=-2:1:2
%         for k=-2:1:2
%             [ts,ys] = ode45(@(t,x)fun(t,x),[0,100],[i,j,k]);
%             plot3(ys(:,1),ys(:,2),ys(:,3))
% %             plot(ys(:,1), ys(:,2))
%         end
%         
%    end
%    
% end
[ts,ys] = ode45(@(t,x)fun(t,x),[0,100],[-2;4;5]);
plot3(ys(:,1),ys(:,2),ys(:,3))

[ts,ys] = ode45(@(t,x)fun(t,x),[0,100],[2;-4;-5]);
plot3(ys(:,1),ys(:,2),ys(:,3))

[ts,ys] = ode45(@(t,x)fun(t,x),[0,100],[5;4;-5]);
plot3(ys(:,1),ys(:,2),ys(:,3))

hold off

function [y] = fun(t,x)
    y = [x(2)+x(1)*x(3);
        -x(1)-x(2)+x(2)*x(3);
        -x(1)^2-x(2)^2];
end