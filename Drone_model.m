close all
clearvars
clc
%% define the motion track
sim_duration = 10;
sim_framerate = 0.03;
f_s = 0.25;
f_x = 0.5/(2*pi);
f_pitch = 0.05;
% % --- Edit this code (1.1)
t = 0:sim_framerate:sim_duration;
x = 0.5 + 0.5*sin((2*pi*f_x*t)-pi/2);
z = 0.2*t;
pitch = 90*cos(2*pi*f_pitch*t-pi);
% % ------------------
%
% %% animate
save_vid = true;
drone_animation_2D(t, x, z, pitch, 0, 1, 0, 2.2, save_vid);
plot_drone_trajectories(t, x, z, pitch, "First Question");
plot_drone_subplots(t, x, z, pitch, "three distinct plots Q1");