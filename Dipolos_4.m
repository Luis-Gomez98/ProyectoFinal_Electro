%% Teori­a Electromagnetica - Proyecto
%Universidad del Valle de Guatemala
%Diego Aguilar;18044
%Helder Ovalle;18349
%Luis Gomez;18291
%Dipolos4
%%

%Realizar las graficas en coordenadas esfericas de los campos y de los potenciales encontrados en 
%el inciso anterior.
%clearvars
%po = 10;

e0 = 8.85 .*10 .^-12;
const1 = 4.*pi.*e0;

R = linspace(-1,1);
phi = linspace(0,pi/2,100)';
theta = linspace(0,2*pi,100)';

[phi,theta] = meshgrid(phi,theta);

R = meshgrid(R);


[X,Y,Z] = sph2cart(theta,phi,R);

V = @(R,theta) ((1/const1).*(((1/4)-(R.^2)/120).*((((3.*((cos(theta)).^2))-1)/2))));

figure(1);
surf(X,Y,V(R,theta));
xlabel('X')
ylabel('Y')
zlabel('Potencial Electrico')
view (-47,32)
colorbar


%Obtener el campo eléctrico mediante el gradiente del potencial
[Exa, Eya] = gradient(V(R,theta));
Exa = -Exa;
Eya = Eya./R;
Eza = sqrt(Exa.^2+Eya.^2);


figure(2);
quiver3(X,Y,X,Exa,Eya,Eza)
xlabel('X')
ylabel('Y')
zlabel('Z')
view (-47,32)
