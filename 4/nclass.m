clc,clear,close all;
figure;
hold on;
blue = load('ex3Data/ex3blue.dat'); % 14x2
red = load('ex3Data/ex3red.dat');
green = load('ex3Data/ex3green.dat');

blue = blue';
red = red';
green = green';

miu_blue = mean(blue,2);
miu_red = mean(red,2);
miu_green = mean(green,2);
miu = (size(blue,2).*miu_blue+size(red,2).*miu_red+size(green,2).*miu_green)./(size(blue,2)+size(red,2)+size(green,2));

sw = (blue-miu_blue)*(blue-miu_blue)'+(red-miu_red)*(red-miu_red)'+(green-miu_green)*(green-miu_green)';
sb = size(blue,2)*(miu_blue-miu)*(miu_blue-miu)'+size(red,2)*(miu_red-miu)*(miu_red-miu)'+size(green,2)*(miu_green-miu)*(miu_green-miu)';
[v, d] = eig(inv(sw)*sb);
[diag_d,idx] = sort(diag(d));
d = d(idx,idx);
v = v(:,idx);

u1 = v(:,2)./sqrt(sum(v(:,2).^2))
blue_projection = u1*u1'*blue;
red_projection = u1*u1'*red;
green_projection = u1*u1'*green;
u2 = v(:,1)./sqrt(sum(v(:,1).^2))
blue_projection2 = u2*u2'*blue;
red_projection2 = u2*u2'*red;
green_projection2 = u2*u2'*green;

x = linspace(-10,10,200);
y1 = x.*u1(2)./u1(1);
y2 = x.*u2(2)./u2(1);

plot(x,y1,'k');
plot(x,y2,'k');
scatter(blue(1,:),blue(2,:),'*b');
scatter(red(1,:),red(2,:),'*r');
scatter(green(1,:),green(2,:),'*g');
scatter(blue_projection(1,:),blue_projection(2,:),'b');
scatter(red_projection(1,:),red_projection(2,:),'r');
scatter(green_projection(1,:),green_projection(2,:),'g');
scatter(blue_projection2(1,:),blue_projection2(2,:),'b');
scatter(red_projection2(1,:),red_projection2(2,:),'r');
scatter(green_projection2(1,:),green_projection2(2,:),'g');
axis([-5 10 0 10]);

figure;
hold on;
scatter(blue(1,:),blue(2,:),'*b');
scatter(red(1,:),red(2,:),'*r');
scatter(green(1,:),green(2,:),'*g');
plot(x,y1,'k');
plot(x,y2,'k');
scatter(blue_projection(1,:),blue_projection(2,:),'b');
scatter(red_projection(1,:),red_projection(2,:),'r');
scatter(green_projection(1,:),green_projection(2,:),'g');
line([blue(1,:);blue_projection(1,:)],[blue(2,:);blue_projection(2,:)],'Color','blue');
line([red(1,:);red_projection(1,:)],[red(2,:);red_projection(2,:)],'Color','red');
line([green(1,:);green_projection(1,:)],[green(2,:);green_projection(2,:)],'Color','green');
scatter(blue_projection2(1,:),blue_projection2(2,:),'b');
scatter(red_projection2(1,:),red_projection2(2,:),'r');
scatter(green_projection2(1,:),green_projection2(2,:),'g');
line([blue(1,:);blue_projection2(1,:)],[blue(2,:);blue_projection2(2,:)],'Color','blue');
line([red(1,:);red_projection2(1,:)],[red(2,:);red_projection2(2,:)],'Color','red');
line([green(1,:);green_projection2(1,:)],[green(2,:);green_projection2(2,:)],'Color','green');
axis([-5 10 0 10]);