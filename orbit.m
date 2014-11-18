function [T Trajectory] = orbit(v_initial)

%set the constants
m_planet = 5.972e24; %kg
r_planet = 6378137 %radius of planet Earth (m)
angular_velocity_planet = 7.2921150e-5; %angular velocity of planet Earth (rad/s)
equatorial_speed = r_planet * angular_velocity_planet

%evaluate the trajectory of the projectile
[T Trajectory] = trajectory(v_initial, r_planet, equatorial_speed, m_planet);
X = Trajectory(:, 1);
Y = Trajectory(:, 2);
plot(X, Y);

end

