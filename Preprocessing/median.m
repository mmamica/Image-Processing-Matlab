close all;
clc;
clearvars;

I=imread('lenaSzum.bmp');
Imed = medfilt2(I, [3, 3]);
mask=fspecial('average',[3,3]);
Iav=uint8(conv2(double(I),double(mask),'same'));


figure('Name', 'Oryginal, po filtracji i modul roznicy Mediana');
subplot(3,1,1);
imshow(I);
title('Oryginal');
subplot(3,1,2);
imshow(Imed);
title('Z filtrem');
subplot(3,1,3);
imshow(imabsdiff(I, Imed),[]);
title('Modul z roznicy');



figure('Name', 'Oryginal, po filtracji i modul roznicy Œrednia');
subplot(3,1,1);
imshow(I);
title('Oryginal');
subplot(3,1,2);
imshow(Iav);
title('Z filtrem');
subplot(3,1,3);
imshow(imabsdiff(I, Iav),[]);
title('Modul z roznicy');



%comparison of average and mediana

figure('Name', 'Comparison');
subplot(3,1,1);
imshow(I);
title('Oryginal');
subplot(3,1,2);
imshow(Imed);
title('Mediana');
subplot(3,1,3);
imshow(Iav);
title('Œrendia');


%10 operations with mediana

I10 = medfilt2(I, [5, 5]);
for i=1:9
I10 = medfilt2(I10, [5, 5]);
end
figure('Name','10 razy mediana');
imshow(I10);