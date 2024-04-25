function Y = fftForWaveFile(filename, plotFFT)
    
    if nargin < 2
        plotFFT =  false;
    end
   
    [xx, fs] = audioread(filename);

    L = length(xx); % Length of the signal
    t = (0:L - 1) / fs; % Time vector in seconds
    T = fs/L*(0:L-1);

    %%plot(t,xx); % Visualize the data

    Y = fft(xx); % Perform FFT

    if plotFFT
        figure;
        plot(fs/L*(0:L-1), abs(Y));
        title("Complex Magnitude of fft Spectrum");
        xlabel("f (Hz)");
        ylabel("|fft(X)|");
        xlim([50 1000]);
    end
end
