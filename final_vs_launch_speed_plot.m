function [finals, initials] = final_vs_launch_speed_plot(planet, final_min, final_max, elements, should_plot)

    finals = linspace(final_min, final_max, elements);
    finals = finals(:);
    atmosphere_height = planet.('atmosphere_height');

    initials = zeros(length(finals), 1);

    for i=1:length(finals)

        [~, v] = orbit(planet, finals(i), 0, atmosphere_height, true, false, false);
        initials(i) = v;
        disp(strcat('Simulations ', num2str(100*i/length(finals)), '% complete'));

    end

    if (should_plot == true)

        speed_of_light = 299792458; %m/s
        muzzle_velocity = 350;

        clf;
        hold all;

        h1 = semilogy(finals, initials, 'LineWidth', 3);
        h2 = semilogy([final_min final_max], [muzzle_velocity muzzle_velocity], 'LineWidth', 2);
        h3 = semilogy([final_min final_max], [speed_of_light speed_of_light], 'LineWidth', 2);
        title('Velocity at Top of Trajectory vs. Launch Speed', 'FontSize', 12);
        xlabel('Velocity at Top (m/s)','FontSize',12);
        ylabel('Launch Velocity Needed (m/s)','FontSize',12);

        %legend([h1], {'Muzzle velocity'});
        legend([h1 h2 h3], {'Launch velocity', 'Muzzle velocity', 'Speed of light'});

    end

end