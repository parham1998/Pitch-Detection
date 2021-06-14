function label = voiced_frame(frames)

%
short_time_energy = sum(frames.^2, 2);

%
stel = short_time_energy > 0.01;
label = stel;

end