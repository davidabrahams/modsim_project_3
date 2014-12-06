function [T Trajectory] = trajectory(m_projectile, v_initial, r_planet, surface_density, atmosphere_height, m_planet, launch_angle, initial_height, is_backward)

% Inputs:
%     v_initial: Initial magnitude of launch velocity
%     r_planet: Radius of the planet in question
%     equatorial_speed: Magnitude of speed at equator of planet
%     m_planet: Mass of the planet 
%     launch_angle: Launch angle of the projectile (0 is straight forward, 90 is vertical)
% 
% Outputs:
%     T: vector of time values
%     Trajectory: Vector with 4 components -> [x_position, y_position, x_velocity, y_velocity]
    

if (is_backward == true)
    launch_angle = launch_angle + 180; 
end

%Compute initial x and y components of launch velocity
v_x = v_initial*cosd(launch_angle);
v_y = v_initial*sind(launch_angle);


%Set the initial position of the projectile
x = 0;
y = r_planet + initial_height;

%Create events object for ode45 call
options = odeset('Events', @events);

time_to_sim = 15000; %seconds

%Compute time series for projectile
%[T, Trajectory] = ode45(@derivs, 0:step_size:time_to_sim, [x, y, v_x, v_y], options);
[T, Trajectory] = ode45(@derivs, [0 time_to_sim], [x, y, v_x, v_y], options);

    function res = derivs(t, W)
    % computes derivatives at each time step
    % t:    the time
    % W:    the current posdition and velocity [x; y; dx/dt; dy/dt]
    % res:  a vector [dx/dt; dy/dt; d2x/dt; d2y/dt]

    P = W(1:2); %the current position [x y]
    V = W(3:4); %the current velocity [dx/dt dy/dt]

    dPdt = V; % change in position is velocity
    
    dVdt = acceleration(P, V, m_projectile, m_planet, r_planet, surface_density, atmosphere_height, is_backward);
    
    res = [dPdt; dVdt];

    end

    function [value,isterminal,direction] = events(t,W)
        value = sqrt((W(1))^2+(W(2))^2)-r_planet; % Extract the distance from the planet
        isterminal = 1; % Stop the integration if height crosses zero.
        direction =  -1; % But only if the height is decreasing.
    end

end




