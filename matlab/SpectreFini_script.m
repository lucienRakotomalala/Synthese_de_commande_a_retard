% TP - Synth�se d'une commande � retard - Application � un proc�d� �lectro-m�canique
% M2 - ISTR - Semestre 2
% Lucien Rakotomalala - David Tocaven
% Fichiers Contenant le correcteur par spectre fini
Modeles
%%
vp_desirees = [ -1/8 , -1/3 ] ;
K =place(m.ee(2).a,m.ee(2).b,vp_desirees);

ex1 = expm(m.ee(2).a*h);

