%Binaryzacja lokalna

clc;
close all;
clearvars;

katalog=imread('katalog.bmp');
rice=imread('rice.png');
I=rice;
[x,y]=size(I)
IBW=I;
W=15;
W2 = round(W/2)
R=128;
k=0.15

for i=1:x
for j=1:y
srednia=meanLT(i,j,W2,I,x,y);
odch = stddevLT(i, j, W2, I, srednia, x, y);
T = srednia*(1-k*((odch/R)-1));
if I(i,j) > T
IBW(i,j) = 255;
else
IBW(i,j) = 0;
end
end
end



imshow(IBW);
figure('Name', 'Binaryzacji lokalna');
subplot(1,3,1); imshow(I);
title('oryginal');
subplot(1,3,2); imshow(IBW);
title('binaryzacja');
subplot(1,3,3); imhist(I);
title('histogram');