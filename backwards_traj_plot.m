function res = backwards_traj_plot(v_final, planet)
    
    title_string = strcat('Reaching the Atmosphere at V = ', num2str(v_final), ' m/s');
    
    [a v] = orbit(planet, v_final, 0, planet.('atmosphere_height'), true, true, true)
    title(title_string, 'FontSize', 12)
    xlabel('X position (km)', 'FontSize',12)
    ylabel('Y position (km)', 'FontSize',12)
    
end