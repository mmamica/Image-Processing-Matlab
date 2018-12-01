clear;
clc;
close all;

load('maskiPP.mat');


I = imread('kw.bmp');


% adding gradients

gradients(I, R1);

gradients(I, R2);

gradients(I, P1);

gradients(I, P2);

gradients(I, S1);

gradients(I, S2);

%% combined filter
OW = sqrt((conv2(I, S1, 'same')).^2 + (conv2(I, S2, 'same')).^2);
OW2 = abs((conv2(I, S1, 'same')).^2) + abs((conv2(I, S2, 'same')).^2);

figure('Name','OW');
imshow(OW);

figure();
imshow(OW2);

%% Jet
jet = imread('jet.bmp');

gradients(jet, R1);

gradients(jet, R2);

gradients(jet, P1);

gradients(jet, P2);

gradients(jet, S1);

gradients(jet, S2);

OW = sqrt((conv2(jet, S1, 'same')).^2 + (conv2(jet, S2, 'same')).^2);

OW2 = abs((conv2(jet, S1, 'same')).^2) + abs((conv2(jet, S2, 'same')).^2);

figure('Name','Jet Combined sqrt')
imshow(OW, []);

figure('Name','Jet Combined abs')
imshow(OW2, []);