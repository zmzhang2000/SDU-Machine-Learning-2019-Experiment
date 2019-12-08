function [theta, j, converged] = update_theta(X,Y,theta,lambda)
h = @(theta,x)(1/(1+exp(-theta'*x)));
m = size(X,1);
n = size(X,2)-1;

dJ = zeros(n+1,1);
for i = 1:n+1
    for j = 1:m
        xj = X(j,:)';
        dJ(i) = dJ(i) + (h(theta,xj)-Y(j))*xj(i);
    end
    if i~=1
        dJ(i) = dJ(i) + lambda*theta(i);
    end
    dJ(i) = dJ(i) / m;
end

H = zeros(n+1,n+1);
for i = 1:m
    xi = X(i,:)';
    H = H + h(theta,xi)*(1-h(theta,xi))*(xi*xi');
end
mat = eye(n+1,n+1);
mat(1,1) = 0;
H = H + lambda*mat;
H = H / m;

new_theta = theta - inv(H)*dJ;
if abs(new_theta-theta)<0.000001
    converged = 1;
else
    converged = 0;
end
theta = new_theta;

j = 0;
for i = 1:m
    xi = X(i,:)';
    j = j - Y(i)*log(h(theta,xi))-(1-Y(i))*log(1-h(theta,xi));
end
for i = 2:n
    j = j + lambda*theta(i)^2/2;
end
j = j / m;
