function plot_drone_trajectories(t, x, z, theta, plot_title)
    % Combined plot
    figure;
    plot(t, x, 'b', 'LineWidth', 1.5); hold on;
    plot(t, z, 'g', 'LineWidth', 1.5);
    plot(t, theta, 'r', 'LineWidth', 1.5);
    hold off;
    xlabel('Time [s]');
    ylabel('Value');
    title(sprintf('Drone Motion Coordinates vs Time %s', plot_title));
    legend({'x [m]', 'z [m]', '\theta (pitch) [deg]'}, 'Location', 'best');
    grid on;
end
