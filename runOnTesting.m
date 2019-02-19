function classificationError = runOnTesting(testingData, testingTargetClasses, weights)

    global numOfInputs

    %create inputVector which includes a bias
    for i = 1: size(testingData, 2);
        for j = 1:numOfInputs
            inputVector(j,i) = testingData(j,i);
        end
        inputVector(numOfInputs + 1, i) = 1;
    end
    
    %create a seperate vector for the target outputs
    incorrectClassification = 0;
    
    classA = [];
    classB = [];
    
    %Classifies each item in the testing data
    for i = 1:size(testingData, 2)
        net=[];
        
        %Producing the output of the network
        for j = 1:numOfInputs + 1
            net(j) = inputVector(j,i)*weights(j);
        end
        
        %Checking what class the data belongs to
        % > 0; classA
        % < 0; classB
        if (sum(net) > 0)
            class = 1;
        else
            class = 0;
        end
        
        %Adding the data to correct class
        if (class == 1)
            classA = cat(2,classA, testingData(:,i));
            
            %Checking whether the testing data is in the correct class
            if(testingTargetClasses(1,i) == 0)
                incorrectClassification = incorrectClassification + 1;
            end
        elseif (class == 0)
            classB = cat(2,classB,testingData(:,i));
            
            %Checking whether the testing data is in the correct class
            if(testingTargetClasses(1,i) == 1)
                incorrectClassification = incorrectClassification + 1;
            end
        end
    end

    %return the percentage of wrongly classified data points
    classificationError = incorrectClassification/size(testingData,2) *100;

end

