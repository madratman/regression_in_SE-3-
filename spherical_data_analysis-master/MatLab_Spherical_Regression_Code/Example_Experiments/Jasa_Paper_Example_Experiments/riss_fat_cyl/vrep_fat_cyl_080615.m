load('vrep_fat_cyl_080615.mat');
% init_z, init_y, init_x, init_gamma, init_beta, init_alpha, final_z, final_y, final_x, final_gamma, final_beta, final_alpha

init_alpha = init_alpha*pi/180;
init_beta = init_beta*pi/180;
init_gamma = init_gamma*pi/180;
final_alpha = final_alpha*pi/180;
final_beta = final_beta*pi/180;
final_gamma = init_alpha*pi/180;

%swarhmore.edu/NatSci/mzucker1/e27/diebel2006attitude.pdf Pg33 eq459
%TODO insert VREP convention link
% phi - alpha 
% theta - beta 
% psi - gamma
% init_hypsph = [];
% final_hypsph = [];
init_hypsph = zeros(100, 4);
final_hypsph = zeros(100, 4);
%TODO the following loop will take a lot of time to compute as the dataset
%get bigger. Use the BTP script in future. 
%Another way around this is to use cells. And use cell2mat in the end to
%transform it back into a simple array
%Or just fucking preallocate it by zeros or ones?

for i=1:size(init_alpha)    
    init_hypsph(i,:) =(cos(init_alpha(i)/2)*cos(init_beta(i)/2)*cos(init_gamma(i)/2)) - (sin(init_alpha(i)/2)*sin(init_beta(i)/2)*sin(init_gamma(i)/2)),
                    (cos(init_alpha(i)/2)*cos(init_beta(i)/2)*sin(init_gamma(i)/2)) + (sin(init_alpha(i)/2)*cos(init_gamma(i)/2)*sin(init_beta(i)/2)), 
                    (cos(init_alpha(i)/2)*cos(init_gamma(i)/2)*sin(init_beta(i)/2)) - (sin(init_alpha(i)/2)*cos(init_beta(i)/2)*sin(init_gamma(i)/2)),
                    (cos(init_alpha(i)/2)*sin(init_beta(i)/2)*sin(init_gamma(i)/2)) + (cos(init_beta(i)/2)*cos(init_gamma(i)/2)*sin(init_alpha(i)/2))

    final_hypsph(i,:) =(cos(final_alpha(i)/2)*cos(final_beta(i)/2)*cos(final_gamma(i)/2)) - (sin(final_alpha(i)/2)*sin(final_beta(i)/2)*sin(final_gamma(i)/2)),
                     (cos(final_alpha(i)/2)*cos(final_beta(i)/2)*sin(final_gamma(i)/2)) + (sin(final_alpha(i)/2)*cos(final_gamma(i)/2)*sin(final_beta(i)/2)),
                     (cos(final_alpha(i)/2)*cos(final_gamma(i)/2)*sin(final_beta(i)/2)) - (sin(final_alpha(i)/2)*cos(final_beta(i)/2)*sin(final_gamma(i)/2)),
                     (cos(final_alpha(i)/2)*sin(final_beta(i)/2)*sin(final_gamma(i)/2)) + (cos(final_beta(i)/2)*cos(final_gamma(i)/2)*sin(final_alpha(i)/2));
                
end



