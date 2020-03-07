


f = @(t,x) [-x(1)^3+x(2); x(1)-x(2)^3];

vectfieldn(f,-2:.1:2.5,-2:.1:2)
hold on
for y20=-2:0.2:2
  [ts,ys] = ode45(f,[0,10],[-2;y20]);
  plot(ys(:,1),ys(:,2))
  
  [ts,ys] = ode45(f,[0,10],[2;y20]);
  plot(ys(:,1),ys(:,2))
  
  
  [ts,ys] = ode45(f,[0,10],[y20,-2]);
  plot(ys(:,1),ys(:,2))
  
  [ts,ys] = ode45(f,[0,10],[y20,2]);
  plot(ys(:,1),ys(:,2))
end
hold off