function frame = center_clipping(f)

frame = zeros(1, length(f));
maximum = max(abs(f));
c = 0.3;

for i = 1:length(frame)
    if f(i) >= c * maximum
        frame(i) = f(i) - c * maximum;  
    elseif f(i) <= -(c * maximum)
        frame(i) = f(i) + c * maximum;  
    end
end

end