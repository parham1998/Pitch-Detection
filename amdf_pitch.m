function pitche_freqs = amdf_pitch(frames, w_size, voiced)

%5 pitch candidates in each frame
pitche_freqs = zeros(5, length(voiced));
for i = 1:length(voiced)
   if voiced(i) == 1
       c = center_clipping(frames(i, 1:w_size));
       a = amdf(c);
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

function amdf = amdf(frame)
    amdf = zeros(1, length(frame));
    for i = 0:length(frame)-1
        amdf(i+1) = sum(abs(frame(i+1:end) - frame(1:end-i)));
    end
    amdf = amdf/max(amdf);
end

function f = five_pitch(a)
    p = zeros(1,5);
    a = smoothdata(a, 'movmedian', 15);
    [pks, locs] = findpeaks(-a);
    for i = 1:length(pks)
        m = max(pks);
        index = -1;
        for j = 1:length(pks)
            if pks(j) >= m
                index = j;
            end
        end
        pks(index) = -1;
        p(i) = locs(index);
    end
    p = sort(p);
    
    f = zeros(1,5);
    for i = 1:5
        f(i) = 640 / (p(i) * 0.04);
    end
end