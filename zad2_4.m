function [y] = zad2_4(h,y)
% ZAD2_4 funkcja rozwiązująca układ równań różniczkowych zwyczajnych
% przy pomocy tabeli Butchera
% 
% Wejście:
%  h - krok 
%  y - wektor wartości [y(1)]
% Wyjście:
%  y - macierz, w której pierwsza kolumna odpowiada wartościom y1(t).
%      a druga y2(t)

%subplot(3,2,5);
A = [-7 -2; 2 -2];
ax = [0 8 -0.015 0.15];
tspan = [0:h:8];
n = length(tspan);
I = eye(2,2);
c = [0 1/2 1];
a = [1/30 -1/15 1/30; 
     5/24 1/3 -1/24; 
     2/15 11/15 2/15];
L = [  I-h*a(1,1)*A  -h*a(1,2)*A    -h*a(1,3)*A;
      -h*a(2,1)*A     I-h*a(2,2)*A  -h*a(2,3)*A;
      -h*a(3,1)*A    -h*a(3,2)*A     I-h*a(3,3)*A ];

w = [1/6 2/3 1/6];
for i=2:n
    p = [ myOde(tspan(i-1) + c(1)*h, y(i-1,:));
          myOde(tspan(i-1) + c(2)*h, y(i-1,:));
          myOde(tspan(i-1) + c(3)*h, y(i-1,:)) ];
    g = L\p;
    g = reshape(g, [2 3]);
    f(1,:) = [g(1) g(2)];
    f(2,:) = [g(3) g(4)];
    f(3,:) = [g(5) g(6)];
    y(i,1) = y(i-1,1) + sum(h * w*f(:,1));
    y(i,2)= y(i-1,2) + sum(h*w*f(:,2));
end
%plot(tspan, y(:,1), '-r', tspan, y(:,2), '-b');
%title("Metoda z tabelą Butchera");
%axis(ax);
%legend("y1", "y2");
end