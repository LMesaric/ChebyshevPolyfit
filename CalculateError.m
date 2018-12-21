function maxError = CalculateError(f1, f2, start, ending)

syms x;

error(x) = subs(f1,x,x) - subs(f2,x,x);
maxError = 0;

for k = start:0.01:ending
    try
        tmp = abs(error(k));
        if tmp > maxError
            maxError = tmp;
        end
    catch
    end
end

end
