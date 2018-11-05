clear all;
close all;

function [assignments, centers] = kmeans(X, k)
	maxiter = 1000;
	centerRows = randperm(size(X)(1));
	centers = X(centerRows(1:k), :);
	numOfRows = length(X(:,1));
	numOfFeatures = length(X(1,:));
	assignments = ones(1, numOfRows);

	for iter = 1:maxiter
		clusterTotals = zeros(k, numOfFeatures);
		clusterSizes = zeros(k, 1);
		for rowIx = 1:numOfRows
			minDist = realmax;
			assignTo = 0;
			for centerIx = 1:k 
				% K-Means
				dist = sqrt(sum((X(rowIx, : ) - centers(centerIx, :)).^2));
				if dist < minDist
					minDist = dist;
					assignTo = centerIx;
				endif
			endfor
			assignments(rowIx) = assignTo;

			clusterTotals(assignTo, :) += X(rowIx, :);
			clusterSizes(assignTo)++;
		endfor

		for clusterIx = 1:k
			if (clusterSizes(clusterIx) == 0)
				randomRow = round(1 + rand() * (numOfRows - 1) );
				clusterTotals(clusterIx, :) =  X(randomRow, :);
				clusterSizes(clusterIx) = 1;
			endif
		endfor

		newCenters = zeros(k, numOfFeatures);
		for centerIx = 1:k 
			newCenters(centerIx, :) = clusterTotals(centerIx, : ) / clusterSizes(centerIx);
		endfor
	
		diff = sum(sum(abs(newCenters - centers)));
	
		if diff < eps
			break;
		endif
		centers = newCenters;
	endfor	
	assignments = assignments';
endfunction

x = load("test_data_40.txt");
kmeans(x,4)
