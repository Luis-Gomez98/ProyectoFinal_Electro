%% Teori­a Electromagnetica - Proyecto
%Universidad del Valle de Guatemala
%Diego Aguilar;18044
%Helder Ovalle;18349
%Luis Gomez;18291
%Dipolos2
%%

%Realizar las graficas en coordenadas esfericas de los campos y de los potenciales encontrados en 
%el inciso anterior.
%clearvars
e0 = 8.85 .*10 .^-12;
po = 0.000001;

R = linspace(-5,5);
theta = linspace(0,pi/4,100)';
alfa = linspace(0,2*pi,100)';

[theta,alfa] = meshgrid(theta,alfa);

R = meshgrid(R);


[X,Y,Z] = sph2cart(alfa,theta,R);

V = @(R,alfa,theta) (((po .* sin(alfa).*sin(theta))./(4 .* pi .* e0 * R.^2))  + ((po .* cos(alfa))./(4 .* pi .* e0 * R.^2)) )

figure(1);
surf(X,Y,V(R,alfa,theta));
xlabel('X')
ylabel('Y')
zlabel('Potencial Electrico PX')
view (-47,32)
colorbar
%Obtener el campo eléctrico mediante el gradiente del potencial
[Exa, Eya] = gradient(V(R,alfa,theta));
Exa = -Exa;
Eya = Eya./R;
Eza = sqrt(Exa.^2+Eya.^2);

figure(2);
quiver3(X,Y,X,Exa,Eya,Eza)
grid on
xlabel('X')
ylabel('Y')
zlabel('Z')
view (-47,32)
