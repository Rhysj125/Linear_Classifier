function singleLayerNetworkTraining()
%Creates a single layer network classifier 

    close all;

    global numOfInputs;
    global learningRate;
    global data;
    learningRate = 0.001;
    numOfInputs = 2;
    weights = (numOfInputs);
    %data = [-10,-10,-5,-5,0,0,5,5,10,10; 0,-10,-10,4,-2,4,-2,5,-10,6];
    [data, outputVector, testingData, testingTargetClasses] = init();
    %data = generateUniformDataset();
    classA = [];
    classB = [];
    inputVector = [numOfInputs + 1, size(data,2)];
    iterationError = [];
    
    %Randomise weights
    for i = 1:numOfInputs + 1
        weights(i) = rand();
    end
    
    %create inputVector which includes a bias
    for i = 1: size(data, 2)
        for j = 1:numOfInputs
            inputVector(j,i) = data(j,i);
        end
        inputVector(numOfInputs + 1, i) = 1;
    end
    
    %Creating the target classification
%     for i = 1:size(inputVector,2)
%         if(sum(inputVector(:,i)) > 0)
%             outputVector(i) = 1;
%         else
%             outputVector(i) = 0;
%         end
%     end
    
    %initalising class to be -1;
    class = -1;
    
    %num of learning iterations
    for iteration = 1:100
        
        %setting the classes to be empty
        classA = [];
        classB = [];
        
        %Go through every data item
        for i = 1:size(data,2)
            net= [];
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
                classA = cat(2,classA, data(:,i));
            elseif (class == 0)
                classB = cat(2,classB,data(:,i));
            end

            %Trains the weights based off using the current data sample
            weights = updateWeights(weights, inputVector(:,i), outputVector(1,i), class);
            
        end
        
        %Works out the error over the entire dataset after training
        iterationError(iteration) = calcTotError(outputVector, inputVector, weights);
        
        %Modifying the learning rate to reduce error further
%         if (mod(iteration, 10) == 0)
%             learningRate = learningRate * 0.5;
%         end

    end
    
    disp(runOnTesting(testingData, testingTargetClasses, weights));
    
    %Plot each iterations error
    figure
    hold on
    plot(iterationError);
    xlabel('Iteration');
    ylabel('RMSE over entire dataset');
    hold off
    
    %plotting the graph
    %classA appear as red circles
    %classB appear as blue circles
    figure
    hold on
    plot(classA(1,:), classA(2,:), 'ro');
    plot(classB(1,:), classB(2,:), 'b+');
    legend('Class A','Class B');
    xlabel('x-dimension');
    ylabel('y-dimension');
    hold off
    
    data = generateUniformDataset();
    classA = [];
    classB = [];
    inputVector = [];

    %create inputVector which includes a bias
    for i = 1: size(data, 2)
        for j = 1:numOfInputs
            inputVector(j,i) = data(j,i);
        end
        inputVector(numOfInputs + 1, i) = 1;
    end
    
    for i = 1:length(inputVector)

        net = [];
        
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
            classA = cat(2,classA, data(:,i));
        elseif (class == 0)
            classB = cat(2,classB,data(:,i));
        end
    end
    
    figure
    hold on
    plot(classA(1,:), classA(2,:), 'ro');
    plot(classB(1,:), classB(2,:), 'b+');
    legend('Class A','Class B');
    xlabel('x-dimension');
    ylabel('y-dimension');
    hold off
    
end