function ChebyshevDemo

syms x;

f = sym(zeros(4,1));
g = sym(zeros(4,1));
err = zeros(4,1);

f(1) = exp(x);
f(2) = log(1+x);
f(3) = sin(x)/x;
f(4) = cos(x);

% g(1) = 0.00181258334235528*x^6 + 0.0080200206419458*x^5 + 0.0419670793931914*x^4 + 0.166391821690428*x^3 + 0.500099940056635*x^2 + 0.999987610323461*x + 1.00000138583625;
% g(2) = - 0.0312013789893733*x^6 + 0.101964634786825*x^5 - 0.187255939165997*x^4 + 0.30301542826567*x^3 - 0.492957605179448*x^2 + 0.999422879211686*x + 0.0000811859400770467;
% g(3) = 0.00000269375975765659*x^8 - 0.000198358664086584*x^6 + 0.00833331406945632*x^4 - 0.166666664261236*x^2 + 0.999999999951925;
% g(4) = 0.0000241212010831705*x^8 - 0.00138829603431855*x^6 + 0.0416664553753419*x^4 - 0.499999973621718*x^2 + 0.999999999472876;
% 
% err = [0.000002, 0.0001, 0.0000000001, 0.000000001] ;

[g(1), err(1)] = ChebyshevPolyfit(f(1), 6,  0, 1, 0.3762);
[g(2), err(2)] = ChebyshevPolyfit(f(2), 6,  0, 1, 0.1113);
[g(3), err(3)] = ChebyshevPolyfit(f(3), 8, -1, 1, 0);
[g(4), err(4)] = ChebyshevPolyfit(f(4), 8, -1, 1, 0);

% [g(1), err(1)] = ChebyshevPolyfit(f(1), 6,  0, 1, 0);
% [g(2), err(2)] = ChebyshevPolyfit(f(2), 6,  0, 1, 0);
% [g(3), err(3)] = ChebyshevPolyfit(f(3), 8, -1, 1, 0);
% [g(4), err(4)] = ChebyshevPolyfit(f(4), 8, -1, 1, 0);

% [g(1), err(1)] = ChebyshevPolyfitIntegral(f(1), 6,  0, 1, 10);
% [g(2), err(2)] = ChebyshevPolyfitIntegral(f(2), 6,  0, 1, 10);
% [g(3), err(3)] = ChebyshevPolyfitIntegral(f(3), 8, -1, 1, 10);
% [g(4), err(4)] = ChebyshevPolyfitIntegral(f(4), 8, -1, 1, 10);

digits(15);
g = vpa(g);
err = double(err);
disp(g);
disp(err);

figure('Renderer', 'painters', 'Position', [100 100 1500 900])

subplot(2,2,1);
fplot(g(1)-f(1));
xlim([0 1]);
ylim([-err(1)*1.5 err(1)*1.5]);
title('$g_1(x)-e^x$','Interpreter','latex','FontSize',14);
grid on;
grid minor;

subplot(2,2,2);
fplot(g(2)-f(2));
xlim([0 1]);
ylim([-err(2)*1.5 err(2)*1.5]);
title('$g_2(x)-\ln(1+x)$','Interpreter','latex','FontSize',14);
grid on;
grid minor;

subplot(2,2,3);
fplot(g(3)-f(3));
xlim([-1 1]);
ylim([-err(3)*1.5 err(3)*1.5]);
title('$g_3(x)-\frac{\sin(x)}{x}$','Interpreter','latex','FontSize',14);
grid on;
grid minor;

subplot(2,2,4);
fplot(g(4)-f(4));
xlim([-1 1]);
ylim([-err(4)*1.5 err(4)*1.5]);
title('$g_4(x)-\cos(x)$','Interpreter','latex','FontSize',14);
grid on;
grid minor;

end
