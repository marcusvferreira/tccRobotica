% implementacao da matriz de Denavit-Hantenberg 
% deve receber os angulos theta e alfa na unidade graus
function dh = denavit(theta, d, a, alfa)
dh = [cosd(theta) -cosd(alfa)*sind(theta) sind(alfa)*sind(theta) a*cosd(theta); 
      sind(theta) cosd(alfa)*cosd(theta) -sind(alfa)*cosd(theta) a*sind(theta); 
      0 sind(alfa) cosd(alfa) d; 
      0 0 0 1];
