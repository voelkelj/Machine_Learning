function centroids = computeCentroids(X, idx, K)
%COMPUTECENTROIDS returs the new centroids by computing the means of the 
%data points assigned to each centroid.
%   centroids = COMPUTECENTROIDS(X, idx, K) returns the new centroids by 
%   computing the means of the data points assigned to each centroid. It is
%   given a dataset X where each row is a single data point, a vector
%   idx of centroid assignments (i.e. each entry in range [1..K]) for each
%   example, and K, the number of centroids. You should return a matrix
%   centroids, where each row of centroids is the mean of the data points
%   assigned to it.
%

% Useful variables
[m n] = size(X);

% You need to return the following variables correctly.
centroids = zeros(K, n);


% ====================== YOUR CODE HERE ======================
% Instructions: Go over every centroid and compute mean of all points that
%               belong to it. Concretely, the row vector centroids(i, :)
%               should contain the mean of the data points assigned to
%               centroid i.
%
% Note: You can use a for-loop over the centroids to compute this.
%

% X = [x11 x12 x13;%data point 1
%      x21 x22 x23]%data point 2 data set where each row represents a point
% idx = [1;3] indices of the closest centroids
% K the number of centroids


for i = 1 : K%loop over the indices i of all centroids
	is_assigned_to_i = idx(:) == i;%get vector containing 1 if corresponding row is assigned to i, 0 otherwise
	%data_points_assigned_to_i = X(is_assigned_to_i == 1,:)
	data_points_assigned_to_i = X(is_assigned_to_i,:);%get data points of X that are assigned to i
	
	%compute mean and store in centroids matrix

	centroids(i,:) = mean(data_points_assigned_to_i);



end









% =============================================================


end

