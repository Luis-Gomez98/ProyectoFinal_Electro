%% Teori­a Electromagnetica - Proyecto
%Universidad del Valle de Guatemala
%Diego Aguilar;18044
%Helder Ovalle;18349
%Luis Gomez;18291
%Dipolos
%%

%Realizar las graficas en coordenadas esfericas de los campos y de los potenciales encontrados en 
%el inciso anterior.
%clearvars
%po = 10;

e0 = 8.85 .*10 .^-12;
q=0.0000005;
a=5;

num1 = 3.*q.*a.^2;

R = linspace(-1,1);
phi = linspace(0,pi/2,100)';
theta = linspace(0,2*pi,100)';

[phi,theta] = meshgrid(phi,theta);

R = meshgrid(R);


[X,Y,Z] = sph2cart(theta,phi,R);

V = @(R,theta,phi) (((num1.* (3.*(cos(theta) .* cos(theta))-1))./(16 .* pi .* e0 * R.^4)) - 
( (q.*a.^2.*(-3 .* (sin(2.*theta))) )./(16 .* pi .* e0 * R.^4)) )

figure(1);
surf(X,Y,V(R,theta,phi));
xlabel('X')
ylabel('Y')
zlabel('Potencial Electrico PX')
view (-47,32)
colorbar


%Obtener el campo eléctrico mediante el gradiente del potencial
[Exa, Eya] = gradient(V(R,theta,phi));
Exa = -Exa;
Eya = Eya./R;
Eza = sqrt(Exa.^2+Eya.^2);


figure(2);
quiver3(X,Y,X,Exa,Eya,Eza)
xlabel('X')
ylabel('Y')
zlabel('Z')
view (-47,32)
