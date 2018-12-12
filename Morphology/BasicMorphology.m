close all;
clearvars;
clc;

ertka=imread('ertka.bmp');
wyspa=imread('wyspa.bmp');
kolka=imread('kolka.bmp');
I=ertka;

%erozja
figure('Name','Erozja');
subplot(2,2,1);
imshow(I);
title('Oryginal');

SE = strel('square',3);
I2=imerode(I,SE);
subplot(2,2,2);
imshow(I2);
title('Erozja x 1');

I3=imerode(I2,SE);
subplot(2,2,3);
imshow(I3);
title('Erozja x2');

I4=imerode(I3,SE);
subplot(2,2,4);
imshow(I4);
title('Erozja x3');


buzka=imread('buzka.bmp');
figure('Name', 'Buzka');
subplot(3,1,1);
imshow(buzka);
title('Oryginal')

subplot(3,1,2);
SE1=[1,0;0,1];
buzka2=imerode(buzka,SE1);
imshow(buzka2);
title('Przechylone w prawo znikaj¹');

subplot(3,1,3);
SE2=[0,1;1,0];
buzka3=imerode(buzka,SE2);
imshow(buzka3);
title('Przechylone w lewo znikaj¹');

%%
%dylatacja

figure('Name','Dylatacja');
subplot(2,2,1);
imshow(I);
title('Oryginal');

SE = strel('square',3);
I2=imdilate(I,SE);
subplot(2,2,2);
imshow(I2);
title('Dylatacja x 1');

I3=imdilate(I2,SE);
subplot(2,2,3);
imshow(I3);
title('Dylatacja x2');

I4=imdilate(I3,SE);
subplot(2,2,4);
imshow(I4);
title('Dylatacja x3');

%%
%wszystko

figure('Name','Wszystko');
subplot(2,3,1);
imshow(I);
title('Oryginal');

SE = strel('square',3);
I2=imerode(I,SE);
subplot(2,3,2);
imshow(I2);
title('Erozja');

I3=imdilate(I,SE);
subplot(2,3,3);
imshow(I3);
title('Dylatacja');

I4=imopen(I,SE);
subplot(2,3,4);
imshow(I4);
title('Otwarcie');

I5=imclose(I,SE);
subplot(2,3,5);
imshow(I5);
title('Zamkniêcie');


I6=imopen(I,SE);
I7=imdilate(I6,SE);
subplot(2,3,6);
imshow(I7);
title('Mini Zadanko');

%%
%trafi, nie trafi

figure('Name','Krzy¿yki');
hom=imread('hom.bmp');
S1=[0,1,0;1,1,1;0,1,0];
S2=[1,0,1;0,0,0;1,0,1];
hom2=bwhitmiss(hom,S1,S2);

subplot(2,1,1);
imshow(hom);
title('Oryginal');

subplot(2,1,2);
imshow(hom2);
title('krzy¿yki');