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
e0 = 8.85 .*10 .^-12;
po = 1;

R = linspace(-20,100);
phi = linspace(0,pi,100)';
theta = linspace(0,2*pi,100)';

[phi,theta] = meshgrid(phi,theta);
R = meshgrid(R);


[X,Y,Z] = sph2cart(theta,phi,R);

V = @(r,theta,phi) ((po .* (sin(theta) .* cos(phi)))./(4 .* pi .* e0 * R.^2)) %potencial 1
V2 = @(r,theta,phi) ((po .* (sin(theta) .* sin(phi)))./(4 .* pi .* e0 * R.^2)) %potencial 2
V3 = @(r,theta,phi) ((po .* (cos(theta)))./(4 .* pi .* e0 * R.^2)) %potencial 3


subplot (2,2,2)
surf(X,Y,V(R,theta,phi));
xlabel('X')
ylabel('Y')
zlabel('Potencial Electrico')
view (-47,32)

%Graficamos Potencial Eléctrico (Curvas de Nivel)
subplot (2,2,1)
contourf(X,Y,V(R,theta,phi))
xlabel('X')
ylabel('Y')
zlabel('Potencial Electrico')

colorbar




