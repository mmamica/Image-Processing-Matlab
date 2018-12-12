close all;
clearvars;
clc;

load('gra.mat');
I=obraz;

lut = makelut(@conwayFunction,3)
imshow(I);
figure();
imshow(applylut(I,lut));