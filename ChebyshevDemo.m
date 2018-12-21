function ChebyshevDemo

syms x;

f = sym(zeros(4,1));
g = sym(zeros(4,1));
err = zeros(4,1);

f(1) = exp(x);
f(2) = log(1+x);
f(3) = sin(x)/x;
f(4) = cos(x);

% Expand Taylor series around hand-picked point.
[g(1), err(1)] = ChebyshevPolyfit(f(1), 6,  0, 1, 0.3762);
[g(2), err(2)] = ChebyshevPolyfit(f(2), 6,  0, 1, 0.1113);
[g(3), err(3)] = ChebyshevPolyfit(f(3), 8, -1, 1, 0);
[g(4), err(4)] = ChebyshevPolyfit(f(4), 8, -1, 1, 0);

% Expand Taylor series around the central point.
% [g(1), err(1)] = ChebyshevPolyfit(f(1), 6,  0, 1, 0);
% [g(2), err(2)] = ChebyshevPolyfit(f(2), 6,  0, 1, 0);
% [g(3), err(3)] = ChebyshevPolyfit(f(3), 8, -1, 1, 0);
% [g(4), err(4)] = ChebyshevPolyfit(f(4), 8, -1, 1, 0);

% Calculate using integrals.
% [g(1), err(1)] = ChebyshevPolyfitIntegral(f(1), 6,  0, 1, 15);
% [g(2), err(2)] = ChebyshevPolyfitIntegral(f(2), 6,  0, 1, 15);
% [g(3), err(3)] = ChebyshevPolyfitIntegral(f(3), 8, -1, 1, 15);
% [g(4), err(4)] = ChebyshevPolyfitIntegral(f(4), 8, -1, 1, 15);

digits(25);
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
