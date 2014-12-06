classdef Planet
    %PLANEt Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        
        m_planet
        r_planet
        surface_density
        atmosphere_height
    end
    
    methods
        
        function planet = Planet(m, r, s_d, a_h)
            planet.m_planet = m;
            planet.r_planet = r;
            planet.surface_density = s_d;
            planet.atmosphere_height = a_h;
        end
        
    end
    
end

