function [T Trajectory] = trajectory(v_initial, r_planet, equatorial_speed)

v_x = equatorial_speed;
v_y = v_initial;
x = 0;
y = r_planet;
[T, Trajectory] = ode45(@projectile, [0 100], [x y v_x v_y]);

end

