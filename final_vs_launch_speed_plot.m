function final_vs_launch_speed_plot(planet)

v_min = 1;
v_max = 400;

finals = linspace(v_min, v_max);
atmosphere_height = planet.('atmosphere_height');

initials = zeros(length(finals), 1);

for i=1:length(finals)
    
    [a, v] = orbit(planet, finals(i), 0, atmosphere_height, true, false, false);
    initials(i) = v;
    disp(strcat('Simulations ', num2str(100*i/length(finals)), '% complete'));
    
end

speed_of_light = 299792458; %m/s
muzzle_velocity = 350;

clf;

semilogy(finals, initials, 'LineWidth', 3);
hold all;
h1 = semilogy([v_min v_max], [muzzle_velocity muzzle_velocity], 'LineWidth', 2);
%h2 = semilogy([v_min v_max], [speed_of_light speed_of_light], 'LineWidth', 2);
title('Velocity at Top of Trajectory vs. Launch Speed', 'FontSize', 12);
xlabel('Velocity at Top (m/s)','FontSize',12);
ylabel('Launch Velocity Needed (m/s)','FontSize',12);

legend([h1], {'Muzzle velocity'});
%legend([h1 h2], {'Muzzle velocity', 'Speed of light'});

end