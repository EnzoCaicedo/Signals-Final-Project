function label = testSingleVoice(finalModel, filePath)
    % Read the audio file
    [audioData, Fs] = audioread(filePath);
    
    % Extract features from the audio
    audioFeatures = extractAudioFeatures(audioData, Fs);
    
    % Predict the label using the trained k-NN model
    label = predict(finalModel, audioFeatures);
    
    % Output the result
    fprintf('The label for the voice sample is: %d\n', label);
end
