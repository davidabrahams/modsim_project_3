function compare_planets(planet1, planet2, final_min, final_max, steps)

clf;
[finals1, initials1] = final_vs_launch_speed_plot(planet1, final_min, final_max, steps, false);
[finals2, initials2] = final_vs_launch_speed_plot(planet2, final_min, final_max, steps, false);
finals = [finals1, finals2];
initials = [initials1, initials2];

h1 = semilogy(finals, initials, 'LineWidth', 3);
title('Launch velocity required on different planets', 'FontSize', 12);
xlabel('Velocity at Top (m/s)','FontSize',12);
ylabel('Launch Velocity Needed (m/s)','FontSize',12);
legend(planet1.('name'), planet2.('name'));

end

