function [angle, init_vel] = conditions_to_orbit(planet)

G = 6.67384e-11; %Universal gravitational constant
m_planet = planet.('m_planet'); %Mass of the planet in kg
r_planet = planet.('r_planet'); %Radius of planet Earth (m)
atmosphere_height = planet.('atmosphere_height'); %atmospheric height of earth (m)

v_orbit = sqrt(G * m_planet / (r_planet + atmosphere_height));

[angle, init_vel] = orbit(planet, v_orbit, 0, atmosphere_height, true);

end

