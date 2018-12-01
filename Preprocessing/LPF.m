close all;
clc;
clearvars;

plansza=imread('plansza.bmp');
lena=imread('lena.bmp');
I=lena;

mask3 = fspecial('average', [3 3]);
mask5 = fspecial('average', [5 5]);
mask9 = fspecial('average', [9 9]);
mask15 = fspecial('average', [15 15]);
mask35 = fspecial('average', [35 35]);

figure('Name', 'Oryginal, po filtracji i modul roznicy');
subplot(3,1,1);
imshow(I);
title('Oryginal');
subplot(3,1,2);
I2=uint8(conv2(double(I), double(mask3),'same'));
imshow(I2);
title('Z filtrem');
subplot(3,1,3);
imshow(imabsdiff(I, I2),[]);
title('Modul z roznicy');


figure('Name', 'different sizes of masks');
subplot(2, 3, 1);
imshow(I);
title('Bez Maski');
subplot(2, 3, 2);
imshow(uint8(conv2(double(I), double(mask3), 'same')));
title('Maska 3x3');
subplot(2, 3, 3);
imshow(uint8(conv2(double(I), double(mask5), 'same')));
title('Maska 5x5');
subplot(2, 3, 4);
imshow(uint8(conv2(double(I), double(mask9), 'same')));
title('Maska 9x9');
subplot(2, 3, 5);
imshow(uint8(conv2(double(I), double(mask15), 'same')));
title('Maska 15x15');
subplot(2, 3, 6);
imshow(uint8(conv2(double(I), double(mask35), 'same')));
title('Maska 35x35');

M=[1 2 1; 2 4 2; 1 2 1];
M=M/sum(M);
figure('Name', 'Oryginal, po filtracji i modul roznicy z ustalon¹ maska');
subplot(3,1,1);
imshow(I);
title('Oryginal');
subplot(3,1,2);
IM=uint8(conv2(double(I), double(M),'same'));
imshow(IM);
title('Z filtrem');
subplot(3,1,3);
imshow(imabsdiff(I, IM),[]);
title('Modul z roznicy');



%Gauss
figure('Name', 'Gauss')
G=fspecial('gaussian', [5, 5], 0.5);
G2=fspecial('gaussian', [5, 5], 0.8);
G3=fspecial('gaussian', [5, 5], 0.1);
mesh(G3);

figure('Name', 'Gauss');
subplot(2,2,1);
imshow(I);
title('Oryginal');
subplot(2,2,2);
IG3=uint8(conv2(double(I), double(G3),'same'));
imshow(IG3);
title(['Gauss odchylenie: ', num2str(0.1)]);
subplot(2,2,3);
IG=uint8(conv2(double(I), double(G),'same'));
imshow(IG);
title(['Gauss odchylenie: ', num2str(0.5)]);
subplot(2,2,4);
IG2=uint8(conv2(double(I), double(G2),'same'));
imshow(IG2);
title(['Gauss odchylenie: ', num2str(0.8)]);