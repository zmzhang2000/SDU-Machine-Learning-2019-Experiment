clc, close all;
[trainlabels50, trainfeatures50] = libsvmread('ex7Data/email_train-50.txt');
[trainlabels100, trainfeatures100] = libsvmread('ex7Data/email_train-100.txt');
[trainlabels400, trainfeatures400] = libsvmread('ex7Data/email_train-400.txt');
[trainlabelsall, trainfeaturesall] = libsvmread('ex7Data/email_train-all.txt');
[testlabels, testfeatures] = libsvmread('ex7Data/email_test.txt');

model50 = svmtrain(trainlabels50, trainfeatures50, '-s 0 -t 0');
[predicted_label50, accuracy50, prob_estimates50] = svmpredict(testlabels,testfeatures,model50,'q');

model100 = svmtrain(trainlabels100, trainfeatures100, '-s 0 -t 0');
[predicted_label100, accuracy100, prob_estimates100] = svmpredict(testlabels,testfeatures,model100,'q');

model400 = svmtrain(trainlabels400, trainfeatures400, '-s 0 -t 0');
[predicted_label400, accuracy400, prob_estimates400] = svmpredict(testlabels,testfeatures,model400,'q');

model_all = svmtrain(trainlabelsall, trainfeaturesall, '-s 0 -t 0');
[predicted_label_all, accuracy_all, prob_estimates_all] = svmpredict(testlabels,testfeatures,model_all,'q');