function LP = myLowPass(voice, fc, fs)
% Arguments:
% fc - cutoff frequency
% bw - transition bandwidth
% fs - sampling rate of the filtered signal
    bw = 0.1*fc;

    M = fs*(4/bw);

    %Truncated to M+1 samples and shifted by M/2
    n = -round((M-1)/2) : round((M-1)/2);    
    
    % Sinc
    h = 2 * (fc / fs) * sinc(2 * (fc / fs) * n);  

    % Use either Hamming or Blackman windowing function.
    w = hamming(M+1);

    % To reduce the Gibbs effect, the filter kernelis multiplied by a smooth window function
    F = h .* w';
    %LP = conv(x(:,1),F_LP(:));
    LP = conv(voice,F(:));
end