clearvars;
close all;
clc;

jet = imread('jet.bmp');

H1 = imhist(jet,256);
[H,x] = imhist(jet,256);
C = cumsum(H1);

[X Y] = size(jet);
[value lm] = min(abs(C-(X*Y/2)));
Hl = H1(1:lm);
Hu = H1(lm+1:256);
Hl = Hl/sum(Hl);
Hu = Hu/sum(Hu);

Cl = cumsum(Hl);
Cu = cumsum(Hu);

%LUT
Cln = (lm)*Cl;
Cun = lm+1 + (255-lm+1)*Cu;
lut = [Cln; Cun];

p2 = intlut(jet,uint8(lut));
jetHE = histeq(jet,256);

size(lut);
figure('Name','DSIHE');
imshow(p2);
