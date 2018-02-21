% TP - Synthèse d'une commande à retard - Application à un procédé électro-mécanique
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
         VgCorSmith.time,.95*ones(size(VgCorSmith.time)),... % 95% Pour le temps de réponse
         VgCorSmith.time,.63*ones(size(VgCorSmith.time)),... % 63% pour tau => Temps de monté
         VgCorSmith.time,VgCorSmith.signals.values)
    grid on
    legend('U_m(t)','95%','63%','Vg(t) BF')
    title('Réponse à un échelon unité en BF avec un Préditeur de Smith')
    axis([-.5 20 0 1.1])
    %%
    savefig('fig5.fig','fig5')