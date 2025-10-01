function [y1, y2] = zad1()
% ZAD1 funkcja rozwiązująca układ równań różniczkowych zwyczajnych:
% 
%   [ dy1(t)/dt = -7*y1(t)-2y2(t)+x(t);
%     dy2(t)/dt = 2y1(t)-2y2(t)+x(t); ], 
% dla 0 <= t <= 8, x(t) = exp(-t)+sin(T)
% z wykorzystaniem pakietu symbolicznego. Nie przyjmuje ona żadnych
% argumentów wejściowych.
%
% Wyjście:
% y1, y2 - zmienne symboliczne będące rozwiązaniem układu równań

%close all
ax = [0 8 -0.015 0.15];
syms y1(t) y2(t) t
tspan = [0 8];
dy1 = diff(y1,t);
dy2 = diff(y2,t);
eqn1 = dy1 == -7*y1(t) - 2*y2(t) + exp(-t) .* sin(t);
eqn2 = dy2 == 2*y1(t) - 2*y2(t) + exp(-t) .* sin(t);
cond = [y1(0) == 0 y2(0) == 0];
[y1(t), y2(t)] = dsolve([eqn1 eqn2], cond);
%figure
%subplot(3,2,1);
%fplot(y1,tspan, '-r');
%hold on
%fplot(y2,tspan, '-b');
%legend("y1", "y2");
%title("Rozwiązanie procedurą dsolve");
%axis(ax);

end