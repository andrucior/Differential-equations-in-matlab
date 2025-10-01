function dydt = myOde(t,y) 
% MYODE funkcja reprezentująca układ równań różniczkowych zwyczajnych 
% z z zadania

    x = sin(t) * exp(-t);
    dydt = zeros(2,1);
    dydt(1) = -7*y(1)-2*y(2)+x;
    dydt(2) = 2*y(1)-2*y(2)+x;
end