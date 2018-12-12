close all;
clearvars;
clc;

ferrari=imread('ferrari.bmp');

I=ferrari;

figure('Name','Operacje Morfologiczne');
subplot(2,2,1);
imshow(I);
title('Oryginal');

SE = strel('square',3);
Ie=imerode(I,SE);
subplot(2,2,2);
imshow(Ie);
title('Erozja');

Id=imdilate(I,SE);
subplot(2,2,3);
imshow(Id);
title('Dylatacja');

Ir=imabsdiff(Id,Ie);
subplot(2,2,4);
imshow(Ir);
title('Id-Ie');


%open, close

figure('Name','Otwarcie i zamkniêcie');
subplot(3,1,1);
imshow(I);
title('Oryginal');

SE = strel('square',3);
Io=imopen(I,SE);
subplot(3,1,2);
imshow(Io);
title('Otwarcie');

Iz=imclose(I,SE);
subplot(3,1,3);
imshow(Iz);
title('Zamkniêcia');


%top bottom hat

figure('Name','Top bottom hat');
subplot(3,1,1);
imshow(I);
title('Oryginal');

SE = strel('square',3);
Ith=imtophat(I,SE);
subplot(3,1,2);
imshow(Ith);
title('Top Hat');

Ibh=imbothat(I,SE);
subplot(3,1,3);
imshow(Ibh);
title('Bottom Hat');

%%
rice=imread('rice.png');
figure('Name','Top hat rice');
subplot(2,1,1);
imshow(rice);
title('Oryginal');

SE = strel('disk',10);
riceth=imtophat(rice,SE);
subplot(2,1,2);
imshow(riceth,[]);
title('Top Hat');