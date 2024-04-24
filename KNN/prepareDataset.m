function [features, labels] = prepareDataset(audioDir)
    % Get a list of all WAV files in the directory
    audioFiles = dir(fullfile(audioDir, '*.wav'));

    % Initialize output variables
    features = [];
    labels = [];

    % Check if any files were found
    if isempty(audioFiles)
        warning('No audio files found in the directory.');
        return;
    end

    % Loop over each file
    for i = 1:length(audioFiles)
        % Construct the full path to the audio file
        filePath = fullfile(audioDir, audioFiles(i).name);

        % Read the audio file
        [audioData, Fs] = audioread(filePath);

        % Extract features from the audio using the new function
        audioFeatures = extractAudioFeatures(audioData, Fs);

        % Determine the label based on the filename
        label = determineLabel(audioFiles(i).name);

        % Append features and label to the outputs
        features = [features; audioFeatures];
        labels = [labels; label];
    end
end


% Define determineLabel as a subfunction within the same file
function label = determineLabel(fileName)
    % Define nominal users with unique labels
    nominalUserNames = {'aaron', 'abel', 'daniel', 'courtney', 'andrew', 'jackson', 'rmani', 'rylee','reece','justice'};
    userLabels = 1:length(nominalUserNames);
    % , josh, aldo, brendan link
    % Initialize label as non-nominal
    label = 0; % Default to non-nominal user

    % Check if the filename contains any of the nominal user names and assign unique labels
    for idx = 1:numel(nominalUserNames)
        if contains(lower(fileName), lower(nominalUserNames{idx}))
            label = 1; %userLabels(idx);  % Assign the unique label for the found user
            break; % No need to check further names
        end
    end
end
