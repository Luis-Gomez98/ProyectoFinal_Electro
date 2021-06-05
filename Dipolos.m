%% Teori�a Electromagnetica - Proyecto
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
po = 10;

R = linspace(-1,1);
phi = linspace(0,pi/2,100)';
theta = linspace(0,2*pi,100)';

[phi,theta] = meshgrid(phi,theta);

R = meshgrid(R);


[X,Y,Z] = sph2cart(theta,phi,R);

V = @(R,theta,phi) ((po .* (sin(theta) .* cos(phi)))./(4 .* pi .* e0 * R.^2)) %potencial 1
V2 = @(R,theta,phi) ((po .* (sin(theta) .* sin(phi)))./(4 .* pi .* e0 * R.^2)) %potencial 2
V3 = @(R,theta) ((po .* (cos(theta)))./(4 .* pi .* e0 * R.^2)) %potencial 3

figure(1);
subplot (2,2,1)
surf(X,Y,V(R,theta,phi));
xlabel('X')
ylabel('Y')
zlabel('Potencial Electrico PX')
view (-47,32)
colorbar
subplot (2,2,2)
surf(X,Y,V2(R,theta,phi));
xlabel('X')
ylabel('Y')
zlabel('Potencial Electrico PY')
view (-47,32)
colorbar
subplot (2,2,3)
surf(X,Y,V3(R,theta));
xlabel('X')
ylabel('Y')
zlabel('Potencial Electrico PZ')
view (-47,32)
colorbar

%Obtener el campo el�ctrico mediante el gradiente del potencial
[Exa, Eya] = gradient(V(R,theta,phi));
Exa = -Exa;
Eya = Eya./R;
Eza = sqrt(Exa.^2+Eya.^2);

[Exb, Eyb] = gradient(V2(R,theta,phi));
Exb = -Exb;
Eyb = Eyb./R;
Ezb = sqrt(Exb.^2+Eyb.^2);

[Exc, Eyc] = gradient(V3(R,theta));
Exc = -Exc;
Eyc = Eyc./R;
Ezc = sqrt(Exc.^2+Eyc.^2);

figure(2);
quiver3(X,Y,X,Exa,Eya,Eza)
grid on
quiver3(X,Y,X,Exb,Eyb,Ezb)
hold on
quiver3(X,Y,X,Exc,Eyc,Ezc)
hold off
xlabel('X')
ylabel('Y')
zlabel('Z')
view (-47,32)

