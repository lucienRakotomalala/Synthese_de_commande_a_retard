% TP - Synthèse d'une commande à retard - Application à un procédé électro-mécanique
% M2 - ISTR - Semestre 2
% Lucien Rakotomalala - David Tocaven
% Fichiers Contenant le correcteur par spectre fini
Modeles
%%
vp_desirees = [ -1/8 , -1/3 ] ;
K =place(m.ee(2).a,m.ee(2).b,vp_desirees);

ex1 = expm(m.ee(2).a*h);

