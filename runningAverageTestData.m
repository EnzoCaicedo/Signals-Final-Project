function thresholds = runningAverageTestData(filename1, filename2, plotFFT)
    
    if nargin < 3 || nargin == 1
        plotFFT =  false;
    end
    
    if nargin == 1
        [xx, fs] = audioread(filename1);
        L1 = length(xx); % Length of the first signal
           
        T1 = fs/L1*(0:L1-1); % Frequency axis (in Hz) for FFT
        X = fft(xx); % Perform FFT on first sample for user
        NormalizeX = abs(X)/ max(abs(X)); % makes y-values from 0 to 1 on first signal
        maleWomenSpeakingRange1 = T1 >= 90 & T1 <= 255;
        runningAvg1 = movmean(NormalizeX, 20);

        runningAvgFiltered = runningAvg1(maleWomenSpeakingRange1);
        
        threshold1 = abs(max(runningAvg1));
        threshold2 = sum(runningAvgFiltered);
        
        thresholds = [threshold1, threshold2];
    end
    
    if nargin == 2 || nargin == 3
    % Reads the .wav files and stores the sampling frequency into fs and
    % fs2 as well as the signals in xx and yy, respectively
    [xx, fs] = audioread(filename1);
    [yy, fs2] = audioread(filename2);
    
    L1 = length(xx); % Length of the first signal
    L2 = length(yy); % Length of the second signal;
   
    T1 = fs/L1*(0:L1-1); % Frequency axis (in Hz) for FFT
    T2 = fs/L2*(0:L2-1); % Frequency axis (in Hz) for FFT 

    %Finds minimum length of both signals to be used for extracting the
    %running average
    minLength = min(length(xx), length(yy));

    X = fft(xx); % Perform FFT on first sample for user
    Y = fft(yy); % Perform FFT on second sample for user
    NormalizeX = abs(X)/ max(abs(X)); % makes y-values from 0 to 1 on first signal
    NormalizeY = abs(Y)/ max(abs(Y)); % makes y-values from 0 to 1 on second signal

    % The male frequency speaking range ranges from 90 to 155 Hz while the
    % female speaking range ranges from 165 to 255. To cut out the
    % unnnecessary background frequency noises in the background, the
    % vectors are limited to the speaking range for computing the running
    % average
    maleWomenSpeakingRange1 = T1 >= 90 & T1 <= 255;
    maleWomenSpeakingRange2 = T2 >= 90 & T2 <= 255;
    
    % Window size chosen arbitrarily, can be adjusted to anything
    runningAvg1 = movmean(NormalizeX, 20);
    runningAvg2 = movmean(NormalizeY, 20);

    runningAvg = (runningAvg1(1:minLength) + runningAvg2(1:minLength)) / 2;

    if length(xx) > length(yy)
        runningAvgFiltered = runningAvg(maleWomenSpeakingRange2);
    else 
        runningAvgFiltered = runningAvg(maleWomenSpeakingRange1);
    end
    
    % Identifies thresholds as the absolute maximum of the running average
    % and the sum of the male and women frequency speaking sections,
    % respectively
    threshold1 = abs(max(runningAvgFiltered));
    threshold2 = sum(runningAvgFiltered);
        
    thresholds = [threshold1, threshold2];
    end
    
    if plotFFT
        figure;
        plot(fs/L1*(0:L1-1), abs(X));
        title("Complex Magnitude of fft Spectrum");
        xlabel("f (Hz)");
        ylabel("|fft(X)|");
        xlim([50 1000]);

        figure;
        plot(fs/L2*(0:L2-1), abs(Y));
        title("Complex Magnitude of fft Spectrum");
        xlabel("f (Hz)");
        ylabel("|fft(X)|");
        xlim([50 1000]);
    end
end