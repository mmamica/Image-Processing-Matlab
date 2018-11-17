%poziomy jasnoœci

clearvars;
close all;
clc;

I=imread('lena.bmp');
If=imfinfo('lena.bmp')
I128=imresize(I,0.25,'bicubic');
[YY,XX]=size(I)
[YY,XX]=size(I128)

J128a = imadjust(I128,[0 1],[0 31/255]);
figure(1);
subplot(5,1,1)
imshow(J128a,[]);

J128b = imadjust(I128,[0 1],[0 15/255]);
subplot(5,1,2)
imshow(J128b,[]);

J128c = imadjust(I128,[0 1],[0 7/255]);
subplot(5,1,3)
imshow(J128c,[]);

J128d = imadjust(I128,[0 1],[0 3/255]);
subplot(5,1,4)
imshow(J128d,[]);


J128e = imadjust(I128,[0 1],[0 1/255]);
subplot(5,1,5)
imshow(J128e,[]);