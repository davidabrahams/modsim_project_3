function sweep_one_param_plot(param1, p1_min, p1_max, elements)

planet = Earth();

params_1 = linspace(p1_min, p1_max, elements);
for i=1:length(params_1)
    planet.(param1) = params_1(i);
    [~, orbital_conditions(i)] = conditions_to_orbit(planet);
    disp(strcat('Simulation ', num2str(100 * i / length(params_1)), '% complete'));
end

plot(params_1, orbital_conditions, 'LineWidth', 3);
title('How does launch velocity change if we modify Earths radius?', 'FontSize', 12)
xlabel('Radius of planet (m)', 'FontSize',12)
ylabel('Initial velocity needed to enter orbit (m)', 'FontSize',12)

end

