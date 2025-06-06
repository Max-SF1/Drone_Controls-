
%%% QUESTION 1 - drone trajectory plot + state variable plots.
Drone_model;

%%% QUESTION 2
% 2.3+2.4 - simulink plot 
modelName1 = 'dynamical_system_question_2';
load_system(modelName1);       
simOut = sim(modelName1);      
open_system([modelName1 '/Scope']);
pause(1);  %needed to get scopes to open up! 

% Drone phase diagram with x and z
load('x.mat');      x = ans;
load('z.mat');      z = ans;
load('theta.mat');  theta = ans;
t_sim      = x.Time;
x_sim      = x.Data;
z_sim      = z.Data;
theta_sim  = theta.Data;
save_vid = false;
drone_animation_2D(t_sim, x_sim, z_sim, theta_sim,-10,1,-1,1, save_vid);
% plot_drone_trajectories(t_sim, x_sim, z_sim, theta_sim, " nonlinear system");

%%% QUESTION 3 
modelName2 = 'linearized_system_question_3';
load_system(modelName2);       
simOut = sim(modelName2);      
open_system([modelName2 '/Scope']);
pause(1);

% Drone phase diagram with x and z
load('x_3.mat');      x = ans;
load('z_3.mat');      z = ans;
load('theta_3.mat');  theta = ans;
t_sim      = x.Time;
x_sim      = x.Data;
z_sim      = z.Data;
theta_sim  = theta.Data;
save_vid = false;
drone_animation_2D(t_sim, x_sim, z_sim, theta_sim,-1,1,-1,10, save_vid);
% plot_drone_trajectories(t_sim, x_sim, z_sim, theta_sim, " linearized system");

%%%% QUESTION 4 

modelName3 = 'transfer_function_question_4';
load_system(modelName3);       
simOut = sim(modelName3);      
open_system([modelName3 '/Scope']);
pause(1);

modelName4 = 'transfer_function_question_4_closed_loop';
load_system(modelName4);       
simOut = sim(modelName4);      
open_system([modelName4 '/Scope']);
pause(1);

modelName5 = 'transfer_function_question_4_pid_with_g';
load_system(modelName5);       
simOut = sim(modelName5);      
open_system([modelName5 '/Scope']);
pause(1);

modelName6 = 'transfer_function_question_4_pid_no_g';
load_system(modelName6);       
simOut = sim(modelName6);      
open_system([modelName6 '/Scope']);
pause(1);

%%% QUESTION 5.3
modelName1 = 'Q53';
load_system(modelName1);       
simOut = sim(modelName1);      
open_system([modelName1 '/Scope']);
pause(1);  %needed to get scopes to open up! 

%%% QUESTION 5.4 + 5.5
modelName1 = 'Q54';
load_system(modelName1);       
simOut = sim(modelName1);      
open_system([modelName1 '/Scope']);
open_system([modelName1 '/Scope1']);
open_system([modelName1 '/Scope2']);
open_system([modelName1 '/Scope3']);
open_system([modelName1 '/Scope4']);
open_system([modelName1 '/Scope5']);
pause(1);  %needed to get scopes to open up! 

%%% QUESTION 5.6
modelName1 = 'Q56';
load_system(modelName1);       
simOut = sim(modelName1);      
open_system([modelName1 '/Scope']);
open_system([modelName1 '/Scope1']);
open_system([modelName1 '/Scope2']);
pause(1);  %needed to get scopes to open up! 

% 5.7 
load('X1_yair.mat');      x = ans;
load('Z1_yair.mat');      z = ans;
load('Theta1_yair.mat');  theta = ans;
t_sim      = x.Time;
x_sim      = x.Data;
z_sim      = z.Data;
theta_sim  = theta.Data;
save_vid = false;
drone_animation_2D(t_sim, x_sim, z_sim, theta_sim,-1,3,0,6, save_vid);
% plot_drone_trajectories(t_sim, x_sim, z_sim, theta_sim, " nonlinear system");


% 5.7 another option
load('X_yair.mat');      x = ans;
load('Z_yair.mat');      z = ans;
load('Theta_yair.mat');  theta = ans;
t_sim      = x.Time;
x_sim      = x.Data;
z_sim      = z.Data;
theta_sim  = theta.Data;
save_vid = false;
drone_animation_2D(t_sim, x_sim, z_sim, theta_sim,-1,1,-1,1, save_vid);
% plot_drone_trajectories(t_sim, x_sim, z_sim, theta_sim, " nonlinear system");


