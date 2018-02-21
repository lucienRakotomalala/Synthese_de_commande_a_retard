% TP - Synth�se d'une commande � retard - Application � un proc�d� �lectro-m�canique
% M2 - ISTR - Semestre 2
% Lucien Rakotomalala - David Tocaven
% Fichiers Contenant le correcteur avec predicteur de Smith

%% Utilisation du correcteur de Spectre
SpectreFini_script

%% Ajout Perturbation
p0 = 100;
h = 5
%% Etude des perturbations

%% Affichage 
save('VgCorSmith.mat','VgCorSmith')
fig5=figure(5);
    plot(VgCorSmith.time,[0 ;ones(length(VgCorSmith.time)-1,1)],... % ref
         VgCorSmith.time,.95*ones(size(VgCorSmith.time)),... % 95% Pour le temps de r�ponse
         VgCorSmith.time,.63*ones(size(VgCorSmith.time)),... % 63% pour tau => Temps de mont�
         VgCorSmith.time,VgCorSmith.signals.values)
    grid on
    legend('U_m(t)','95%','63%','Vg(t) BF')
    title('R�ponse � un �chelon unit� en BF avec un Pr�diteur de Smith')
    axis([-.5 20 0 1.1])
    %%
    savefig('fig5.fig','fig5')