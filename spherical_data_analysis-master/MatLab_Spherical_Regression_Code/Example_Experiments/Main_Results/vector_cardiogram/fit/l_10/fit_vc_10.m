%%
clear; close all
lambda=0.01;l=10;NN=60;
filename='Vector_Cardiogram_All_cv'
% filename='Vector_Cardiogram_girls_cv'
%% load data
load([filename '.mat'])
[M,N]=size(X);
%%
[Grid2,E,Xtilde,path] = NPSR(X,Y,lambda,l,NN);
%%
load GRID_10_60.mat
grid2=reshape(Grid2(:,:,:,end),NNNN,3)';
[Xtilde,neighbors]=interpsurf(grid,grid2,X);
%%
save([filename '_3_fitted.mat'])

save([filename '_3_fitted_light.mat'],'grid','grid2')
