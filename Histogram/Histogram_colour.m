clearvars;
close all;
clc;

%wczytanie i wyœwietlenie Leny
lena=imread('lenaRGB.bmp');
jezioro=imread('jezioro.jpg');
lenaColour=lena;
figure('Name','Lena in Colour');
imshow(lenaColour);

%roz³o¿enie na sk³adowe RGB
lenaR=lenaColour(:,:,1);
lenaG=lenaColour(:,:,2);
lenaB=lenaColour(:,:,3);

%wykres histogramów
figure('Name','Histogramy');
subplot(2,2,1);
imhist(lenaColour);
title('Lena w kolorze');
subplot(2,2,2);
imhist(lenaR);
title('Lena R');
subplot(2,2,3);
imhist(lenaG);
title('Lena G');
subplot(2,2,4);
imhist(lenaB);
title('Lena B');

%wyrównywanie histogramów
lenaRQ=histeq(lenaR,256);
lenaGQ=histeq(lenaG,256);
lenaBQ=histeq(lenaB,256);

%z³o¿enie Leny
obrazEQ=lenaColour;
obrazEQ(:,:,1)= lenaRQ;
obrazEQ(:,:,2)= lenaGQ;
obrazEQ(:,:,3)= lenaBQ;

figure('Name','Lena po z³o¿eniu wyrównanych histogramów');
imshow(obrazEQ);

%HSV
lenaHSV=rgb2hsv(lenaColour);
lenaV = lenaHSV(:,:,3);
lenaVQ = histeq(lenaV,256);

obrazEQ2 = lenaHSV;
obrazEQ2(:,:,3) = lenaVQ;

figure('Name', 'Lena po wyrównaniu histogramu jasnoœci HSV');
subplot(1,2,1);
imshow(lenaColour);
title('Lena pierwotna');
subplot(1,2,2); 
imshow(hsv2rgb(obrazEQ2));
title('Lena po wyrównaniu');