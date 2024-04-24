audioDir = 'C:\Users\rmani\OneDrive\Documents\Sound Recordings wav';
% Path to the parent directory containing the subfolders
parentDir = 'sound_recording_wav';

% Prepare the training dataset
trainingDir = 'C:\Users\rmani\OneDrive\Documents\Sound Recordings wav\Training';
[trainingFeatures, trainingLabels] = prepareDataset(trainingDir);

% Prepare the validation dataset
validationDir = 'C:\Users\rmani\OneDrive\Documents\Sound Recordings wav\Validation';
[validationFeatures, validationLabels] = prepareDataset(validationDir);

% Prepare the test dataset
testDir = 'C:\Users\rmani\OneDrive\Documents\Sound Recordings wav\Testing';
[testFeatures, testLabels] = prepareDataset(testDir);
