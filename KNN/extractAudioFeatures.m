function features = extractVoiceFeatures(audioData, Fs)
    % Convert stereo to mono if necessary
    if size(audioData, 2) > 1
        audioData = mean(audioData, 2);
    end

    % Apply pre-emphasis filter to enhance high frequencies
    preEmphasisFilter = [1 -0.97];
    audioData = filter(preEmphasisFilter, 1, audioData);

    % Define the window size for FFT and create the window vector
    fftWindowLength = 2048;

    % Calculate Pitch/Fundamental Frequency (F0)
    [f0, ~] = pitch(audioData, Fs);

    % Calculate the mean and standard deviation of fundamental frequency
    avgPitch = mean(f0);
    stdPitch = std(f0);

    % Calculate Zero Crossing Rate (ZCR)
    zcr = sum(abs(diff(audioData > 0))) / length(audioData);

    % Calculate the log energy
    logEnergy = log10(sum(audioData.^2) + 1);

    % Calculate spectral features using external functions
    centroidValue = spectralCentroid(audioData, Fs, fftWindowLength);
    rolloffValue = spectralRollOff(audioData, Fs, fftWindowLength);

    % Concatenate features into a single vector
    features = [ avgPitch, stdPitch, zcr, logEnergy, ...
                centroidValue, rolloffValue];
end

% Function to calculate the spectral centroid
function centroid = spectralCentroid(audioData, Fs, fftWindowLength)
    window = hamming(fftWindowLength);
    [S, F, T] = spectrogram(audioData, window, round(0.75*fftWindowLength), fftWindowLength, Fs);
    S = abs(S);
    F = F(:);
    centroid = sum(bsxfun(@times, S, F), 1) ./ sum(S, 1);
    centroid = mean(centroid); % Average over time frames
end

% Function to calculate the spectral roll-off
function rolloff = spectralRollOff(audioData, Fs, fftWindowLength, percentage)
    if nargin < 4
        percentage = 0.85; % Default to 85%
    end
    window = hamming(fftWindowLength);
    [S, F, T] = spectrogram(audioData, window, round(0.75*fftWindowLength), fftWindowLength, Fs);
    S = abs(S);
    cumulativeEnergy = cumsum(S ./ sum(S, 1), 1);
    rolloff = arrayfun(@(col) find(cumulativeEnergy(:,col) >= percentage, 1), 1:size(cumulativeEnergy, 2));
    rolloff = mean(F(rolloff)); % Average over time frames
end
