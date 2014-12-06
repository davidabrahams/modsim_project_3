v_mags = linspace(0, 2000, 500);
drags = zeros(length(v_mags), 1);
for i = 1: length(v_mags)
   drags(i) = drag_coefficient(v_mags(i));
end

plot(v_mags, drags, 'LineWidth', 4)
title('Drag Coefficient vs. Projectile Speed', 'FontSize', 12)
xlabel('Speed (m/s)', 'FontSize',12)
ylabel('Drag Coefficient', 'FontSize',12)