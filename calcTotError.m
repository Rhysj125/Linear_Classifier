function iterationError = calcTotError(outputVector, inputVector, weightVector)
    
    %initalising error to be 0
    totalError = 0;

    %Iterates through every data sample to calculate the error
    for i = 1:size(outputVector, 2)
        net = [];
        %Calculates the output of the network for current data sample
        for j = 1:size(inputVector,1)
            net(j) = (inputVector(j,i) * weightVector(j));
        end
        
        %initalising the class
        class = -1;
        
        %Classifying the data
        % > 0; classA
        % < 0; classB
        if (sum(net) > 0)
             class = 1;
        else
             class = 0;
        end
        
        %calculates the total error
        totalError = totalError + ((outputVector(i) - class)^2);
    end
    
    %Calculating the RMSE
    %First calculating the mean
    %Second calculating the sqrt
    iterationError = totalError/size(outputVector, 2);
    iterationError = sqrt(iterationError);
    
end

