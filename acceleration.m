function res = acceleration(P, V, m_projectile, m_planet, r_planet, surface_density, atmosphere_height)
    % Outputs:
    %     res: [d2x/dt; d2y/dt]

    G = 6.67384e-11; %Universal gravitational constant
    C_d = 0.295; %drag coefficient of bullet
    current_height = norm(P) - r_planet;
    air_density =  density(surface_density, atmosphere_height, current_height); %kg/m^3 at sea level
    diameter = 9e-3; %9 mm bullet
    A = pi * (diameter / 2)^2; %cross sectional area = pi*r^2
    
    vel_magnitude = norm(V); %Compute the magnitude of velocity
    pos_unit_vector = P ./ norm(P); %Compute the unit vector of position
    vel_unit_vector = V ./ vel_magnitude; %Compute the unit vector of velocity

    F_grav_magnitude = G * m_planet * m_projectile / (norm(P)^2); %Computes magnitude of force due to gravity
    F_grav_vector = - F_grav_magnitude * pos_unit_vector;
    
    F_drag_magnitude = 0.5 * air_density * vel_magnitude^2 * C_d * A;
    F_drag_vector = - F_drag_magnitude * vel_unit_vector;
   
    res = (F_grav_vector + F_drag_vector) / m_projectile; %Returns vector of acceleration due to gravity

end