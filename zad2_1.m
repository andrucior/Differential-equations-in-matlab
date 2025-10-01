function [y, t] = zad2_1(h)
% ZAD2_1 funkcja rozwiązująca układ równań różniczkowych zwyczajnych za
% pomocą metody danej wzorem:
% y(n) = y(n-1)+h*f(t(n-1)+h/2, y(n-1)+h/2*f(t(n-1), y(n-1))
% Nie przyjmuje żadnych argumentów wejściowych.
%
% Wyjście:
%  y - macierz, w której pierwsza kolumna odpowiada wartościom y1(t).
%      a drugi y2(t)

y0 = [0; 0];
tspan = 0:h:8;
[t, y] = ode45(@myOde, tspan, y0);

end