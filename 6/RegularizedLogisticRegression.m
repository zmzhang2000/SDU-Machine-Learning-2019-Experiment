clc, close all, clear all;
x = load('ex5Data/ex5Logx.dat');
y = load('ex5Data/ex5Logy.dat');
pos = find(y); neg = find(y == 0);
figure;
hold on;
plot(x(pos,1), x(pos,2), '+');
plot(x(neg,1), x(neg,2), 'o');

X = map_feature(x(:,1), x(:,2));
Y = y;

lambda_list = [0,1,10];
for i = 1:size(lambda_list,2)
    lambda = lambda_list(i);
    theta = zeros(size(X,2),1);
    for i = 1:100
        [theta, j, converged] = update_theta(X,Y,theta,lambda);
        if converged == 1
            break
        end
        j
    end
    theta
    figure;
    hold on;
    plot(x(pos,1), x(pos,2), '+');
    plot(x(neg,1), x(neg,2), 'o');
    title(['\lambda = ',num2str(lambda)]);
    plot_contour(theta);
end