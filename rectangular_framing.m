function [t, f] = rectangular_framing(s, fs, frame_length)

%50 percent overlap
hop = frame_length / 2;

num_frame = floor((length(s) - frame_length) / hop) + 1;

frame_matrix = zeros(num_frame, frame_length);

for m = 0:num_frame - 1
    frame_matrix(m + 1, :) = s(m * hop + 1 : m * hop + frame_length);
end

f = frame_matrix;
t = (frame_length/2 : hop : frame_length/2 + (num_frame - 1)*hop) / fs;

end