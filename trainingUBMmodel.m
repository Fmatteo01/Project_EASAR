function ubm = trainingUBMmodel(trainingData)

    numGaussians = 8; % Number of GMM components
    options = statset('MaxIter', 100, 'Display', 'final');
    regularizationValue = 1e-5; % Regularisation to stabilise covariances
    
    ubm = fitgmdist(trainingData, numGaussians, 'Options', options,'RegularizationValue', regularizationValue);
    
    disp('Trained UBM model!');
end