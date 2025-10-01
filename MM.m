clear
[y1, y2] = zad1();
% n = flip([1 2 4 10 20 40 80 800]); % Odkomentować do wykresu err(h)
% h = 8 ./ n;                        % jw.
h = 0.2;    % Odkomentować do wykresu porównującego rozwiązania,
              % w zależności od h otrzymana zostanie inna dokładność

close all
figure
j = 0;

for i=1:length(h)
    y3 = zad2_1(h(i));
    y = zeros(8/h(i)+1,2);
    % pkt.2 
    y4 = zad2_2(h(i),y);
    % pkt.3
    y5 = zad2_3(h(i),y);
    % pkt.4
    y6 = zad2_4(h(i),y);
    er(1,i+j:i+j+1) = err(y1,y2,y4,h(i));
    er(2,i+j:i+j+1) = err(y1,y2,y5,h(i));
    er(3,i+j:i+j+1) = err(y1,y2,y6,h(i));
    j = j + 1;
end

loglog(h, er(:,1:2:end));
grid on
legend("Zmodyfikowana metoda Eulera", "Metoda Adamsa-Bashfortha", ...
    "Metoda z tabelą Butchera");
xlabel("h");
ylabel("delta");
figure
loglog(h, er(:,2:2:end));
grid on
legend("Zmodyfikowana metoda Eulera", "Metoda Adamsa-Bashfortha", ...
    "Metoda z tabelą Butchera");
xlabel("h");
ylabel("delta");
% zamkn. euler do n-2
pause
close all
figure
t = [0:h:8];
fplot(y1);
hold on
plot(t, y3(:,1), t, y4(:,1), t, y5(:,1), t, y6(:,1));
grid on
axis([0 8 -0.05 0.05]);
legend("Procedura dsolve", "Procedura ode45", ...
    "Zmodyfikowana metoda Eulera", "Metoda Adamsa-Bashfortha", ...
    "Metoda z tabelą Butchera");
%title("Porównanie metod dla y1 dla kroku h = 0.4");
xlabel("t");
ylabel("y1");
figure
hold on
grid on
fplot(y2);
plot(t, y3(:,2),t, y4(:,2), t, y5(:,2), t, y6(:,2));
axis([0 8 -0.15 0.15]);
legend("Procedura dsolve", "Procedura ode45", ...
    "Zmodyfikowana metoda Eulera", "Metoda Adamsa-Bashfortha", ...
    "Metoda z tabelą Butchera");
%title("Porównanie metod dla y2 dla kroku h = 0.4");
xlabel("t");
ylabel("y2");