close all;
clearvars;
clc;

%edge log
I=imread('dom.png');
Il=edge(I,'log');

figure('Name', 'Dom i krawêdzie z logiem');
subplot(2,1,1);
imshow(I);
title('Oryginal');

subplot(2,1,2);
imshow(Il);
title('Log');


%%
%edge canny

Ic=edge(I,'canny');

figure('Name', 'Dom i krawêdzie z canny');
subplot(2,1,1);
imshow(I);
title('Oryginal');

subplot(2,1,2);
imshow(Ic);
title('Canny');


%%
%Porównanie metod

figure('Name', 'Dom i krawêdzie z canny');

Ila=edge(I,'log');
Ilm=edge(I,'log',0.007,2.1);

subplot(3,3,1);
imshow(I);
title('Oryginal');

subplot(3,3,2);
imshow(Ila);
title('Log automatyczny');

subplot(3,3,3);
imshow(Ilm);
title('Log manualny');




Ica=edge(I,'canny');
Icm=edge(I,'canny',[0.085,0.1],5.1);

subplot(3,3,4);
imshow(I);
title('Oryginal');

subplot(3,3,5);
imshow(Ica);
title('Canny automatyczny');

subplot(3,3,6);
imshow(Icm);
title('Canny manualny');


Isa=edge(I,'Sobel');
Ism=edge(I,'Sobel',0.15);

subplot(3,3,7);
imshow(I);
title('Oryginal');

subplot(3,3,8);
imshow(Isa);
title('Sobel automatyczny');

subplot(3,3,9);
imshow(Ism);
title('Sobel manualny');

