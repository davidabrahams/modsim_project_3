function sweep_one_param_plot(param1, p1_min, p1_max, elements)

planet = Earth();
planet.m_planet = planet.m_planet / 1000;
planet.r_planet = planet.r_planet / 10;
planet.atmosphere_height = 100;
params_1 = linspace(p1_min, p1_max, elements);
%params_1 = logspace(log10(p1_min), log10(p1_max), elements);
for i=1:length(params_1)
    planet.(param1) = params_1(i);
    [~, orbital_conditions(i)] = conditions_to_orbit(planet);
    disp(strcat('Simulation ', num2str(100 * i / length(params_1)), '% complete'));
end

%loglog(params_1, orbital_conditions, 'LineWidth', 3);
plot(params_1, orbital_conditions, 'LineWidth', 3);
title({'Launch velocity needed to reach the atmosphere at orbital velocity at an angle of 1 degree'; 'on a planet 1/1000th the size of Earth with a 100m tall atmosphere'}, 'FontSize', 12)
xlabel('Atmospheric Density (kg/m^3)', 'FontSize',12)
ylabel('Initial velocity needed (m/s)', 'FontSize',12)

end

