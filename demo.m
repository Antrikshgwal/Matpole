% demo.m
% Demonstration of MATLAB Interpolation Tool

clc; clear; close all;

disp('--- Demo: MATLAB Interpolation Tool ---');

% Sample dataset (Temperature vs Enthalpy)
x = [300 320 340 360 380 400];      % Temperature (K)
y = [10.2 12.5 14.8 17.3 20.1 23]; % Enthalpy (kJ/mol)

% Point to estimate
xi = 350; % Temperature (K)

% --- Apply interpolation methods ---
H_linear  = interp1(x, y, xi, 'linear');
H_spline  = interp1(x, y, xi, 'spline');
H_poly    = polyval(polyfit(x, y, length(x)-1), xi);

% Lagrange Interpolation
H_lagrange = 0;
for i = 1:length(x)
    L = 1;
    for j = 1:length(x)
        if i ~= j
            L = L * (xi - x(j)) / (x(i) - x(j));
        end
    end
    H_lagrange = H_lagrange + L * y(i);
end

% Newton Divided Difference
n = length(x);
dd = zeros(n, n);
dd(:,1) = y(:);
for j = 2:n
    for i = 1:n-j+1
        dd(i,j) = (dd(i+1,j-1) - dd(i,j-1)) / (x(i+j-1)-x(i));
    end
end
H_newton = dd(1,1);
prod = 1;
for j = 1:n-1
    prod = prod * (xi - x(j));
    H_newton = H_newton + dd(1,j+1) * prod;
end

% --- Display Results ---
fprintf('Interpolation Results at x = %.1f K:\n', xi);
fprintf('1. Linear            : %.4f kJ/mol\n', H_linear);
fprintf('2. Polynomial        : %.4f kJ/mol\n', H_poly);
fprintf('3. Lagrange          : %.4f kJ/mol\n', H_lagrange);
fprintf('4. Newton Divided    : %.4f kJ/mol\n', H_newton);
fprintf('5. Cubic Spline      : %.4f kJ/mol\n', H_spline);

% --- Visualization ---
xx = linspace(min(x), max(x), 200);
yy_spline = interp1(x, y, xx, 'spline');

figure;
plot(x, y, 'o', 'MarkerFaceColor','b','DisplayName','Data Points'); hold on;
plot(xx, yy_spline, 'r','LineWidth',1.5,'DisplayName','Cubic Spline');
plot(xi, H_spline, 'ks','MarkerSize',8,'MarkerFaceColor','g','DisplayName','Estimated Point');
xlabel('Temperature (K)'); ylabel('Enthalpy (kJ/mol)');
title('Demo: Interpolation on Thermophysical Data');
legend show; grid on;
