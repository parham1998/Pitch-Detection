function pitch = question3(frames, w_size, voiced)

figure(3);

%center-clipping
pitch_freqs = cepstrum_pitch(frames, w_size, voiced);
subplot(2,1,1)
hold on
for i = 1:5
    scatter(0:length(pitch_freqs)-1, pitch_freqs(i,:), 20);
end
title('real cepstrum');
ylabel('frequency (Hz)')
set(gca,'xtick',0:10:240)
legend('candidate1', 'candidate2', 'candidate3', 'candidate4', 'candidate5')
hold off

%smooth
smoothed = nan(5, length(pitch_freqs));
for i = 1:length(pitch_freqs)
   for j = 1:5
       if pitch_freqs(j, i) <= 160
           smoothed(j, i) = pitch_freqs(j, i);
       end
   end
end
smoothed = smooth2a(smoothed, 5, 5);
h = nan(1, length(smoothed));
for i = 1:length(smoothed)
    for j = 1:5
        if ~isnan(smoothed(j, i))
            h(i) = max(smoothed(j, i));
        end
    end
end

%
pitch = nanmedian(h);

subplot(2,1,2)
plot(0:length(pitch_freqs)-1, h, 'linewidth', 4);
title('real cepstrum (smooth contour)');
xlabel('frame number') 
set(gca,'xtick',0:10:240)
ylabel('frequency (Hz)')
ylim([0 400])

end