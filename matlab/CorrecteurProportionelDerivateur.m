% TP - Synthèse d'une commande à retard - Application à un procédé électro-mécanique
% M2 - ISTR - Semestre 2
% Lucien Rakotomalala - David Tocaven
% Fichiers Contenant le correcteur proportionnel derivé
Modeles
    
%% Parametres du correcteur
Tr_desirer = 8;
tauBF = (Tr_desirer -h )/3;
%%
% Gain proportionnel
k0 = 1/(tauBF*ks*kr*km);
%Gain dérivateur 
di = taum;

%% Fonction de transfert du correcteur
corPD = tf([di k0],1);

%% Boucle fermé
% Vitesse disponible sur la 2nd sortie de ee
%systemeBoucleFerme = feedback(m.ee(2)*corPD,1);
%bode(systemeBoucleFerme)


ome = k0*ks*kr*km;
a   = atan((k0*ks*kr*km)/(i*ome));

%% Affichage 
save('VgCorPD.mat','VgCorPD')
fig4=figure(4);
    plot(VgCorPD.time,[0 ;ones(length(VgCorPD.time)-1,1)],... % ref
         VgCorPD.time,.95*ones(size(VgCorPD.time)),... % 95% Pour le temps de réponse
         VgCorPD.time,.63*ones(size(VgCorPD.time)),... % 63% pour tau => Temps de monté
         VgCorPD.time,VgCorPD.signals.values)
    grid on
    legend('U_m(t)','95%','63%','Vg(t) BF')
    title('Réponse à un échelon unité en BF avec un PD')
    axis([-.5 20 0 1.1])
    %%
    savefig('fig4.fig','fig4')
%% Tr 95%
Tr95 =7.805;

syms p;
syms ksf;
solve(taum*p^2+p+ksf*km*kr*ks==0,ksf)

%% Version par simplication

mPD.BO = tf(k0*ks*kr*km ,[1 0],...
           'InputDelay',h);

mPD.BF = feedback(mPD.BO,1);


figure(5) 
    step(mPD.BF)
    grid on
    title('Réponse à un échelon unité en BF, avec un correcteur PD')
    
%%
mPD.stepinf = stepinfo(mPD.BF,'SettlingTimeThreshold',.05)
fprintf('Temps de réponse : %f secondes\n',mPD.stepinf.SettlingTime);


