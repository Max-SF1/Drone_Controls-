function plot_drone_subplots(t, x, z, theta, plot_title)
    % Create three separate subplots for drone motion data
    
    fig = figure('Name', sprintf('Drone Motion Analysis - %s', plot_title), ...
                 'Position', [100 100 800 600]);
    
    % X-position subplot
    subplot(3,1,1);
    plot(t, x, 'b', 'LineWidth', 1.5);
    ylabel('x [m]');
    title('Drone x-position vs Time');
    grid on;
    
    % Z-position subplot  
    subplot(3,1,2);
    plot(t, z, 'g', 'LineWidth', 1.5);
    ylabel('z [m]');
    title('Drone z-position vs Time');
    grid on;
    
    % Pitch angle subplot
    subplot(3,1,3);
    plot(t, theta, 'r', 'LineWidth', 1.5);
    xlabel('Time [s]');
    ylabel('\theta (pitch) [deg]');
    title('Drone pitch angle vs Time');
    grid on;
    
    % Force the figure to come to front
    figure(fig);
    drawnow;
end