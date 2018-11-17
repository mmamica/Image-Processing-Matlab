clearvars;
close all;
clc;

figure('Name', 'Oryginal');
p=imread('phobos.bmp');
imshow(p);
figure('Name','HE zwyk³e');
histeq(p,256);
load('histogramZadany')
figure('Name','HE z histogramem zadanym');
histeq(p,histogramZadany);
figure('Name', 'Histogram Zadany');
subplot(2,2,1);
plot(histogramZadany);
title('histogram');
subplot(2,2,2);
histeq(p,histogramZadany);
title('Ksiezyc wedlug histogramu');
subplot(2,2,3);
proz=imadjust(p);
imshow(proz);
title('Ksiezyc po rozci¹gniecu');
subplot(2,2,4);
pCl=adapthisteq(p);
imshow(pCl);
title('CLAHE');