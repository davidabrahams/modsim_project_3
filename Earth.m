classdef Earth < Planet
    %EARTH Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
    end
    
     methods
        
        function earth = Earth()
            m_planet = 5.972e24; %Mass of the planet in kg
            r_planet = 6378137; %Radius of planet Earth (m)
            surface_density = 1.217; %kg/m^3, air density on earth
            atmosphere_height = 13447; %atmospheric height of earth (m)
            earth@Planet(m_planet, r_planet, surface_density, atmosphere_height);
        end
        
    end
    
end

