function orbit(v_initial, launch_angle, initial_height, is_backward) 

% Inputs: 
%     v_initial -> magnitude of the initial launch velocity
% 
% Outputs:
%     Sole function is to plot results.
    

%set the constants
m_planet = 5.972e24; %Mass of the planet in kg
r_planet = 6378137; %Radius of planet Earth (m)
m_projectile = 8e-3; %mass of bullet is 8 grams
surface_density = 1.2; %kg/m^3, air density on earth
atmosphere_height = 100e3; %atmospheric height of earth (m)


%evaluate the trajectory of the projectile

[T, Trajectory] = trajectory(m_projectile, v_initial, r_planet, surface_density, atmosphere_height, m_planet, launch_angle, initial_height, is_backward); %Computes time series 
 
    
%plot the trajectory of the projectile
X = Trajectory(:, 1); %Unpacks x component of projectile position
Y = Trajectory(:, 2); %Unpacks y component of projectile position

animation()

maxheight = max_height(X, Y, r_planet)

    function animation()
        figure; hold on;

        %Plots planet visualization
        theta = linspace(0, 2*pi, 5000);
        plot(cos(theta) * r_planet, sin(theta) * r_planet, 'g', 'LineWidth',2);

%         minmax = [min(X)-1000,max(X)+1000,min(Y)-1000,max(Y)+1000];
%         axis(minmax)

        for i = 1:length(T) - 1
            delay = (T(i+1) - T(i))/100;
            plot(X(i), Y(i),'*');
            pause(delay);
        end
        
    end

end


