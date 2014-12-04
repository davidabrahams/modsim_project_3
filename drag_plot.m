v_mags = linspace(0, 5000, 1000);
drags = zeros(length(v_mags), 1);
for i = 1: length(v_mags)
   drags(i) = drag_coefficient(v_mags(i));
end

plot(v_mags, drags)