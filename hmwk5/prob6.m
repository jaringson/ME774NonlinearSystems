A = [0, 0, 1.0, 0;
    0, 0, 0, 1.0;
    0, -1.7294, -0.0471, 0;
    0, 17.2941, 0.0706, 0];

eig(A)
% syms lamb
% temp = det(lamb*eye(4)-A) == 0;
% solve(temp)