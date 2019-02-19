function weights = updateWeights(weightVector,inputVector, tragetOutput, currentOutput)
%updateWeights Updates the current weight vector to the new weight vector using the delta rule

    %initialise learning rate
    global learningRate; 

    %delta rule
    %-(XiT(yi-oi))
    error =(tragetOutput - currentOutput);
    errorGradient = -(inputVector'*error);
    %Updating the current weight to the new weight
    weightVector = weightVector - learningRate*errorGradient;

    %return the new weight vector
    weights = weightVector;
    
end

