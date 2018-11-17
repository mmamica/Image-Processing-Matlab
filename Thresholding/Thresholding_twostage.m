%Binaryzacja dwuprogowa

clc;
clearvars;
close all;

I=imread('bart.bmp');


lower=190;
upper=210;

IBW = I > lower & I < upper;
IBW = uint8(IBW);
IBW = IBW * 255;

figure('Name', 'Obraz i hist');
subplot(1,3,1); 
imshow(I);
title('obraz');
subplot(1,3,2);
imhist(I);
title('histogram');
subplot(1,3,3);
imshow(IBW,[]);
title('po binaryzacji');