function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%

minimum1 = intmax();

%model = svmTrain(X, y, 0.1, @(x1,x2) gaussianKernel(x1,x2,0.03));
%predictions = svmPredict(model, Xval);
%yval;
%predictions-yval;
%mean(predictions-yval)
i=0;
results = zeros(64,3);
length(results)
for Cnow = [0.01,0.03,0.1,0.3,1,3,10,30]
  for sigmanow = [0.01,0.03,0.1,0.3,1,3,10,30]
    model = svmTrain(X, y, Cnow, @(x1,x2) gaussianKernel(x1,x2,sigmanow));
    predictions = svmPredict(model, Xval);
    row = [mean(double(predictions ~= yval)),Cnow,sigmanow];
    results(i+1,:) = row;
    i=i+1
  endfor
endfor
results = sortrows(results,1);
C = results(1,2)
sigma = results(1,3)

% =========================================================================

end
