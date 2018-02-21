% TP - Synthèse d'une commande à retard - Application à un procédé électro-mécanique
% M2 - ISTR - Semestre 2
% Lucien Rakotomalala - David Tocaven
% Fichiers Contenant le correcteur par spectre fini
Modeles
%%
vp_desirees = [ -1/8 , -1/3 ] ;
K =place(m.ee(2).a,m.ee(2).b,vp_desirees);

ex1 = expm(m.ee(2).a*h);

%%
syms nabla
%Co = [B , A*B];
Co = [  0               , (km*kr*nabla)/taum;
        (km*nabla)/taum , -(km*nabla)/taum^2];
%O = [ C ; C*A];
O = [   0   ,   kg;
        ks  ,   0;
        0   ,   -kg/taum;
        0   ,	kr*ks];
