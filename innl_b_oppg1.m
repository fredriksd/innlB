
%1a)
A = [ 0.3 22.7 48.8 73.2 88.4 82.8 58.7 26.2 3.9]; % m^2
h = 10; % m

ret = simpson(A,h); %Se funksjon nederst
disp(['Volumet av skipet er ' num2str(ret) 'm^3'])


%1b)

clear
load tankskip
%{
figure(1)
plot(T,A), grid on, hold on
xlabel('Dyptgående (m)')
ylabel('Vannlinjearealet (m^2)')
area(T(T<=11),A(T<=11)), hold off %volum regnet ut fra 1c)
%}

%1c)

volume = trapz_(A(T<=11),T(T<=11))+V2;%Volum i m^3
fprintf('Volumet av skipet med T = 11: %d m^3 \n',volume)

%1d)
m_ship = 35000000; %35 000 tonn
rho = 1025; %Massetettheten til saltvann (kg/m^3)

displaced_volume = m_ship/1025; %Får svaret i m^3
fprintf('Volum av fortrengt vann: %d m^3 \n', displaced_volume)

%1e)
cnt = 2.3;
new_volume = V2;

while(new_volume <= displaced_volume)
    new_volume = V2 + trapz_(A(T<=cnt),T(T<=cnt));
    if(new_volume > displaced_volume)
        break
    end
    cnt = cnt+0.3;
end

disp(['Dyptgående T må være: ',num2str(cnt) ' m'])

%Simpson's metode tilpasset antall punkter i et array, gitt med et fast
%intervall h mellom hver x - verdi
%Denne funksjonen funker bare for gitte y-verdier og gitt dx/h-verdi
function ret = simpson(list, h)
    ret = 0;
    for i = 2:2:length(list)
       ret = ret + (list(i-1) + 4*list(i) + list(i+1)); 
    end
    ret = ret * h/3;
end

function ret = trapz_(listy,listx)
    ret = listy(1);
    n = length(listx)-1; %antall intervall = antall x-verdier - 1
    dx = (listx(end)-listx(1))/n;
    for i = 2:(n)
       ret = ret + 2*listy(i); 
    end
    ret = ret + listy(end);
    ret = ret*dx/2;
end
