clc,clear,close all;
x = load('ex4x.dat')';
x = [x;ones(1,size(x,2))];
y = load('ex4y.dat')';

pos = find(y(1,:) == 1);
neg = find(y(1,:) == 0);

figure
xlabel('Exam 1 score');
ylabel('Exam 2 score');
hold on
plot(x(1,pos),x(2,pos),'+');
plot(x(1,neg),x(2,neg),'o');

h = @(theta, x) 1.0./(1.0+exp(-theta'*x));
J = @(theta) mean(-y.*log(h(theta,x))-(1-y).*log(h(theta,x)));
dJ = @(theta) mean((h(theta,x)-y).*x,2);
H = @(theta) (h(theta,x).*(1-h(theta,x)).*x)*x'./size(x,2);
theta = [0;0;0];
i = 1;
while 1
    step(i)=i;
    cost(i) = J(theta);
    d = inv(H(theta))*dJ(theta);
    theta = theta - d;
    if abs(d)<0.00001
        break
    end
    i = i+1;
    step(i) = i;
end
x_plot = linspace(10,70,100);
y_plot = -(x_plot.*theta(1)./theta(2)+theta(3)./theta(2));
plot(x_plot,y_plot);
legend('Admitted','Not admitted','Decision boundary');

figure
plot(step,cost);
theta
h(theta,[20;80;1])