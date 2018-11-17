%zmiana rozdzielczoœci
clearvars;
close all;
clc;

I=imread('lena.bmp');
If=imfinfo('lena.bmp')
I256=imresize(I,0.5,'bicubic');
I128=imresize(I,0.25,'bicubic');
I64=imresize(I,0.125,'bicubic');

figure(1)
imshow(I);

figure(2)
imshow(I256,'InitialMagnification',200);

figure(3)
imshow(I128,'InitialMagnification',400);


figure(4)
imshow(I64,'InitialMagnification',800);


[YY,XX]=size(I)
[YY,XX]=size(I128)