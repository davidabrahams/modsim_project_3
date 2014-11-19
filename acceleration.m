function res = acceleration(P, V, m_projectile, m_planet)
    % Outputs:
    %     res: [d2x/dt; d2y/dt]

    G = 6.67384e-11; %Universal gravitational constant
    C_d = 0.295; %drag coefficient of bullet
    air_density = 1.3; %kg/m^3 at sea level
    diameter = 9e-3; %9 mm bullet
    A = pi * (diameter / 2)^2; %cross sectional area = pi*r^2
    
    x = P(1); %Current x position
    y = P(2); %Current y position
    v_x = V(1); %Current x velocity
    v_y = V(2); %Current y velocity
    
    vel_magnitude = norm([v_x v_y]);
    pos_unit_vector = [x; y] ./ norm([x y]); 
    vel_unit_vector = [v_x; v_y] ./ vel_magnitude;

    F_grav_magnitude = G * m_planet * m_projectile / (x^2 + y^2); %Computes magnitude of force due to gravity
    F_grav_vector = - F_grav_magnitude * pos_unit_vector;
    
    F_drag_magnitude = 0.5 * air_density * vel_magnitude^2 * C_d * A;
    F_drag_vector = -F_drag_magnitude * vel_unit_vector;
   
    res = (F_grav_vector + F_drag_vector) / m_projectile; %Returns vector of acceleration due to gravity

end