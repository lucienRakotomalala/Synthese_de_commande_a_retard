% TP - Synthèse d'une commande à retard - Application à un procédé électro-mécanique
% M2 - ISTR - Semestre 2
% Lucien Rakotomalala - David Tocaven
%% Fichier contenant les modèles du procédé
Parametres;
%% Fonctions de Transferts
m.ftVs  =   exp(tf([-h , 0] , [1])) * tf([ks*km*kr] , [taum , 1 , 0]);
m.ftVg  =   exp(tf([-h , 0] , [1])) * tf([kg*km] , [taum , 1]);

%% Espace d'état
m.ee    =   ss([m.ftVs; m.ftVg]) % a refaire

%% Affichages
% Fonctions de transfers
figure(1)
    % Vs/Um
    % Vg/Um
    step(m.ftVs,m.ftVg);
    legend( 'Vs(t)/Um(t)',...
            'Vg(t)/Um(t)');
    axis([0 5 0 3])
    
figure(2)
    bode(m.ftVs,m.ftVg)
    legend('Vs(j\omega)/Um(j\omega)',...
            'Vg(j\omega)/Um(j\omega)');
        
        