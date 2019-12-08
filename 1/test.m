x = load('ex1x.dat'); % 50*1
y = load('ex1y.dat'); % 50*1
plot(x,y,'o');
ylabel('height in meters')
xlabel('age in years')

m = length(y);
x = [ones(m,1),x]; % 50*2

J = @(x,y,theta) mean((x*theta-y).^2)./2;
alpha = 0.07;
theta = [0;0]; % 2*1
h = @(theta,x) x*theta;
% h(x)-y 50*1
update = @(x,y,theta,alpha) theta-alpha*(x'*(h(theta,x)-y))./size(y,1);
for i = 1:1500
    theta = update(x,y,theta,alpha);
    loss(i) = J(x,y,theta);
end

hold on
plot(x(:,2),x*theta,'-')
legend('Training data','Linear regression')

figure;
plot([1:1:1500],loss,'-')

theta
test1 = [1,3.5];
test1*theta
test2 = [1,7];
test2*theta


J_vals = zeros(100,100);
theta0_vals = linspace(-3,3,100);
theta1_vals = linspace(-1,1,100);
for i = 1:length(theta0_vals)
    for j = 1:length(theta1_vals)
        t = [theta0_vals(i);theta1_vals(j)];
        J_vals(i,j) = J(x,y,t);
    end
end
J_vals = J_vals';
figure;
surf(theta0_vals,theta1_vals,J_vals)
xlabel('\theta_0');
ylabel('\theta_1');
zlabel('loss');
figure;
contour(theta0_vals,theta1_vals,J_vals)
xlabel('\theta_0');
ylabel('\theta_1');
zlabel('loss');