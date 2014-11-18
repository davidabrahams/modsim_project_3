function [T Trajectory] = trajectory(v_initial, r_planet, equatorial_speed, m_planet, launch_angle)

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
    

%Compute initial x and y components of launch velocity
v_x = v_initial*cosd(launch_angle) + equatorial_speed;
v_y = v_initial*sind(launch_angle); 

%Set the initial position of the projectile
x = 0;
y = r_planet;

%Create events object for ode45 call
options = odeset('Events', @events);

%Compute time series for projectile
[T, Trajectory] = ode45(@derivs, [0 10000], [x, y, v_x, v_y], options);

    function res = derivs(t, W)
    % computes derivatives at each time step
    % t:    the time
    % W:    the current posdition and velocity [x; y; dx/dt; dy/dt]
    % res:  a vector [dx/dt; dy/dt; d2x/dt; d2y/dt]

    P = W(1:2); %the current position [x y]
    V = W(3:4); %the current velocity [dx/dt dy/dt]

    dPdt = V; % change in position is velocity
    dVdt = acceleration(P, m_planet);

    res = [dPdt; dVdt];
    end

    function [value,isterminal,direction] = events(t,W)
        value = sqrt((W(1))^2+(W(2))^2)-r_planet; % Extract the current height minus 97, to stop when x = 97m.
        isterminal = 1; % Stop the integration if height crosses zero.
        direction = -1; % But only if the height is decreasing.
    end

end

function res = acceleration(P, m_planet)
    % Outputs:
    %     res: [d2x/dt; d2y/dt]

    G = 6.67384e-11; %Universal gravitational constant
    x = P(1); %Current x position
    y = P(2); %Current y position

    a_grav = G * m_planet / (x^2 + y^2); %Computes magnitude of acceleration due to gravity

    unit_vector = [x; y] ./ norm([x y]); 
    res = -a_grav * unit_vector; %Returns vector of acceleration due to gravity

end



