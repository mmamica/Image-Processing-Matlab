%comparison of different methods

clearvars;
close all;
clc;

p=imread('parrot.bmp');
ch=imread('chessboard.bmp');
c=imread('clock.bmp');
I=ch;

figure('Name', 'Neighbour');
INearest=imresize(I,30,'nearest');
imshow(INearest);

figure('Name', 'Bilinear');
IBilinear=imresize(I,30,'bilinear');
imshow(IBilinear);

figure('Name', 'Bicubic');
IBicubic=imresize(I,30,'bicubic');
imshow(IBicubic);