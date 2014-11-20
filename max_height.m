function res = max_height(x_series, y_series, r_planet)

% Inputs:
%     x_series: The time series of the x component of the position of the projectile
%     y_series: The time series of the y component of the position of the projectile
%     r_planet: The radius of the planet in meters
%     
% Outputs:
%     The maximum height of the projectile's trajectory

    res = max([sqrt(x_series.^2 + y_series.^2)])-r_planet;
end