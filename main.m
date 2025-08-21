clc; clear;
disp('--- MATLAB Interpolation Tool ---');

x = input('Enter x-data points as a vector: ');
y = input('Enter y-data points as a vector: ');
xi = input('Enter the value of x to estimate: ');

disp('Choose interpolation method:');
disp('1. Linear');
disp('2. Polynomial');
disp('3. Lagrange');
disp('4. Newton Divided Difference');
disp('5. Cubic Spline');
choice = input('Enter your choice: ');


switch choice
    case 1
        yi = interp1(x, y, xi, 'linear');
        method = 'Linear Interpolation';

    case 2
        p = polyfit(x, y, length(x)-1);
        yi = polyval(p, xi);
        method = 'Polynomial Interpolation';

    case 3
        yi = 0;
        for i = 1:length(x)
            L = 1;
            for j = 1:length(x)
                if i ~= j
                    L = L * (xi - x(j)) / (x(i) - x(j));
                end
            end
            yi = yi + L * y(i);
        end
        method = 'Lagrange Interpolation';

    case 4
        % Newton Divided Difference
        n = length(x);
        dd = zeros(n, n);
        dd(:,1) = y(:);
        for j = 2:n
            for i = 1:n-j+1
                dd(i,j) = (dd(i+1,j-1) - dd(i,j-1)) / (x(i+j-1)-x(i));
            end
        end
        yi = dd(1,1);
        prod = 1;
        for j = 1:n-1
            prod = prod * (xi - x(j));
            yi = yi + dd(1,j+1) * prod;
        end
        method = 'Newton Divided Difference';

    case 5
        yi = interp1(x, y, xi, 'spline');
        method = 'Cubic Spline Interpolation';

    otherwise
        disp('Invalid choice!');
        return;
end
% Generate smooth curve
xx = linspace(min(x), max(x), 200);
yy = interp1(x, y, xx, 'spline'); % default visualization

figure;
plot(x, y, 'o', 'MarkerFaceColor', 'b'); hold on;
plot(xx, yy, 'r', 'LineWidth', 1.5);
plot(xi, yi, 'ks', 'MarkerSize', 8, 'MarkerFaceColor', 'g');
xlabel('x'); ylabel('y');
title(['Interpolation using ', method]);
legend('Data Points', 'Interpolated Curve', 'Estimated Point');
grid on;

disp(['Estimated value at x = ', num2str(xi), ' is y = ', num2str(yi)]);
