function [T Trajectory] = orbit(v_initial)

r_planet = 6378137 %radius of planet Earth (m)
angular_velocity_planet = 7.2921150e-5; %angular velocity of planet Earth (rad/s)
equatorial_speed = r_planet * angular_velocity_planet

[T Trajectory] = trajectory(v_initial, r_planet, equatorial_speed);
X = Trajectory(:, 1)
Y = Trajectory(:, 2)
plot(X, Y);

end

