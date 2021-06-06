%% Teori­a Electromagnetica - Proyecto
%Universidad del Valle de Guatemala
%Diego Aguilar;18044
%Helder Ovalle;18349
%Luis Gomez;18291
%Polarizacion
%%

%Densidades de carga
k = 10;
a = 3;
b = 4;
q = 0.000005;
e0 = 8.85 .*10 .^-12;
e_R = 2.7.*10 .^-12;
alfa = 10;

[theta,R] = meshgrid(0:2.*pi,2:10);

%Superficiales
o_a =  ((-q/(4.*pi.*a.^2)).*(1-(1/e_R)));
o_b =  ((-q/(4.*pi.*b.^2)).*(1-(1/e_R)));

o_b =  (k.*b);
o_2b =  (-2.*k.*b);

%Volumetrica
p_p = (3.*k);

dt = o_a + o_b + o_b + o_2b + p_p;

figure(1);
[X,Y] = pol2cart(theta,R);
surf(X,Y,dt)
colorbar
title('Mapa de colores densidades de carga');
xlabel('x');
ylabel('y');
zlabel('z');
