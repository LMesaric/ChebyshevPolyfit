function [g, err] = ChebyshevPolyfitIntegral(f, degree, start, ending, accuracy)

syms x t n;

toIntegrate(t, n) = subs(f, x, cos(t)) * cos(n*t);

g1(x) = 1/pi * int(toIntegrate(t, 0), t, 0, pi) * chebyshevT(0, x);

digits(accuracy+4);
for k = 1:degree
    c_k = 2/pi * vpa(int(toIntegrate(t, k), t, 0, pi));
    g1 = g1 + c_k * chebyshevT(k, x);
end

digits(accuracy);
g2(x) = simplify(expand(g1));
g(x) = vpa(g2);

err = CalculateError(f, g, start, ending);

end
