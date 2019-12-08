clc, close all;
[trainlabels, trainfeatures] = libsvmread('ex7Data/twofeature.txt');
pos = find(trainlabels==1); neg = find(trainlabels==-1);
figure;
hold on;
scatter(trainfeatures(pos,1), trainfeatures(pos,2), 'b', 'filled');
scatter(trainfeatures(neg,1), trainfeatures(neg,2), 'r', 'filled');

model = svmtrain(trainlabels, trainfeatures, '-s 0 -t 0 -c 1');

w = model.SVs'*model.sv_coef;
b = -model.rho;
if (model.Label(1) == -1)
    w = -w; b = -b;
end

A = -w(1)/w(2); B = -b/w(2);
f = @(x)(A*x+B);

x = linspace(0,4.5,100);
y = f(x);

figure;
hold on;
scatter(trainfeatures(pos,1), trainfeatures(pos,2), 'b', 'filled');
scatter(trainfeatures(neg,1), trainfeatures(neg,2), 'r', 'filled');
plot(x,y);

model = svmtrain(trainlabels, trainfeatures, '-s 0 -t 0 -c 100');

w = model.SVs'*model.sv_coef;
b = -model.rho;
if (model.Label(1) == -1)
    w = -w; b = -b;
end

A = -w(1)/w(2); B = -b/w(2);
f = @(x)(A*x+B);

x = linspace(0,4.5,100);
y = f(x);
figure;
hold on;
scatter(trainfeatures(pos,1), trainfeatures(pos,2), 'b', 'filled');
scatter(trainfeatures(neg,1), trainfeatures(neg,2), 'r', 'filled');
plot(x,y);
