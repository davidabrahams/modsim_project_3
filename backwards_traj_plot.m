function res = backwards_traj_plot(v_final)

    earth = Earth();
    
    title_string = strcat('Reaching the Atmosphere at V = ', num2str(v_final), ' m/s');
    
    orbit(earth, v_final, 0, earth.('atmosphere_height'), true, true);
    title(title_string, 'FontSize', 12)
    xlabel('X position (km)', 'FontSize',12)
    ylabel('Y position (km)', 'FontSize',12)
    
end