% =================================================
%       Foad Moslem (foad.moslem@gmail.com) - Researcher | Aerodynamics
%       Using MATLAB R2022a
% =================================================
clc
clear
close all

% =================================================
tic
global numFunc
numFunc = 0;

% Curve Ploting ======================================
a = 0;
b = 4;
NumOfNodes = 200;
x = linspace(a,b,NumOfNodes);
y = ObjFun(x);
plot(x,y)
hold on

% Main Code - QuasiNewton============================
delta = 0.0001;
epsilon = 1e-6;
x0 = b;                                       % Intial Approximation
syms x;
fplus = ObjFun (x0+delta);
fminus = ObjFun (x0-delta);
fx0 = ObjFun (x0);
gx0 = (fplus - fminus)/(2*delta);
%hx0 = (fp - 2*fx0 + fm)/(delta^2);

while abs(gx0) > epsilon
    fplus = ObjFun (x0+delta);
    fminus = ObjFun (x0-delta);
    fx0 = ObjFun (x0);
    %plot(x0,fx0,'ro');
    gx0 = (fplus - fminus)/(2*delta);
    hx0 = (fplus - 2*fx0 + fminus)/(delta^2);
    x1 = x0 - ((delta*(fplus-fminus)/(2*(fplus - 2*fx0 + fminus))));
    x0 = x1;
        if gx0 == 0
            disp('Division by zero.');
            break;
        end
end

% =================================================
fprintf('Number of CallFunction: %6.f\n',numFunc)
fprintf('CPU time: %6.4f\n',toc)
fprintf('X Value of Optimum Point: %6.4f\n',x0)
fprintf('Y Value of Optimum Point: %6.4f\n',fx0)
plot(x0,fx0,'kx')