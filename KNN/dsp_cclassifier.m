X_train = trainingFeatures;
Y_train = trainingLabels;
X_val = validationFeatures;
Y_val = validationLabels;

bestScore = -Inf;  % Initialize best score to a very low number
kRange = 1:40;  % Range of k values to test

% Initialize variables to store the best k and model based on custom score
bestK = 0;
bestModel = [];

% Initialize arrays to store confusion matrices for the best models
confMatrixTrain = [];  % Confusion matrix on the training set
confMatrixVal = [];  % Confusion matrix on the validation set

% Iterate over all k values to train the model and validate on the validation dataset
for k = 1:length(kRange)
    % Train the model on the entire training dataset with current k
    Mdl = fitcknn(X_train, Y_train, 'NumNeighbors', kRange(k));
    
    % Validate the model on the validation dataset
    valLabels = predict(Mdl, X_val);
    trainLabels = predict(Mdl, X_train);  % Predict labels on the training set as well

    % Custom scoring
    score = 0;
    for i = 1:numel(Y_val)
        if valLabels(i) == Y_val(i)
            if Y_val(i) == 0
                score = score + 1;  % Higher score for correctly predicting '0' (non-user)
            else
                score = score + 2;  % Lower score for correctly predicting '1' (user)
            end
        end
    end
    
    % Normalize score by the number of validation samples
    normalizedScore = score / numel(Y_val);
    
    % Check if the current k resulted in a higher score than what was previously recorded
    if normalizedScore > bestScore
        bestK = kRange(k);
        bestScore = normalizedScore;
        bestModel = Mdl;  % Save the model with the highest score
        confMatrixVal = confusionmat(Y_val, valLabels);  % Update confusion matrix for validation set
        confMatrixTrain = confusionmat(Y_train, trainLabels);  % Update confusion matrix for training set
    end
end

% Output the best k and its corresponding score
fprintf('Best k: %d with custom score: %.2f\n', bestK, bestScore);

% Display the confusion matrices for both training and validation sets
fprintf('Confusion Matrix for Training Set:\n');
disp(confMatrixTrain);
fprintf('Confusion Matrix for Validation Set:\n');
disp(confMatrixVal);

% The final model is already trained and validated to have the highest custom score
finalModel = bestModel;

% ROC Curve Analysis
figure;
numClasses = max(Y_train); % Assume labels are 0 to numClasses
for class = 1:numClasses
    % Convert labels to binary for the class vs. all others
    Y_val_binary = (Y_val == class);
    [~, score, ~] = predict(bestModel, X_val);
    
    % Calculate ROC curve data
    [Xp, Yp, T, AUC] = perfcurve(Y_val_binary, score(:, class), true);
    
    %subplot(2, ceil(numClasses/2), class);
    plot(Xp, Yp);
    xlabel('False Positive Rate');
    ylabel('True Positive Rate');
    title(sprintf('Class %d vs All - AUC: %.2f', class, AUC));
end
