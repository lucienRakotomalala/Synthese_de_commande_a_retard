% TP - Synthèse d'une commande à retard - Application à un procédé électro-mécanique
% M2 - ISTR - Semestre 2
% Lucien Rakotomalala - David Tocaven
% Fichiers Contenant les paramètres et les modèles du procédé
Modeles
    
%% Parametres du correcteur
% Gain proportionnel
k0 = 0.001;

%Gain dérivateur 
di = taum;

%% Fonction de transfert du correcteur
corPD = tf([di k0],1)

%% Boucle fermé
% Vitesse disponible sur la 2nd sortie de ee
systemeBoucleFerme = feedback(m.ee(2)*corPD,1);
bode(systemeBoucleFerme)
