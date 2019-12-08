clc,clear,close all;
blue = load('ex3Data/ex3blue.dat'); % 14x2
red = load('ex3Data/ex3red.dat');

blue = blue';
red = red';

miu_blue = mean(blue,2);
miu_red = mean(red,2);

sw = (blue-miu_blue)*(blue-miu_blue)'+(red-miu_red)*(red-miu_red)';
sb = (miu_blue-miu_red)*(miu_blue-miu_red)';
theta = inv(sw)*(miu_blue-miu_red)

u = theta./sqrt(sum(theta.^2));
blue_projection = u*u'*blue;
red_projection = u*u'*red;

x = linspace(0,10,100);
y = x.*theta(2)./theta(1);

figure;
hold on;
scatter(blue(1,:),blue(2,:),'*b');
scatter(red(1,:),red(2,:),'*r');
plot(x,y,'k');
scatter(blue_projection(1,:),blue_projection(2,:),'b');
scatter(red_projection(1,:),red_projection(2,:),'r');
axis([0 10 0 10]);

figure;
hold on;
scatter(blue(1,:),blue(2,:),'*b');
scatter(red(1,:),red(2,:),'*r');
plot(x,y,'k');
scatter(blue_projection(1,:),blue_projection(2,:),'b');
scatter(red_projection(1,:),red_projection(2,:),'r');
line([blue(1,:);blue_projection(1,:)],[blue(2,:);blue_projection(2,:)],'Color','blue');
line([red(1,:);red_projection(1,:)],[red(2,:);red_projection(2,:)],'Color','red');
axis([0 10 0 10]);