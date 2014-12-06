function [proj_ang, init_vel] = orbit(Planet, v_initial, launch_angle, initial_height, is_backward) 

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


%evaluate the trajectory of the projectile

[T, Trajectory] = trajectory(m_projectile, v_initial, r_planet, surface_density, atmosphere_height, m_planet, launch_angle, initial_height, is_backward); %Computes time series 


    
%plot the trajectory of the projectile
X = Trajectory(:, 1); %Unpacks x component of projectile position
Y = Trajectory(:, 2); %Unpacks y component of projectile position

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

maxheight = max_height(X, Y, r_planet)

    function animation()
        figure;

        %Plots planet visualization
        theta = linspace(0, 2*pi, 5000);
        plot(cos(theta) * r_planet, sin(theta) * r_planet, 'g', 'LineWidth',2);
        hold on;

        %minmax = [min(X),max(X),min(Y),max(Y)];
        x_range = max(X) - min(X);
        y_range = max(Y) - min(Y);
        max_range = 1.2 * max([x_range, y_range]);
        mid_X = mean([max(X), min(X)]);
        mid_Y = mean([max(Y), min(Y)]);
        axis_bounds = [mid_X - max_range / 2, mid_X + max_range / 2, mid_Y - max_range / 2, mid_Y + max_range / 2];

        for i = 1:length(T) - 1
            delay = (T(i+1) - T(i))/2;
            plot(X(i), Y(i),'*');
            %axis([-window_size * r_planet, window_size * r_planet, (r_planet + initial_height) - window_size * r_planet, (r_planet + initial_height) + window_size * r_planet]);
            axis(axis_bounds);
            pause(delay/1000);
        end
        
    end

end


