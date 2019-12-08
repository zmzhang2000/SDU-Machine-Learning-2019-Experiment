x = load('ex2x.dat'); % 50*2
y = load('ex2y.dat'); % 50*1
m = size(x,1);

x = [ones(m,1),x]; % 50*3

theta = inv(x'*x)*x'*y

x = [1,1650,3];

y_hat = x*theta