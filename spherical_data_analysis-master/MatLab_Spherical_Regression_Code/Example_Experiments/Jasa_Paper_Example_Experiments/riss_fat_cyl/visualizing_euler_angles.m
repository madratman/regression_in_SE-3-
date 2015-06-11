load('vrep_fat_cyl_080615.mat');
% init_z, init_y, init_x, init_gamma, init_beta, init_alpha, final_z, final_y, final_x, final_gamma, final_beta, final_alpha
no_of_obs = 100;

init_alpha = init_alpha*pi/180;
init_beta = init_beta*pi/180;
init_gamma = init_gamma*pi/180;
final_alpha = final_alpha*pi/180;
final_beta = final_beta*pi/180;
final_gamma = init_alpha*pi/180;

init_orientation = [init_alpha, init_beta, init_gamma];
init_orientation = init_orientation';

final_orientation = [final_alpha, final_beta, final_gamma];
final_orientation = final_orientation.';

[sphereX,sphereY,sphereZ]=sphere;
r=.96;
r2=.99;
surf(sphereX*r,sphereY*r,sphereZ*r)
axis equal;colormap(gray(100)*.7); hold on;
scatter3(r2*init_orientation(1,:),r2*init_orientation(2,:),r2*init_orientation(3,:),100,'w','fill',...
'MarkerEdgeColor','black')