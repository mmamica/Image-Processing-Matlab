close all;
clearvars;
clc;

%œcienianie

fingers=imread('fingerprint.bmp');
figure('Name', 'Scienianie');
subplot(2,2,1);
imshow(fingers);
title('Oryginal');

subplot(2,2,2);
fingers2=bwmorph(fingers,'thin',1);
imshow(fingers2);
title('x 1');

subplot(2,2,3);
fingers3=bwmorph(fingers,'thin',2);
imshow(fingers3);
title('x 2');

subplot(2,2,4);
fingers4=bwmorph(fingers,'thin',Inf);
imshow(fingers4);
title('x Inf');


%%
%szkieletyzacja


kosc=imread('kosc.bmp');
figure('Name', 'Szkieletyzacja');
subplot(2,1,1);
imshow(kosc);
title('Oryginal');

subplot(2,1,2);
kosc2=bwmorph(kosc,'skel',Inf);
imshow(kosc2);
title('x Inf');

%%
%Rekonstrukcja morfologiczna

text=imread('text.bmp');
figure('Name', 'Rekonstrukcja');
subplot(2,3,1);
imshow(text);
title('Oryginal');

subplot(2,3,2);
SE=ones(51,1);
text2=imopen(text,SE);
imshow(text2);
title('wstêpna detekcja');

subplot(2,3,3);
text3=imreconstruct(text2,text);
imshow(text3);
title('rekonstrukcja');

subplot(2,3,4);
text4=imfill(text,'holes');
imshow(text4);
title('Wypelnianie dziur');

subplot(2,3,5);
text5=imclearborder(text);
imshow(text5);
title('Czyszczenie brzegu');
