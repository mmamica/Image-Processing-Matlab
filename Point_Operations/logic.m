clearvars;
close all;
clc;

I1=imread('kolo.bmp');
I2=imread('kwadrat.bmp');

kolo=boolean(I1);
kwadrat=boolean(I2);

not1=~kolo;
not2=~kwadrat;
and=kolo & kwadrat;
or=kolo | kwadrat;
xor=xor(kwadrat,kolo);

subplot(2,3,1);
imshow(not1);
title('not kolo');
subplot(2,3,2);
imshow(not2);
title('not kwadrat');
subplot(2,3,3);
imshow(and);
title('and');
subplot(2,3,4);
imshow(or);
title('or');
subplot(2,3,5);
imshow(xor);
title('xor');

