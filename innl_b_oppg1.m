%{
%1a)
%Simpsons metode for punkter

A = [ 0.3 22.7 48.8 73.2 88.4 82.8 58.7 26.2 3.9]; % m^2
h = 10; % m

ret = simpson(A,h);
disp(['Volumet av skipet er ' num2str(ret) 'm^3'])

function ret = simpson(list, iv)
    ret = 0;
    for i = 2:(length(list)-1)
        ret = ret + (list(i-1) + 4.*list(i) + list(i+1));
    end
    ret = iv/3 * ret;
end
%}

%1b)
clear
load tankskip
