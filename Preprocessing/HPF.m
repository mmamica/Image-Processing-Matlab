close all;
clearvars;
clc;

moon=imread('moon.bmp');
I=moon;
M=[0 1 0; 1 -4 1; 0 1 0];
M=M/9;
I2=uint8(conv2(double(I),double(M),'same'));

figure('Name', 'Laplasjan')
subplot(2,2,1);
imshow(I);
title('Oryginal');

subplot(2,2,2);
imshow(I2+128,[]);
title('+128');

subplot(2,2,3);
imshow(abs(I2),[]);
title('Bezwzgledna');

subplot(2,2,4);
imshow(I+I2);
title('ró¿nica/suma');



M2=fspecial('laplacian');
I3=uint8(conv2(double(I),double(M2),'same'));

figure('Name', 'Laplasjan z fspecial');
subplot(2,2,1);
imshow(I);
title('Oryginal');

subplot(2,2,2);
imshow(I3+128,[]);
title('+128');

subplot(2,2,3);
imshow(abs(I3),[]);
title('Bezwzgledna');

subplot(2,2,4);
imshow(I+I3);
title('ró¿nica/suma');