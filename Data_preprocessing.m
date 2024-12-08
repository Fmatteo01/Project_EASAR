function [Voice, coeffs] = Data_preprocessing(Voice, fs)
    % Data preprocessing: Filter a vocal signal with a low-pass filter, 
    % change its sampling frequency(subsampling), extract features
    % Input: Voice, fs 
    % Output: Voice_filtered 


    % I have to adapt the recorded audio to timit which has fs=16kHz
    N = round(fs / 16000);
    fs = 16000;
    Voice = Voice(:, 1);        % convert from stereo to mono
    Voice = Voice(1:N:end);     % (subsampling)
 
    % Apply a low-pass filter
    Voice = myLowPass(Voice, 4000, 16000);

    % feature extraction
    coeffs = mfcc(Voice, fs,'NumCoeffs', 13);
end
