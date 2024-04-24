% Define the directory containing the audio files
directoryPath = 'C:\Users\rmani\OneDrive\Documents\Sound Recordings wav\Testing';

% Get a list of all .wav files in the directory
files = dir(fullfile(directoryPath, '*.wav'));

% Predict labels using the final model
predictedLabels = predict(finalModel, testFeatures);



for i = 1:length(files)
    % Construct the full path to the file
    testFilePath = fullfile(directoryPath, files(i).name);
    
    % Extract the user's name from the file name
    nameParts = split(files(i).name, '_');
    userName = nameParts{1};

    % Print the user's name and predicted label
    fprintf('Testing with %s, Predicted Label: %d\n', userName, predictedLabels(i));
end
% Calculate the confusion matrix
confMatrix = confusionmat(testLabels, predictedLabels);

% Display the confusion matrix
fprintf('Confusion Matrix for Test Data:\n');
disp(confMatrix);