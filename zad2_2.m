function [y] = zad2_2(h, y)
% ZAD2_2 funkcja rozwiązująca układ równań różniczkowych zwyczajnych za
% pomocą metody danej wzorem:
% y(n) = y(n-1)+h*f(t(n-1)+h/2, y(n-1)+h/2*f(t(n-1), y(n-1))
% 
% Wejście:
%  h - krok 
%  y - wartość y(1)
% Wyjście:
%  y - macierz, w której pierwsza kolumna odpowiada wartościom y1(t).
%      a drugi y2(t)

tspan = [0:h:8];
n = length(tspan);

x = @(t) exp(-t) .* sin(t);
A=[-7 -2; 2 -2];

for i = 2:n
  y_mid = y(i - 1, :)' + h / 2 * (A * y(i - 1, :)' + x(tspan(i - 1)));
  y(i, :) = y(i - 1, :) + h * (A * y_mid + x(tspan(i - 1) + h / 2))';
end

end