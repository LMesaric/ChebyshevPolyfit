function [g, err] = ChebyshevPolyfit(f, degree, start, ending, specCorrection)

syms x t n;

f(x) = subs(f,x,x);

maxOverdose = 10;
errInner = zeros(maxOverdose, 2);
errInner = sym(errInner);

for overdose = 1:1:maxOverdose
    g = taylor(f, x, 'Order', degree+overdose, ...
        'ExpansionPoint', (start+ending)/2 + specCorrection);
    g = simplify(expand(g));
    
    for n = degree+overdose : -1 : degree+1
        tmpCheb = chebyshevT(n, x);
        C = coeffs(tmpCheb);
        tmpCheb = tmpCheb / C(end);
        tmpCheb = -subs(tmpCheb, x^n, 0);
        g = simplify(expand(subs(g, x^n, tmpCheb)));
    end
    
    errInner(overdose, 1) = CalculateError(f, g, start, ending);
    errInner(overdose, 2) = g(x);
end

[err, idx] = min(errInner(:,1));
g = errInner(idx,2);

end
