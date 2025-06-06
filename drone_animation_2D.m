function animation = drone_animation_2D(t, x, z, theta,xlim_b,xlim_t,ylim_b,ylim_t, save_vid)
    if nargin < 5
        save_vid = false;
    end
    
    if save_vid
        v = VideoWriter('drone_vid', 'Motion JPEG AVI');
        v.FrameRate = 10; % Set the frame rate
        open(v);
    end
    
    %% Define Figure plot
    fig = figure('pos', [0 50 800 600]);
    hg = gca;
    grid on;
    axis equal;
    xlim([xlim_b xlim_t]); ylim([ylim_b ylim_t]);

    title('2D Drone Animation')
    xlabel('X[m]');
    ylabel('Z[m]');
    hold(hg, 'on');
    drawnow

    pause(0.7)
    
    %% Define design parameters
    b = 0.6; % the length of total square cover by whole body of quadcopter in meter
    a = b/3; % the length of small square base of quadcopter
    H = 0.06; % height of drone in Z direction
    H_m = H+H/2; % height of motor
    r_p = b/4; % radius of propeller
    
    %% Design Different parts (2D version)
    % Design the base rectangle
    base_x = [-a/2, a/2, a/2, -a/2, -a/2];
    base_y = [0, 0, H, H, 0];
    drone(1) = patch(base_x, base_y, 'r');
    
    % Design arms of quadcopter (horizontal)
    arm_x = [-b/2, b/2];
    arm_y = [H/2, H/2];
    drone(2) = line(arm_x, arm_y, 'Color', 'b', 'LineWidth', 3);
    
    % Design motors
    motor_radius = H_m/2;
    [left_motor_x, left_motor_y] = circle_points(-b/2, H/2, motor_radius);
    [right_motor_x, right_motor_y] = circle_points(b/2, H/2, motor_radius);
    drone(3) = patch(left_motor_x, left_motor_y, 'r');
    drone(4) = patch(right_motor_x, right_motor_y, 'r');
    
    % Design propellers
    left_prop_x = [-b/2-r_p, -b/2+r_p];
    left_prop_y = [H/2+motor_radius, H/2+motor_radius];
    right_prop_x = [b/2-r_p, b/2+r_p];
    right_prop_y = [H/2+motor_radius, H/2+motor_radius];
    drone(5) = line(left_prop_x, left_prop_y, 'Color', 'c', 'LineWidth', 2);
    drone(6) = line(right_prop_x, right_prop_y, 'Color', 'c', 'LineWidth', 2);
    
    alpha(drone(1), 0.7);
    alpha(drone(3), 0.7);
    alpha(drone(4), 0.7);
    
    %% Create a group object and parent surface
    combinedobject = hgtransform('parent', hg);
    set(drone, 'parent', combinedobject)
    
    video_length = length(x);
    
    %% Perform animation
    for i = 1:video_length
        % Plot the drone's path
        plot(x(1:i), z(1:i), 'b:', 'LineWidth', 1.5);
        
        % Transform the drone
        translation = makehgtform('translate', [x(i) z(i) 0]);
        rotation = makehgtform('zrotate', (pi/180)*(theta(i)));
        set(combinedobject, 'matrix', translation*rotation);
        
        if save_vid
            frame = getframe(fig); % Capture current frame
            img = frame2im(frame); % convert to image
            img_resized = imresize(img, [800 600]); % force consistent size
            writeVideo(v, im2frame(img_resized));
        end
        
        drawnow
        pause(0.01)
    end
    
    if save_vid
        close(v);
    end
end

% Helper function to create circle points
function [x, y] = circle_points(center_x, center_y, radius)
    theta = linspace(0, 2*pi, 50);
    x = center_x + radius * cos(theta);
    y = center_y + radius * sin(theta);
end