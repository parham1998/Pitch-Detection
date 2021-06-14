function pitche_freqs = autocorr_pitch(frames, w_size, voiced, clipping)

%5 pitch candidates in each frame
pitche_freqs = zeros(5, length(voiced));
for i = 1:length(voiced)
   if voiced(i) == 1
       if clipping == 0
           c = center_clipping(frames(i, 1:w_size));
       elseif clipping == 1
           c = three_level_center_clipping(frames(i, 1:w_size));
       end
       a = autocorr(c, w_size - 1);
       pitche_freqs(:, i) = five_pitch(a);
   end
end

%remove pitches above 500hz and under 75hz
for i = 1:length(pitche_freqs)
   for j = 1:5
       if pitche_freqs(j, i) >= 600 || pitche_freqs(j, i) <= 75
           pitche_freqs(j, i) = nan;
       end
   end
end

end


function f = five_pitch(a)
    p = zeros(1,5);
    [pks, locs] = findpeaks(a);
    for i = 1:5
        m = max(pks);
        index = -1;
        for j = 1:length(pks)
            if pks(j) >= m
                index = j;
            end
        end
        pks(index) = 0;
        p(i) = locs(index);
    end
    p = sort(p);
    
    f = zeros(1,5);
    for i = 1:5
        f(i) = 640 / (p(i) * 0.04);
    end
end