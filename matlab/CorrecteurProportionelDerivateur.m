% TP - Synth�se d'une commande � retard - Application � un proc�d� �lectro-m�canique
% M2 - ISTR - Semestre 2
% Lucien Rakotomalala - David Tocaven
% Fichiers Contenant les param�tres et les mod�les du proc�d�
Modeles
    
%% Parametres du correcteur
% Gain proportionnel
k0 = 0.001;

%Gain d�rivateur 
di = taum;

%% Fonction de transfert du correcteur
corPD = tf([di k0],1)

%% Boucle ferm�
% Vitesse disponible sur la 2nd sortie de ee
systemeBoucleFerme = feedback(m.ee(2)*corPD,1);
bode(systemeBoucleFerme)
