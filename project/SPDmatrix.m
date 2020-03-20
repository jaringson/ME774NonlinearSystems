
res = zeros(1,10);

for i = 1:10
    M = generateSPDmatrix(2)
    res(i) = is_SPD(M);
end

disp(res);

function res = is_SPD(M)
    if (~issymmetric(M))
        res = false;
        return;
    end

    ev = eig(M);

    if (any(ev <= 0))
        res = false;
        return;
    end

    res = true;
end

function A = generateSPDmatrix(n)
    A = rand(n);
    A = 0.5 * (A + A');
    A = A + (n * eye(n));
end