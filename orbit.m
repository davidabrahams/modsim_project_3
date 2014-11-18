function orbit(v_initial, launch_angle) 

% Inputs: 
%     v_initial -> magnitude of the initial launch velocity
% 
% Outputs:
%     Sole function is to plot results.
    

%set the constants
m_planet = 5.972e24; %Mass of the planet in kg
r_planet = 6378137; %Radius of planet Earth (m)
angular_velocity_planet = 7.2921150e-5; %Rngular velocity of planet Earth (rad/s)
equatorial_speed = r_planet * angular_velocity_planet; %Velocity of Earth's rotation at equator in m/s

%evaluate the trajectory of the projectile
[T, Trajectory] = trajectory(v_initial, r_planet, equatorial_speed, m_planet, launch_angle); %Computes time series 

%plot the trajectory of the projectile
X = Trajectory(:, 1); %Unpacks x component of projectile position
Y = Trajectory(:, 2); %Unpacks y component of projectile position

disp(T)
animation()

    function animation()
        figure; hold on;

        %Plots planet visualization
        theta = linspace(0, 2*pi);
        plot(cos(theta) * r_planet, sin(theta) * r_planet, 'g', 'LineWidth',2);


        xlim([-2*r_planet, 2*r_planet]);
        ylim([-2*r_planet, 2*r_planet]);

        for i = 1:length(T) - 1
            disp(T(i))
            delay = (T(i+1) - T(i))/100;
            plot(X(i), Y(i),'*')
            pause(delay)
        end
        
    end

end


