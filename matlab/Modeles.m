% TP - Synthèse d'une commande à retard - Application à un procédé électro-mécanique
% M2 - ISTR - Semestre 2
% Lucien Rakotomalala - David Tocaven
% Fichier contenant les modèles du procédé
Parametres;
NOGRAPH = 1;
%% Fonctions de Transferts
m.ftVg  =   tf([kg*km] , [taum , 1],...
                'InputDelay',h);
m.ftVs  =   tf([ks*km*kr] , [taum , 1 , 0],...
                'InputDelay',h);

%% Espace d'état
%%%%%%%%%%%%%%%%%%%%%%%%%%
% Etats  =    [Theta_S ;
%             Omega_m ] 
%%%%%%%%%%%%%%%%%%%%%%%%%%
% Entrée = [Um]
%%%%%%%%%%%%%%%%%%%%%%%%%%
% Sorties = [V_g ;
%            V_s ]
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
m.A = [0 , kr       ;
       0 , -1/taum  ] ;  
 m.B = [0    ;
        km/taum];
m.C = [ 0 , kg      ;
       ks , 0       ];
m.D = [0;
       0];

   
%%
%DelayT = struct('delay',h,'a',zeros(2),'b',ones(2,1),'c',zeros(2),'d',zeros(2,1));
%%
m.ee = ss(m.A,m.B,m.C,m.D,'InputDelay',h); 

%% Affichages
% Fonctions de transfers
if(NOGRAPH ~= 1)
 %%
figure(1)
    % fts
    subplot(2,1,1)
        step(tf(1),m.ftVg,...
            tf(1),m.ftVs);
        title('Réponse indicielle du modèle fonctions de transferts')
        legend( 'V_g(t)',...
                'V_s(t)');
        axis([0 5 0 3])    
        grid on
     % ee
    subplot(2,1,2)
        step(m.ee(1),m.ee(2));
        title('Réponse indicielle du modèle espace d''état')
        legend( 'V_g(t)',...
                'V_s(t)');
        axis([0 5 0 3])     
        grid on
%%        
figure(2)
    % Vs/Um
    % Vg/Um
    subplot(2,1,1)
        step(m.ftVs-m.ee(2));
        title('Erreur des modèles en position (ft-ee)')
    subplot(2,1,2)
        step(m.ftVg-m.ee(1));
        title('Erreur des modèles en vitesse (ft-ee)')
%%        
figure(3)
    bode(m.ftVg,m.ftVs)
    le=legend('Vs(j\omega)/Um(j\omega)',...
            'Vg(j\omega)/Um(j\omega)',...
            'Location','SouthWest');
    title('Réponses fréquentielles des fonctions de transferts')    
%%
[u,t]= gensig('sin',10);
figure(4)
  h=  lsim(m.ee,u,t);
    grid on
end % NOGRAPH    
 %% Etude de stabilité - méthode 2D - calcul des racines 
 stab2D =roots([taum^2, 0 , - 1,0, (ks*km*kg)^2]);
 disp('Les racines sont :');
 disp(stab2D);
 
 

 %% syst 1er ordre
 
K   = 1.1;
tau = .2;
if (NOGRAPH ~=1)
    figure(1)
    step(3.2*tf([K],[tau 1]))
    grid on
end
 %% Controlabilité & Observabilité
 disp('Le modèle est commandable (1/0) :')    
 disp(rank(ctrb(m.ee)) == length(m.A))
 
disp('Le modèle est observable (1/0) :')    
 disp(rank(obsv(m.ee))==length(m.A))     
