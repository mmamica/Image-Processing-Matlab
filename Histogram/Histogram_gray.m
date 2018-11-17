clearvars;
close all;
clc;

%wczytanie obrazów

l1=imread('lena1.bmp');
l2=imread('lena2.bmp');
l3=imread('lena3.bmp');
l4=imread('lena4.bmp');


figure('Name', 'Lena i histogramy');
subplot(4,2,1);
imshow(l1);
title('Lena 1');
subplot(4,2,2);
imhist(l1,256);
title('Histogram do Lena 1');

subplot(4,2,3);
imshow(l2);
title('Lena 2');
subplot(4,2,4);
imhist(l2,256);
title('Histogram do Lena 2');

subplot(4,2,5);
imshow(l3);
title('Lena 3');
subplot(4,2,6);
imhist(l3,256);
title('Histogram do Lena 3');

subplot(4,2,7);
imshow(l4);
title('Lena 4');
subplot(4,2,8);
imhist(l4,256);
title('Histogram do Lena 4');


%%
h1=imread('hist1.bmp');
figure('Name','Obraz pierwotny i jego histogram');
subplot(2,1,1);
imshow(h1);
title('Hist 1');
subplot(2,1,2);
imhist(h1,256);
title('Histogram do Hist 1');

%poprawiam obraz przez rozci¹gniêcie histogramu (imadjust)
h2=imadjust(h1);
figure('Name','Obraz i histogram po rozci¹gniêciu histogramu - imadjust');
subplot(2,1,1);
imshow(h2);
title('Hist 1 po imadjust');
subplot(2,1,2);
imhist(h2,256);
title('Histogram do Hist 1 po imadjust');

%tworzê histogra skumulowany
[H,x]=imhist(h1);
C=cumsum(H);
figure('Name','Histogram pierwotny oraz skumulowany');
subplot(2,1,1);
bar(x,H);
title('Histogram pierwotny');
subplot(2,1,2);
bar(x,C);
title('Histogram skumulowany');

figure('Name','Histogram pierwotny oraz przeskalowany skumulowany jako wykres');
plot(x,H);
hold on;
k=max(C)/max(H)
C2=C/k;
plot(x,C2);
legend('zwykly','skumulowany')

figure('Name','Histogram pierwotny oraz przeskalowany skumulowany jako wykres dla rozci¹gniêtego obrazu');
[H2,x2]=imhist(h2);
CR=cumsum(H2);
plot(x2,H2);
hold on;
k2=max(CR)/max(H2)
CR2=CR/k2;
plot(x2,CR2);
legend('zwykly','skumulowany')

%%
h1=imread('hist1.bmp');
[H,x]=imhist(h1);
C=cumsum(H);
C3=C./sum(H); %normalizacja
C4=double(C3*255);
LUT=uint8(C4);
h3=intlut(h1,LUT);
[H3,x3]=imhist(h3);
figure('Name', 'Zaimplementowany algorytm');
subplot(3,1,1);
imshow(h3);
title('Obraz');
subplot(3,1,2);
bar(x3,H3);
title('Histogram po algorytmie');
subplot(3,1,3);
bar(x3,C3);
title('Histogram skumulowany');


figure('Name', 'Obrazy z Histogramami');
subplot(4,2,1);
imshow(h1);
title('Hist 1');
subplot(4,2,2);
imhist(h1,256);
title('Histogram do Hist 1');
subplot(4,2,3);
histeq(h1,256);
title('Hist 1 po równowa¿eniu');
subplot(4,2,4);
imhist(histeq(h1,256));
title('Histogram do Hist 1 po równowa¿eniu');
subplot(4,2,5);
histeq(imadjust(h1));
title('Hist 1 po rozci¹gniêciu');
subplot(4,2,6);
imhist(imadjust(h1));
title('Histogram do Hist 1 po rozci¹gniêciu');
subplot(4,2,7);
histeq(adapthisteq(h1));
title('Hist 1 po CLAHE');
subplot(4,2,8);
imhist(adapthisteq(h1));
title('Histogram do Hist 1 po CLAHE');

%% prawdziwe obrazy
h2=imread('hist2.bmp');
h3=imread('hist3.bmp');
h4=imread('hist4.bmp');

figure('Name', 'hist2');
subplot(2,2,1);
imshow(h2);
title('orygina³');
subplot(2,2,2);
h2roz=imadjust(h2);
imshow(h2roz);
title('rozciaganie');
subplot(2,2,3);
histeq(h2,256);
title('HE');
subplot(2,2,4);
h2cl=adapthisteq(h2);
imshow(h2cl);
title('CLAHE');

h2=h3;

figure('Name', 'hist3');
subplot(2,2,1);
imshow(h2);
title('orygina³');
subplot(2,2,2);
h2roz=imadjust(h2);
imshow(h2roz);
title('rozciaganie');
subplot(2,2,3);
histeq(h2,256);
title('HE');
subplot(2,2,4);
h2cl=adapthisteq(h2);
imshow(h2cl);
title('CLAHE');

h2=h4;

figure('Name', 'hist4');
subplot(2,2,1);
imshow(h2);
title('orygina³');
subplot(2,2,2);
h2roz=imadjust(h2);
imshow(h2roz);
title('rozciaganie');
subplot(2,2,3);
histeq(h2,256);
title('HE');
subplot(2,2,4);
h2cl=adapthisteq(h2);
imshow(h2cl);
title('CLAHE');