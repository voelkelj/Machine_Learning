function [C, sigma] = dataset3Params(X, y, Xval, yval)
%EX6PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = EX6PARAMS(X, y, Xval, yval) returns your choice of C and 
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



increms = incremsC = incremsSigma = [0.01, 0.03, 0.1, 0.3, 1.0, 3.0, 10.0, 30.0];

best = zeros(3, 1);
counter = 1;

for currC = incremsC
	for currSigma = incremsSigma
		fprintf(['Attempt #%d: C = %f, sigma = %f\n'], counter, currC, currSigma);
		model = svmTrain(X, y, currC, @(x1, x2) gaussianKernel(x1, x2, currSigma));
		predictions = svmPredict(model, Xval);
		predictionError = mean(double(predictions ~= yval))

		if(counter == 1)
			best = [predictionError, currC, currSigma]
		end

		if(predictionError < best(1))
				fprintf(['Found best so far %f\n'], predictionError)
				best = [predictionError, currC, currSigma];
		end
	end


		counter = counter +1
end
C = best(2)
sigma = best(3);



% =========================================================================

end
