function res = density(surface_density, atmosphere_height, current_height)

% Inputs:
%     surface_density: atmospheric density (kg/m^3)
%     atmospheric_height: height at which atmospheric density is effectively 0.
%     current_height: current height of the projectile above the surface of the planet (m)
% 
% Outputs:
%     res: the atmospheric density in kg/m^3
    
    current_density = surface_density * (1 - current_height / atmosphere_height);
    if (current_density < 0)
        res = 0;
    else
        res = current_density;
    end;
    
end

