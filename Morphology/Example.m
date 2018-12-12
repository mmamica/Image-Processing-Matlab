close all;
clearvars;
clc;

I=imread('calculator.bmp');

figure('Name','Izolowanie tekstu');

subplot(3,1,1);
imshow(I);
title('Oryginal');

SE=ones(1,71);
Ie=imerode(I,SE);
Ir=imreconstruct(Ie,I);
subplot(3,1,2);
imshow(Ir);
title('Po erozji i rekonstrukcji');

Io=imopen(I,SE);
subplot(3,1,3);
imshow(Io);
title('Po otwarciu');


figure('Name', 'tophat');
Itr=imabsdiff(Ir,I);
subplot(2,1,1);
imshow(Itr);
title('Tophat przez rekonstrukcjê');

Itk=imtophat(I,SE);
subplot(2,1,2);
imshow(Itk);
title('Tophat klasyczny');


figure('Name', 'Likwidacja odblasków pionowych');
subplot(3,1,1);
imshow(I);
title('Oryginal');

SE2=ones(1,11);
Ie=imerode(I,SE2);
Ier=imreconstruct(Ie,I);
subplot(3,1,2);
imshow(Ier);
title('Erozja + rekonstrukacja');

SE3=ones(1,21);
Id=imdilate(Ier,SE3);
Idr=imreconstruct(Id,I);
subplot(3,1,3);
imshow(Idr);
title('+ dylatacja + rekonstrukcja');