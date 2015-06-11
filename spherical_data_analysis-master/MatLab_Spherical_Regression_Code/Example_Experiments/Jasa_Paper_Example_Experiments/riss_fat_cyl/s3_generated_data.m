% Note to self. Doxygen documentation might be of help in LaTeXing things. Look up for matlab syntax.
% note : kappa vs kappax
M=4; %specifies dimensions (S*2 in R^3) 
% note : try M=4 and think of projections of S^4. 
% note : if we assume fourth dimension as time and plot data in S^2? The sphere will deform. It shrinks and grows. References are in the google doc.
N=100; %no of observations
kappax=6;% concentration parameter for x
kappa=10;% concentration parameter for x
A0=A0_generator(4); % randomly generates transformation matrix in SL(M)
%% Generate x
% X=randvonMisesFisherm(M, N, kappax,[0,0,1]);
X=randvonMisesFisherm(M, N, kappax);

% function [ X ] = randvonMisesFisherm(m, n, kappa, mu)
% RANDVONMISESFISHERM Random number generation from von Mises Fisher
% distribution.
% X = randvonMisesFisherm(m, n, kappa) returns n samples of random unit 
% directions in m dimensional space, with concentration parameter kappa,
% and the direction parameter mu = e_m
% X = randvonMisesFisherm(m, n, kappa, mu) with direction parameter mu
% (m-dimensional column unit vector)


%% Apply PLT
MUi=A0*X; 
MUi=MUi./(ones(M,1)*sqrt(sum(MUi.^2,1)));
%% Add Noise to Mean directions to generate y
mu=[-1,-1,1]'/sqrt(M);
Y=MUi;
for n=1:N
Y(:,n)=randvonMisesFisherm(M, 1, kappa,MUi(:,n));
end
%% save
%  save estimation_example_PLT_NR.mat X Y MUi kappa A0 M N

[Ahat,e,Xtilde,path]= PLT_GA(X, Y);
% 
figure(1);
plot(e/no_of_obs ,'linewidth',2);
hold on
fnA0=trace(Y'*Y)/no_of_obs ; %noiseless data => Y = MUi

% plot(repmat(fnA0,1,length(e)))
%repmat repeats copies of matrix fnA0 into a 1*length(e) arrangement.
%Commenting this line out gives a more "sharp" plot

% set(gca,'Linewidth',2,'fontsize',20);
%Not awesome. 

% TODO. xlim and ylim are for specifying domain of the graph. 
% xlim([0,length(e)]);
% ylim([0,1.1]);

% figure(2);

%This just takes in first three rows(dimensions) by default and plots them. 
%Existential question : how is it on a sphere?!

% center=mean(final_hypsph,2);
% Display_Path(init_hypsph, final_hypsph, path)

% init_hypsph_trim = init_hypsph(2:4,:)
% final_hypsph_trim = final_hypsph(2:4,:)
% Display_Path(init_hypsph_trim, final_hypsph_trim, path)


