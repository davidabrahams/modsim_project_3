function [proj_ang, init_vel] = orbit(Planet, v_initial, launch_angle, initial_height, is_backward, plot_line) 

% Inputs: 
%     v_initial -> magnitude of the initial launch velocity
% 
% Outputs:
%     Sole function is to plot results.
    

%set the constants
m_planet = Planet.('m_planet'); %Mass of the planet in kg
r_planet = Planet.('r_planet'); %Radius of planet Earth (m)
m_projectile = 8e-3; %mass of bullet is 8 grams
surface_density = Planet.('surface_density'); %kg/m^3, air density on earth
atmosphere_height = Planet.('atmosphere_height'); %atmospheric height of earth (m)
speed_of_sound = Planet.('speed_of_sound');


%evaluate the trajectory of the projectile

[T, Trajectory] = trajectory(m_projectile, v_initial, r_planet, surface_density, atmosphere_height, speed_of_sound, m_planet, launch_angle, initial_height, is_backward); %Computes time series 


    
%plot the trajectory of the projectile
X = Trajectory(:, 1); %Unpacks x component of projectile position
Y = Trajectory(:, 2); %Unpacks y component of projectile position

X_to_plot = X ./ 1000; %Unpacks x component of projectile position
Y_to_plot = Y ./ 1000 - r_planet / 1000; %Unpacks y component of projectile position

Vx = Trajectory(:, 3); %Unpack x velocity
Vy = Trajectory(:, 4); %Unpack y velocity

% 
% figure()
% plot(Vx)

x_final = X(end);
y_final = Y(end);

Vx_final = Vx(end);
Vy_final = Vy(end);

init_vel = norm([Vx_final Vy_final]);
launch_ang = atand(Vy_final/Vx_final); %the angle of the launch relative the x-axis
surface_ang = atand(-x_final / y_final); %the angle of the planet's surface relative to the x-axis
proj_ang = launch_ang - surface_ang; %the angle of the launch relative to the planet's surface

animation()

maxheight = max_height(X, Y, r_planet);

    function animation()
        figure();
        
        %Plots planet visualization
        theta = linspace(0, 2*pi, 5000);
        plot(cos(theta) * r_planet / 1000, sin(theta) * r_planet / 1000 - r_planet / 1000, 'g', 'LineWidth',5);
        hold on
        plot(cos(theta) * (r_planet + atmosphere_height) / 1000, sin(theta) * (r_planet + atmosphere_height) / 1000 - r_planet / 1000, 'b--', 'LineWidth',1);
%         hold all; % Uncomment for awesome colors

        %minmax = [min(X),max(X),min(Y),max(Y)];
        x_range = max(X_to_plot) - min(X_to_plot);
        y_range = max(Y_to_plot) - min(Y_to_plot);
        max_range = 1.2 * max([x_range, y_range]);
        mid_X = mean([max(X_to_plot), min(X_to_plot)]);
        mid_Y = mean([max(Y_to_plot), min(Y_to_plot)]);
        axis_bounds = [mid_X - max_range / 2, mid_X + max_range / 2, mid_Y - max_range / 2, mid_Y + max_range / 2];
        
        if (plot_line == false)
            for i = 1:length(T) - 1
                title('Projectile Trajectory Over Planet','FontSize',12)
                xlabel('X (km)','FontSize',12)
                ylabel('Y (km)','FontSize',12)


                delay = (T(i+1) - T(i))/2;
                plot(X_to_plot(i), Y_to_plot(i),'r*', 'MarkerSize', 8);
                %axis([-window_size * r_planet, window_size * r_planet, (r_planet + initial_height) - window_size * r_planet, (r_planet + initial_height) + window_size * r_planet]);
                axis(axis_bounds);
                pause(delay/1000);
            end
        else
            plot(X_to_plot, Y_to_plot, 'r-', 'LineWidth', 2);
            axis(axis_bounds);
        end
        
    end

end


