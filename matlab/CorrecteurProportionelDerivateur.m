% TP - Synthèse d'une commande à retard - Application à un procédé électro-mécanique
% M2 - ISTR - Semestre 2
% Lucien Rakotomalala - David Tocaven
% Fichiers Contenant les paramètres et les modèles du procédé
Modeles
    
%% Parametres du correcteur
% Gain proportionnel
k0 = 1/(2.42*ks*kr*km);
%Gain dérivateur 
di = taum;

%% Fonction de transfert du correcteur
corPD = tf([di k0],1);

%% Boucle fermé
% Vitesse disponible sur la 2nd sortie de ee
%systemeBoucleFerme = feedback(m.ee(2)*corPD,1);
%bode(systemeBoucleFerme)


ome = k0*ks*kr*km;
atan((k0*ks*kr*km)/(i*ome))

%% Affichage 
figure(4)
    plot(VgCorPD.time,[0 ;ones(length(VgCorPD.time)-1,1)],... % ref
         VgCorPD.time,.95*ones(size(VgCorPD.time)),... % 95% Pour le temps de réponse
         VgCorPD.time,.63*ones(size(VgCorPD.time)),... % 63% pour tau => Temps de monté
         VgCorPD.time,VgCorPD.signals.values)
    grid on
    legend('U_m(t)','95%','63%','Vg(t) BF')
    title('Réponse à un échelon unité en BF avec un PD')
    axis([-.5 20 0 1.1])
%% Tr 95%
Tr95 = mean([7.229 7.29])

