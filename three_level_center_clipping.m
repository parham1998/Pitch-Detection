function frame = three_level_center_clipping(f)

frame = zeros(1, length(f));
maximum = max(abs(f));
c = 0.3;

for i = 1:length(frame)
    if f(i) >= c * maximum
        frame(i) = 1;  
    elseif f(i) <= -(c * maximum)
        frame(i) = -1;  
    end
end

end