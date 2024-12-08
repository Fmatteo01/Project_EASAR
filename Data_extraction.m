function trainingData = Data_extraction(folder,preprocessing)

    
    numCoeffs = 13; % Number of MFCC coefficients
    fs = 16000;
    
    % Main folder
    mainFolder = fullfile(pwd, folder);
    
    % Get all WAV files in the folder and subfolders
    allAudioFiles = dir(fullfile(mainFolder, '**', '*.wav'));
    
    % View complete audio file paths
    audioPaths = fullfile({allAudioFiles.folder}, {allAudioFiles.name});
    
    % Load each file and calculate MFCCs
    trainingData = [];
    tic
    for i = 1:length(audioPaths)
        [audio, ~] = audioread(audioPaths{i});
        
        % For the speaker data, we need to subsample to 16kHz, switch to mono channel and filter out noise 
        if preprocessing == 1
                [audio, ~] = Data_preprocessing(audio, fs);
        end
        
        audio = gpuArray(audio); % Transfer audio to the GPU
        coeffs = mfcc(audio, fs, 'NumCoeffs', numCoeffs); % compute MFCC on the GPU
        coeffs = gather(coeffs); % Transfer coeff back to the CPU

        trainingData = [trainingData; coeffs];
    end

    gpuDevice([]); % Free the GPU
    toc
    disp('Training data loaded!');
 

end