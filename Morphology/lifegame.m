close all;
clearvars;
clc;

load('gra.mat');
I=plansza2;
lut = makelut(@gameFunction,3)

for i = 1:10
    I = applylut(I, lut);
    imshow(I,'InitialMagnification','fit'); 
    pause(0.4);
    refresh;
end