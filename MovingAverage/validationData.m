% Choose one audio files randomly for each nominal user
DJIndeces2 = randperm(length(DJFiles), 1);
ChrisIndeces2 = randperm(length(ChrisFiles), 1);
JuanIndeces2 = randperm(length(JuanFiles), 1);
GracieIndeces2 = randperm(length(GracieFiles), 1);
KatelynIndeces2 = randperm(length(KatelynFiles),1);
NobleIndeces2 = randperm(length(NobleFiles), 1);
StephensIndeces2 = randperm(length(StephensFiles), 1);
PeytonIndeces2 = randperm(length(PeytonFiles), 1);
AssefaIndeces2 = randperm(length(AssefaFiles), 1);
RmaniIndeces2 = randperm(length(RmaniFiles), 1);

% Choose one audio file randomly for each user
JusticeIndeces2 = randperm(length(JusticeFiles), 1);
NguyenIndeces2 = randperm(length(NguyenFiles), 1);
OchoaIndeces2 = randperm(length(OchoaFiles), 1);
MycahIndeces2 = randperm(length(MycahFiles), 1);

% Gets the selected file .wav names in the respective vectors
SelectedDJFile = DJFiles(DJIndeces2);
SelectedChrisFile = ChrisFiles(ChrisIndeces2);
SelectedJuanFile = JuanFiles(JuanIndeces2);
SelectedGracieFile = GracieFiles(GracieIndeces2);
SelectedKatelynFile = KatelynFiles(KatelynIndeces2);
SelectedNobleFile = NobleFiles(NobleIndeces2);
SelectedStephensFile = StephensFiles(StephensIndeces2);
SelectedPeytonFile = PeytonFiles(PeytonIndeces2);
SelectedAssefaFile = AssefaFiles(AssefaIndeces2);
SelectedRmaniFile = RmaniFiles(RmaniIndeces2);
SelectedJusticeFile = JusticeFiles(JusticeIndeces2);
SelectedNguyenFile = NguyenFiles(NguyenIndeces2);
SelectedOchoaFile = OchoaFiles(OchoaIndeces2);
SelectedMycahFile = MycahFiles(MycahIndeces2);

% Initializes the FFT variables as size of 2 (each nominal user takes 2
% samples)
DJValidation = zeros(1,2);
ChrisValidation = zeros(1,2);
JuanValidation = zeros(1,2);
GracieValidation = zeros(1,2);
KatelynValidation = zeros(1,2);
NobleValidation = zeros(1,2);
StephensValidation = zeros(1,2);
PeytonValidation = zeros(1,2);
AssefaValidation = zeros(1,2);
RmaniValidation = zeros(1,2);
JusticeValidation = zeros(1,2);
NguyenValidation = zeros(1,2);
OchoaValidation = zeros(1,2);
MycahValidation = zeros(1,2);

% Compute FFT for each sample
    DJValidation = runningAverageTestData(SelectedDJFile{1});
    title('DJ');
    ChrisValidation = runningAverageTestData(SelectedChrisFile{1});
    title('Chris');
    JuanValidation = runningAverageTestData(SelectedJuanFile{1});
    title('Juan');
    GracieValidation = runningAverageTestData(SelectedGracieFile{1});
    title('Gracie');
    KatelynValidation = runningAverageTestData(SelectedKatelynFile{1});
    title('Katelyn');
    NobleFFT = runningAverageTestData(SelectedNobleFile{1});
    title('Noble');
    StephensValidation = runningAverageTestData(SelectedStephensFile{1});
    title('Stephens');
    PeytonValidation = runningAverageTestData(SelectedPeytonFile{1});
    title('Peyton');
    AssefaValidation = runningAverageTestData(SelectedAssefaFile{1});
    title('Assefa');
    RmaniValidation = runningAverageTestData(SelectedRmaniFile{1});
    title('Rmani');
    JusticeValidation = runningAverageTestData(SelectedJusticeFile{1});
    NguyenValidation = runningAverageTestData(SelectedNguyenFile{1});
    OchoaValidation = runningAverageTestData(SelectedOchoaFile{1});
    MycahValidation = runningAverageTestData(SelectedMycahFile{1});
    
    nominal = false; % Initialized; tracks if it meets the user 10% specification
    trackNominal = 0; % Tracks the amount of times the nominal user is confirmed to be nominal (true positive)

    % Defines that a 10% accuracy from the sum of signals in the running
    % average male/female frequency section corresponding to the user is
    % considered nominal
    if DJFFT(2) * 0.9 <= DJValidation(2) && DJValidation(2) <= DJFFT(2) * 1.10
        nominal = true;
        trackNominal = trackNominal + 1;
    end
    if ChrisFFT(1) * 0.9 <= ChrisValidation(2) && ChrisValidation(2) <= ChrisFFT(2) * 1.10
        nominal = true;
        trackNominal = trackNominal + 1;
    end
    if JuanFFT(2) * 0.9 <= JuanValidation(2) && JuanValidation(2) <= JuanFFT(2) * 1.10
        nominal = true;
        trackNominal = trackNominal + 1;
    end
    if GracieFFT(2) * 0.9 <= GracieValidation(2) && GracieValidation(2) <= GracieFFT(2) * 1.10
        nominal = true;
        trackNominal = trackNominal + 1;
    end
    if KatelynFFT(2) * 0.9 <= KatelynValidation(2) && KatelynValidation(2) <= KatelynFFT(2) * 1.10
        nominal = true;
        trackNominal = trackNominal + 1;
    end
    if NobleFFT(2) * 0.9 <= NobleValidation(2) && NobleValidation(2) <= NobleFFT(2) * 1.10
        nominal = true;
        trackNominal = trackNominal + 1;
    end
    if StephensFFT(2) * 0.9 <= StephensValidation(2) && StephensValidation(1) <= StephensFFT(1) * 1.10
        nominal = true;
        trackNominal = trackNominal + 1;
    end
    if PeytonFFT(2) * 0.9 <= PeytonValidation(2) && PeytonValidation(2) <= PeytonFFT(2) * 1.10
        nominal = true;
        trackNominal = trackNominal + 1;
    end
    if AssefaFFT(2) * 0.9 <= AssefaValidation(2) && AssefaValidation(2) <= AssefaFFT(2) * 1.10
        nominal = true;
        trackNominal = trackNominal + 1;
    end
    if RmaniFFT(2) * 0.9 <= RmaniValidation(2) && RmaniValidation(2) <= RmaniFFT(2) * 1.10
        nominal = true;
        trackNominal = trackNominal + 1;
    end
    
    % Used to compare to the thresholds to the non-nominal users to see if there is
    % any false positives
    ValidationComparisonLowEnd = [DJFFT(2) * 0.9, ChrisFFT(2) * 0.9, JuanFFT(2) * 0.9, GracieFFT(2) * 0.9, KatelynFFT(2) * 0.9, NobleFFT(2) * 0.9, StephensFFT(2) * 0.9, PeytonFFT(2) * 0.9, AssefaFFT(2) *0.9, RmaniFFT(2) *0.9];
    ValidationComparisonHighEnd = 1.05* [DJFFT(2), ChrisFFT(2), JuanFFT(2), GracieFFT(2), KatelynFFT(2), NobleFFT(2), StephensFFT(2), PeytonFFT(2), AssefaFFT(2), RmaniFFT(2)];
    
    trackfalseNominal = 0; % Tracks the amount of false positives in the validation data

    for i = 1:11
    if ValidationComparisonLowEnd(i) <= JusticeValidation(2) && JusticeValidation(2) <= ValidationComparisonHighEnd(i)
        trackfalseNominal = trackfalseNominal + 1;
        break;
    end
    end
    
    for i = 1:11
    if ValidationComparisonLowEnd(i) <= NguyenValidation(2) && NguyenValidation(2) <= ValidationComparisonHighEnd(i)
        trackfalseNominal = trackfalseNominal + 1;
        break;
    end
    end
    
    for i = 1:11
    if ValidationComparisonLowEnd(i) <= OchoaValidation(2) && OchoaValidation(2) <= ValidationComparisonHighEnd(i)
        trackfalseNominal = trackfalseNominal + 1;
        break;
    end
    end
    
    for i = 1:11
    if ValidationComparisonLowEnd(i) <= MycahValidation(2) && MycahValidation(2) <= ValidationComparisonHighEnd(i)
        trackfalseNominal = trackfalseNominal + 1;
        break;
    end
    end
    