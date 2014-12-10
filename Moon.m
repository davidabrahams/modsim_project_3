classdef Moon < Planet
    %EARTH Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
    end
    
     methods
        
        function moon = Moon()
            name = 'Moon';
            speed_of_sound = 1; %No atmosphere -> no drag, doesn't matter
            m_planet = .07342e24; %Mass of the planet in kg
            r_planet = 1738e3; %Radius of planet Earth (m)
            surface_density = 0; %kg/m^3, air density on earth
            atmosphere_height = 1e3; %atmospheric height of earth (m)
            moon@Planet(name, m_planet, r_planet, surface_density, atmosphere_height, speed_of_sound);
        end
        
    end
    
end
