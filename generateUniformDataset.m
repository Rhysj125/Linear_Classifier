function dataset = generateUniformDataset()
%Generates a random data set ranging from -10:10

    %Generates a 2D vector matrix.
    %row 1: x-value
    %row 2: y-value
    dataset = -10 + (20)*rand(2, 1000);
    
%     figure;
%     hold on
%     plot(dataset(1,:), dataset(2,:), 'ro');
%     xlabel('X values');
%     ylabel('Y values');
%     hold off
    
end

