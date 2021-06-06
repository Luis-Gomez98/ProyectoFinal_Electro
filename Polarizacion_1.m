%% Teori�a Electromagnetica - Proyecto
%Universidad del Valle de Guatemala
%Diego Aguilar;18044
%Helder Ovalle;18349
%Luis Gomez;18291
%Polarizacion
%%

%Densidades de carga
k = 10;
a = 1;
b = 1;

alfa = 10

[theta,R] = meshgrid(0:2.*pi,2:10);

%Superficiales
o_a =  (-k.*(e.^((-a.^2)./alfa)));
o_b =  (k.*(e.^((-b.^2)./alfa)));

%Volumetrica
p_p = (((-k.*(e.^((-R.^2)./alfa)))./R).*(1-((2.*R.^2)./alfa)));

dt = o_a + o_b + p_p;
figure(1);
[X,Y] = pol2cart(theta,R);
surf(X,Y,dt)
colorbar
title('Mapa de colores densidades de carga');
xlabel('x');
ylabel('y');
zlabel('z');


