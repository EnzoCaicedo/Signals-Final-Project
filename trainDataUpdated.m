%% Nominal Data for training

% Creates vector of the different .m4a file samples for each nominal user
% for training data
DJFiles = {'DJ_53_01.wav','DJ_53_02.wav','DJ_53_03.wav','DJ_53_04.wav','DJ_53_05.wav','DJ_53_06.wav','DJ_53_07.wav','DJ_53_08.wav','DJ_53_09.wav','DJ_53_10.wav'};

ChrisFiles = {'Chris_53_01.wav','Chris_53_02.wav','Chris_53_03.wav','Chris_53_04.wav','Chris_53_05.wav','Chris_53_06.wav','Chris_53_07.wav','Chris_53_08.wav','Chris_53_09.wav','Chris_53_10.wav'};

JuanFiles = {'Juan_53_01.wav','Juan_53_02.wav','Juan_53_03.wav','Juan_53_04.wav','Juan_53_05.wav','Juan_53_06.wav','Juan_53_07.wav','Juan_53_08.wav','Juan_53_09.wav','Juan_53_10.wav'};

GracieFiles = {'Gracie_L53_01.wav','Gracie_L53_02.wav','Gracie_L53_03.wav','Gracie_L53_04.wav','Gracie_L53_05.wav','Gracie_L53_06.wav','Gracie_L53_07.wav','Gracie_L53_08.wav','Gracie_L53_09.wav','Gracie_L53_10.wav'};

KatelynFiles = {'Katelyn_L53_01.wav','Katelyn_L53_02.wav','Katelyn_L53_03.wav','Katelyn_L53_04.wav','Katelyn_L53_05.wav','Katelyn_L53_06.wav','Katelyn_L53_07.wav','Katelyn_L53_08.wav','Katelyn_L53_09.wav','Katelyn_L53_10.wav'};

NobleFiles = {'Noble_L53_01.wav','Noble_L53_02.wav','Noble_L53_03.wav','Noble_L53_04.wav','Noble_L53_05.wav','Noble_L53_06.wav','Noble_L53_07.wav','Noble_L53_08.wav','Noble_L53_09.wav','Noble_L53_10.wav'};

StephensFiles = {'Stephens_L53_01.wav','Stephens_L53_02.wav','Stephens_L53_03.wav','Stephens_L53_04.wav','Stephens_L53_05.wav','Stephens_L53_06.wav','Stephens_L53_07.wav','Stephens_L53_08.wav','Stephens_L53_09.wav','Stephens_L53_10.wav'};

PeytonFiles = {'Peyton_53_01.wav','Peyton_53_02.wav','Peyton_53_03.wav','Peyton_53_04.wav','Peyton_53_05.wav','Peyton_53_06.wav','Peyton_53_07.wav','Peyton_53_08.wav','Peyton_53_09.wav','Peyton_53_10.wav'};

AssefaFiles = {'Assefa_L53_01.wav','Assefa_L53_02.wav','Assefa_L53_03.wav','Assefa_L53_04.wav','Assefa_L53_05.wav','Assefa_L53_06.wav','Assefa_L53_07.wav','Assefa_L53_08.wav','Assefa_L53_09.wav','Assefa_L53_10.wav'};

RmaniFiles = {'Rmani_L53_03.wav','Rmani_L53_04.wav','Rmani_L53_05.wav','Rmani_L53_06.wav','Rmani_L53_07.wav','Rmani_L53_08.wav','Rmani_L53_09.wav','Rmani_L53_10.wav'};

% Non-nominal data 
JusticeFiles = {'Justice_L53_01.wav','Justice_L53_02.wav','Justice_L53_03.wav','Justice_L53_04.wav','Justice_L53_05.wav','Justice_L53_06.wav','Justice_L53_07.wav','Justice_L53_08.wav','Justice_L53_09.wav','Justice_L53_10.wav'};

NguyenFiles = {'Nguyen_L53_01.wav','Nguyen_L53_02.wav','Nguyen_L53_03.wav','Nguyen_L53_04.wav','Nguyen_L53_05.wav','Nguyen_L53_06.wav','Nguyen_L53_07.wav','Nguyen_L53_08.wav','Nguyen_L53_09.wav','Nguyen_L53_10.wav'};

OchoaFiles = {'Ochoa_L53_01.wav','Ochoa_L53_02.wav','Ochoa_L53_03.wav','Ochoa_L53_04.wav','Ochoa_L53_05.wav','Ochoa_L53_06.wav','Ochoa_L53_07.wav','Ochoa_L53_08.wav','Ochoa_L53_09.wav','Ochoa_L53_10.wav'};

MycahFiles = {'Mycah_L53_01.wav','Mycah_L53_02.wav','Mycah_L53_03.wav','Mycah_L53_04.wav','Mycah_L53_05.wav','Mycah_L53_06.wav','Mycah_L53_07.wav','Mycah_L53_08.wav','Mycah_L53_09.wav','Mycah_L53_10.wav'};

% Choose two audio files randomly for each nominal user
DJIndeces = randperm(length(DJFiles), 2);
ChrisIndeces = randperm(length(ChrisFiles), 2);
JuanIndeces = randperm(length(JuanFiles), 2);
GracieIndeces = randperm(length(GracieFiles), 2);
KatelynIndeces = randperm(length(KatelynFiles),2);
NobleIndeces = randperm(length(NobleFiles), 2);
StephensIndeces = randperm(length(StephensFiles), 2);
PeytonIndeces = randperm(length(PeytonFiles), 2);
AssefaIndeces = randperm(length(AssefaFiles), 2);
RmaniIndeces = randperm(length(RmaniFiles), 2);

% Gets the selected file .wav names in the respective vectors
SelectedDJFiles = DJFiles(DJIndeces);
SelectedChrisFiles = ChrisFiles(ChrisIndeces);
SelectedJuanFiles = JuanFiles(JuanIndeces);
SelectedGracieFiles = GracieFiles(GracieIndeces);
SelectedKatelynFiles = KatelynFiles(KatelynIndeces);
SelectedNobleFiles = NobleFiles(NobleIndeces);
SelectedStephensFiles = StephensFiles(StephensIndeces);
SelectedPeytonFiles = PeytonFiles(PeytonIndeces);
SelectedAssefaFiles = AssefaFiles(AssefaIndeces);
SelectedRmaniFiles = RmaniFiles(RmaniIndeces);

% Initializes the FFT variables as size of 2 (each nominal user takes 2
% samples)
DJFFT = zeros(1,2);
ChrisFFT = zeros(1,2);
JuanFFT = zeros(1,2);
GracieFFT = zeros(1,2);
KatelynFFT = zeros(1,2);
NobleFFT = zeros(1,2);
StephensFFT = zeros(1,2);
PeytonFFT = zeros(1,2);
AssefaFFT = zeros(1,2);
RmaniFFT = zeros(1,2);

% Compute FFT for each sample
    DJFFT = runningAverageTestData(SelectedDJFiles{1}, SelectedDJFiles{2});
    title('DJ');
    ChrisFFT = runningAverageTestData(SelectedChrisFiles{1}, SelectedChrisFiles{2});
    title('Chris');
    JuanFFT = runningAverageTestData(SelectedJuanFiles{1}, SelectedJuanFiles{2});
    title('Juan');
    GracieFFT = runningAverageTestData(SelectedGracieFiles{1}, SelectedGracieFiles{2});
    title('Gracie');
    KatelynFFT = runningAverageTestData(SelectedKatelynFiles{1}, SelectedKatelynFiles{2});
    title('Katelyn');
    NobleFFT = runningAverageTestData(SelectedNobleFiles{1}, SelectedNobleFiles{2});
    title('Noble');
    StephensFFT = runningAverageTestData(SelectedStephensFiles{1}, SelectedStephensFiles{2});
    title('Stephens');
    PeytonFFT = runningAverageTestData(SelectedPeytonFiles{1}, SelectedPeytonFiles{2});
    title('Peyton');
    AssefaFFT = runningAverageTestData(SelectedAssefaFiles{1}, SelectedAssefaFiles{2});
    title('Assefa');
    RmaniFFT = runningAverageTestData(SelectedRmaniFiles{1}, SelectedRmaniFiles{2});
    title('Rmani');
   
    