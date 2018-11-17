%Binaryzacja na podstawie histogramu
clearvars;
clc;
close all;

coins=imread('coins.png');
rice=imread('rice.png');
katalog=imread('katalog.bmp');
obiekty=imread('obiekty.bmp');
tekst=imread('tekst.bmp');
I=coins;
figure('Name','Oryginal i histogram');
subplot(2,1,1);
imshow(I);
title('Zdjecie');
subplot(2,1,2);
imhist(I);
title('Histogram');
p=80;
IBin=im2bw(I,p/255);
figure('Name', 'Po binaryzacji prog=80');
imshow(IBin);

figure('Name', 'Po binaryzacji prog auto');
prog=graythresh(I)
imshow(im2bw(I,prog));

ots = graythresh(I);
kittler = clusterKittler(I);
yen = entropyYen(I);


figure('Name', 'Binaryzacja 3 metody');
subplot(3,2,1);
imshow(I);
title('oryginal');
subplot(3,2,2);
imhist(I);
title('histogram');
subplot(3,2,3);
imshow(IBin);
title(['moj próg: ', num2str(p/255)]);
subplot(3,2,4);
Iots=im2bw(I,ots);
imshow(Iots);
title(['ots: ', num2str(ots*255)]);
subplot(3,2,5);
Ikittler=im2bw(I,kittler/255);
imshow(Ikittler);
title(['kittler: ', num2str(kittler)]);
subplot(3,2,6);
Iyen=im2bw(I,yen/255);
imshow(Iyen);
title(['yen: ', num2str(yen)]);

%%

I1=imread('figura.png');
figure('Name','Figura i histogram');
subplot(3,1,1);
imshow(I1);
title('Zdjecie');
subplot(3,1,2);
imhist(I1);
title('Histogram');
subplot(3,1,3);
I1Bin=im2bw(I1,80/255);
imshow(I1Bin);
title('Binaryzacja');

I2=imread('figura2.png');
figure('Name','Figura 2 i histogram');
subplot(3,1,1);
imshow(I2);
title('Zdjecie');
subplot(3,1,2);
imhist(I2);
title('Histogram');
subplot(3,1,3);
I2Bin=im2bw(I2,120/255);
imshow(I2Bin);
title('Binaryzacja');

I3=imread('figura3.png');
figure('Name','Figura 3 i histogram');
subplot(3,1,1);
imshow(I3);
title('Zdjecie');
subplot(3,1,2);
imhist(I3);
title('Histogram');
subplot(3,1,3);
I3Bin=im2bw(I3,150/255);
imshow(I3Bin);
title('Binaryzacja');


I4=imread('figura4.png');
figure('Name','Figura 4 i histogram');
subplot(3,1,1);
imshow(I4);
title('Zdjecie');
subplot(3,1,2);
imhist(I4);
title('Histogram');
subplot(3,1,3);
I4Bin=im2bw(I4,60/255);
imshow(I4Bin);
title('Binaryzacja');