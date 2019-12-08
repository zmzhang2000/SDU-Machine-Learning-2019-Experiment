x = load('ex2x.dat'); % 50*2
y = load('ex2y.dat'); % 50*1
m = size(x,1);
scatter(x(:,1),x(:,2));
xlabel('x1');
ylabel('x2');

x = [ones(m,1),x]; % 50*3
sigma = std(x);
mu = mean(x);
x(:,2) = (x(:,2) - mu(2))./sigma(2);
x(:,3) = (x(:,3) - mu(3))./sigma(3);

cost = @(x,y,theta) mean((x*theta-y).^2)./2;
h = @(theta,x) x*theta;
update = @(x,y,theta,alpha) theta-alpha*(x'*(h(theta,x)-y))./size(y,1);

theta = zeros(size(x(1,:)))';
alpha = 0.01;
J1 = zeros(50,1);

for num_iterations = 1:50
    J1(num_iterations) = cost(x,y,theta);
    theta = update(x,y,theta,alpha);
end

figure;
plot(0:49,J1(1:50),'b-');
xlabel("Number of iterations");
ylabel("Cost J");
hold on;

theta = zeros(size(x(1,:)))';
alpha = 0.1;
J2 = zeros(50,1);

for num_iterations = 1:50
    J2(num_iterations) = cost(x,y,theta);
    theta = update(x,y,theta,alpha);
end

plot(0:49,J2(1:50),'r-');

theta = zeros(size(x(1,:)))';
alpha = 1;
J3 = zeros(50,1);

for num_iterations = 1:50
    J3(num_iterations) = cost(x,y,theta);
    theta = update(x,y,theta,alpha);
end

plot(0:49,J3(1:50),'k-');
theta

x = [1,1650,3];
x(2) = (x(2)-mu(2))./sigma(2);
x(3) = (x(3)-mu(3))./sigma(3);
x

y_hat = h(theta,x)
