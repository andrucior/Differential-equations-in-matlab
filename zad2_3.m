function [y] = zad2_3(h, y)
% ZAD2_3 funkcja rozwiązująca układ równań różniczkowych zwyczajnych za
% pomocą metody danej wzorem:
% y(n) = y(n-1)+h/12*(5*f(t(n), y(n))+8f(t(n-1), y(n-1))-5*f(t(n-2),
% y(n-2)))
% 
% Wejście:
%  h - krok 
%  y - wektor wartości [y(1) y(2)]
% Wyjście:
%  y - macierz, w której pierwsza kolumna odpowiada wartościom y1(t).
%      a drugi y2(t)


tspan = [0:h:8];
n=length(tspan);
y = zeros(n,2);
x = @(t) sin(t) * exp(-t);
A = [-7 -2; 2 -2];
y(2,:) = inv(eye(2,2) - h*A) * ((y(1,:) + h*x(tspan(2))))';

for i=3:n
    y(i,:) = inv(eye(2,2)-5/12*h*A) * (y(i-1,:)' + h/12*(5*x(tspan(i))+8*A*y(i-1,:)'+8*x(tspan(i-1))-...
        A*y(i-2,:)'-x(tspan(i-2)))); 
end

end % function