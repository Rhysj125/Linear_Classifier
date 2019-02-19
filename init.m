function [trainingData, trainingTarget, testingData, testingTarget] = init()

    %Set mean and covariance for class A
    Mean1 = [3; -1];
    Sigma1 = [0.5 0.95; 0.95 4];
    
    %Set mean and covariance for class B
    Mean2 = [-3; -1];
    Sigma2 = [0.5 0.95; 0.95 4];
    
    %Generate Training set
    trainingSamples = 1000;
    [trainingData, trainingTarget] = GenerateGaussianData(trainingSamples, Mean1, Sigma1, Mean2, Sigma2);
    
    %Generate Testing set
    testingSamples = 1000;
    [testingData, testingTarget] = GenerateGaussianData(testingSamples, Mean1, Sigma1, Mean2, Sigma2);
    
end

