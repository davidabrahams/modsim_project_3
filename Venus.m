classdef Venus < Planet
    %EARTH Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
    end
    
     methods
        
        function venus = Venus()
            m_planet = 4.8676e24; %Mass of the planet in kg
            r_planet = 6052e3; %Radius of planet Earth (m)
            surface_density = 65; %kg/m^3, air density on earth
            atmosphere_height = 25153; %atmospheric height of earth (m)
            venus@Planet(m_planet, r_planet, surface_density, atmosphere_height);
        end
        
    end
    
end
