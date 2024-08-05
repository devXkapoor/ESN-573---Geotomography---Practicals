% [columns left to right: radius(m),density(kg/m^3),Vpv(m/s),Vsv(m/s),Q-kappa,Q-mu,Vph(m/s),Vsh(m/s),eta]
close all;
clc;

% Import data from CSV file
data = readmatrix('PREM500.csv');

% Extract columns

% Distance from the Earth's Centre
r_metres = data(:, 1);
r = r_metres/1000;

% Radius of Earth
R = 6371;

% Depth
depth = R - r;

% Reference for the Major Discontinuties inside the Earth
% 
% 01 - Conrad - 15 - 30 km
% varies with location, often around 20-25 km
% 
% 02 - Mohorovicic - 5 - 70 km 
% (typically about 5 km in oceanic crust and 30-40
% km in continental crust)
% 
% 03 - Lithosphere-Asthenosphere Boundary - 100-200 km
% 
% 04 - Gutenberg Discontinuity - 2900 km
% 
% 05 - Lehmann Discontinuity - 5100 km
% 
% 06 - Inner Core Boundary - 5150 km

% Define discontinuity points
discontinuities = [15, 24.4, 220, 2891, 5149.5];  % Depths where discontinuities occur

% Disconitnuity Depths obtained from the data
% 15 - Conrad
% 24.4 - Moho
% 220 - Lithosphere-Asthenosphere Boundary
% 2891 - Gutenberg Discontinuity
% 5149.5 - Lehmann Discontinuity

% Define colors and labels for the discontinuities
discontinuity_colors = {'[1, 0.55, 0]', '[0.58, 0, 0.83]', 'b', '[0, 0.55, 0.55]', '[0, 0.39, 0]'};
discontinuity_labels = {'Conrad', 'Moho', 'Lithosphere-Asthenosphere Boundary', 'Gutenberg', 'Lehmann'};


% Desnity
d = data(:, 2);
figure;
plot(d, depth, '-o', 'Color', 'b', 'LineWidth', 1.5);
title('Density (kg/m^3) v/s Depth (m)');
xlabel('X-Axis');
ylabel('Y-Axis');
grid on;
set(gca, 'YDir', 'reverse');

% Add vertical lines at discontinuity points
for i = 1:length(discontinuities)
    yline(discontinuities(i), '--', discontinuity_colors{i}, 'LineWidth', 3);
    text(max(d), discontinuities(i), discontinuity_labels{i},'FontSize', 14, 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right', 'Color', discontinuity_colors{i});
end
hold off;


% Vpv (Vertical Vp)
vpv = data(:, 3);
figure;
plot(vpv, depth, '-o', 'Color', 'b', 'LineWidth', 1.5);
title('Vertical Vp v/s Depth');
xlabel('X-Axis');
ylabel('Y-Axis');
grid on;
set(gca, 'YDir', 'reverse');



% Vsv (Vertical Vs)
vsv = data(:, 4);
figure;
plot(vsv, depth, '-o', 'Color', 'b', 'LineWidth', 1.5);
title('Vertical Vs v/s Depth');
xlabel('X-Axis');
ylabel('Y-Axis');
grid on;
set(gca, 'YDir', 'reverse');

% Vpv/Vsv 
figure;
plot(vpv/vsv, depth, '-o', 'Color', 'b', 'LineWidth', 1.5);
title('Vpv/Vsv v/s Depth');
xlabel('X-Axis');
ylabel('Y-Axis');
grid on;
set(gca, 'YDir', 'reverse');


% Q-kappa
qkappa = data(:, 5);
figure;
plot(qkappa, depth, '-o', 'Color', 'b', 'LineWidth', 1.5);
title('Q-kappa v/s Depth');
xlabel('X-Axis');
ylabel('Y-Axis');
grid on;
set(gca, 'YDir', 'reverse');


% Q-mu
qmu = data(:, 6);
figure;
plot(qmu, depth, '-o', 'Color', 'b', 'LineWidth', 1.5);
title('Q-mu v/s Depth');
xlabel('X-Axis');
ylabel('Y-Axis');
grid on;
set(gca, 'YDir', 'reverse');


% Vph (Horizontal Vp)
vph = data(:, 7);
figure;
plot(vph, depth, '-o', 'Color', 'b', 'LineWidth', 1.5);
title('Horizontal Vp v/s Depth');
xlabel('X-Axis');
ylabel('Y-Axis');
grid on;
set(gca, 'YDir', 'reverse');


% Vsh (Horizontal Vs)
vsh = data(:, 8);
figure;
plot(vsh, depth, '-o', 'Color', 'b', 'LineWidth', 1.5);
title('Horizontal Vs v/s Depth');
xlabel('X-Axis');
ylabel('Y-Axis');
grid on;
set(gca, 'YDir', 'reverse');


% eta
eta = data(:, 9);
figure;
plot(eta, depth, '-o', 'Color', 'b', 'LineWidth', 1.5);
title('Eta v/s Depth');
xlabel('Eta');
ylabel('Depth');
grid on;
set(gca, 'YDir', 'reverse');



% Save the plot
% saveas(gcf, 'data_plot.png');
