classdef Pluto < Planet
    %EARTH Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
    end
    
     methods
        
        function pluto = Pluto()
            speed_of_sound = 1; %No atmosphere -> no drag, doesn't matter
            m_planet = .0131e24; %Mass of the planet in kg
            r_planet = 1195e3; %Radius of planet Earth (m)
            surface_density = 0; %kg/m^3, air density on earth
            atmosphere_height = 1; %atmospheric height of earth (m)
            pluto@Planet(m_planet, r_planet, surface_density, atmosphere_height, speed_of_sound);
        end
        
    end
    
end
