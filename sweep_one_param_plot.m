function sweep_one_param_plot(planet, param1, p1_min, p1_max, elements)

params_1 = linspace(p1_min, p1_max, elements);
%params_1 = logspace(log10(p1_min), log10(p1_max), elements);
for i=1:length(params_1)
    planet.(param1) = params_1(i);
    [~, orbital_conditions(i)] = conditions_to_orbit(planet);
    disp(strcat('Simulation ', num2str(100 * i / length(params_1)), '% complete'));
end

%loglog(params_1, orbital_conditions, 'LineWidth', 3);
plot(params_1, orbital_conditions, 'LineWidth', 3);
title({'Launch velocity needed to get within a 5 m/s of orbit on a planet 1/1000th'; 'the size of Earth with a 100m tall atmosphere'}, 'FontSize', 12)
xlabel('Atmospheric density (kg/m^3)', 'FontSize',12)
ylabel('Initial velocity needed(m/s)', 'FontSize',12)

end

