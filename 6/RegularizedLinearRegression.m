clc, close all, clear all;
x = load('ex5Data/ex5Linx.dat');
y = load('ex5Data/ex5Liny.dat');

X = [ones(size(x,1),1),x,x.^2,x.^3,x.^4,x.^5];
poly_x = linspace(-1,1);
m = size(X,1);
n = size(X,2)-1;
mat = eye(n+1);
mat(1,1) = 0;

lambda = 0;
theta = inv(X'*X+lambda*mat)*X'*y

figure;
hold on;
scatter(x,y, 'filled','r');
plot(poly_x,polyval(flipud(theta),poly_x));
title('\lambda = 0');

lambda = 1;
theta = inv(X'*X+lambda*mat)*X'*y

figure;
hold on;
scatter(x,y, 'filled','r');
plot(poly_x,polyval(flipud(theta),poly_x));
title('\lambda = 1');

lambda = 10;
theta = inv(X'*X+lambda*mat)*X'*y

figure;
hold on;
scatter(x,y, 'filled','r');
plot(poly_x,polyval(flipud(theta),poly_x));
title('\lambda = 10');