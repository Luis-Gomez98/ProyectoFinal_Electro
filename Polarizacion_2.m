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

R = linspace(-1,1);
phi = linspace(0,pi,100)';
theta = linspace(0,2*pi,100)';

[phi,theta] = meshgrid(phi,theta);

R = meshgrid(R);


[X,Y,Z] = sph2cart(theta,phi,R);
%Superficiales
o_a = @(R,theta) ((-q/(4.*pi.*R.^2)).*(1-(1/e_R)));
o_b = @(R,theta) ((-q/(4.*pi.*R.^2)).*(1-(1/e_R)));

o_b = @(R,theta) (k.*R);
o_2b = @(R,theta) (-2.*k.*R);

%Volumetrica
p_p = (3.*k);


figure(1);
surf(X,Y,Z)
colorbar
title('Mapa de colores densidades de carga');
xlabel('x');
ylabel('y');
zlabel('z');
