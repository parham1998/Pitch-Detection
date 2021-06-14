function pitch = question1(frames, w_size, voiced)

figure(1);

%center-clipping
pitch_freqs = autocorr_pitch(frames, w_size, voiced, 0);
subplot(3,1,1);
hold on
for i = 1:5
    scatter(0:length(pitch_freqs)-1, pitch_freqs(i,:), 20);
end
title('center clipping autocorrilation');
ylabel('frequency (Hz)')
set(gca,'xtick',0:10:240)
legend('candidate1', 'candidate2', 'candidate3', 'candidate4', 'candidate5')
hold off

%3-level center-clipping
pitch_freqs = autocorr_pitch(frames, w_size, voiced, 1);
subplot(3,1,2);
hold on
for i = 1:5
    scatter(0:length(pitch_freqs)-1, pitch_freqs(i,:), 20);
end
title('3 level center clipping autocorrilation');
ylabel('frequency (Hz)')
set(gca,'xtick',0:10:240)
legend('candidate1', 'candidate2', 'candidate3', 'candidate4', 'candidate5')
hold off

%smooth
subplot(3,1,3);
pitch_freqs = autocorr_pitch(frames, w_size, voiced, 1);
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

plot(0:length(pitch_freqs)-1, h, 'linewidth', 4);
title('3 level center clipping autocorrilation (smooth contour)');
xlabel('frame number') 
set(gca,'xtick',0:10:240)
ylabel('frequency (Hz)')
ylim([0 400])


end