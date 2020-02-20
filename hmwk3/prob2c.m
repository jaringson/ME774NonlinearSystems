syms lam I1 I2 I3

A1 = [0,0,0;0,0,lam*(I3-I1)/(I1*I2);0,lam*(I1-I2)/(I1*I3),0];
eig(A1)