function pitch = main(i)

%use audioread to read your recorded voice
%sampling frequency: 16KHz
%16 bps (bit per sample)
[s, fs] = audioread('parham.wav');

%frame size = 40ms (proper for pitch detection tasks)
w_size = 0.04 * fs;

%both rectangular and hamming window can be used, but the rectangular window has better results
[~, frames] = rectangular_framing(s, fs, w_size);
%[f, time] = enframe(s, hamming(w,'periodic'), w/2);

%specifying voiced frames (just short-time energy with a fixed threshold is used for voiced frames detection)
%the threshold is considered to be 0.01
voiced = voiced_frame(frames);

if i == 1
    %pitch detection with the autocorrelation function
    pitch = question1(frames, w_size, voiced);
elseif i == 2
    %pitch detection with average magnitude difference function (amdf)
    pitch = question2(frames, w_size, voiced);
elseif i == 3
    %pitch detection with real cepstrum analysis
    pitch = question3(frames, w_size, voiced);
end

end