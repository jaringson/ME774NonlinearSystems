syms x1 x2 x3 rho b c1 c2 c3 Ef
eqn1 = x2 == 0;
eqn2 = rho-b*x2-c1*x3*sin(x1) == 0;
eqn3 = -c2*x3+c3*cos(x1)+Ef == 0;

sol = solve([eqn1, eqn2, eqn3], [x1, x2, x3]);
x1Sol = simplify(sol.x1)
x2Sol = sol.x2
x3Sol = sol.x3