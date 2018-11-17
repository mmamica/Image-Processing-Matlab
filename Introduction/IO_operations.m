clearvars;
close all;
clc;

lenab=imfinfo('lena.bmp')
lenaj=imfinfo('lena.jpg')

lenabRead = imread('lena.bmp');
lenajRead = imread('lena.jpg');

figure(1);
imshow('lena.bmp')
figure(2);
imshow('lena.jpg')

lena_gray=rgb2gray(lenabRead);
figure(3);
imshow(lena_gray)
imwrite(lena_gray, 'lena_gray.bmp');


figure(4);
colormap gray;
mesh(lena_gray);

figure(5);
plot(lenabRead(10,:));
figure(6);
plot(lenabRead(:,10));