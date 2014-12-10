function [params_1 params_2 orbital_conditions] = sweep_two_params_plot(param1, param2, p1_min, p1_max, p2_min, p2_max, elements)

planet = Earth();

params_1 = linspace(p1_min, p1_max, elements);
params_2 = linspace(p2_min, p2_max, elements);

for i=1:length(params_1)
    planet.(param1) = params_1(i);
    for j=1:length(params_2)
        planet.(param2) = params_2(j);
        [~, orbital_conditions(j, i)] = conditions_to_orbit(planet);
    end
    disp(strcat('Simulation ', num2str(100 * i / length(params_1)), '% complete'));
end

pcolor(params_1, params_2, orbital_conditions);
colorbar();
title('How does launch velocity change if we modify Earths mass and radius?', 'FontSize', 12)
xlabel('Mass of planet (kg)', 'FontSize',12)
ylabel('Radius of project (m)', 'FontSize',12)
caxis([0 500]);

zlabel('Launch velocity needed to enter orbit (m/s)','FontSize',12);


end

