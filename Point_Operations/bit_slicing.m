%bit plane slicing
clearvars;
close all;
clc;
orc=imread('100zloty.jpg');
or=rgb2gray(orc);
[Y,X]=size(or);
bit=zeros(Y,X,8);

for k=1:8
    bit(:,:,k)=bitget(or,k);
end

%bity osobno
figure;
subplot(5,2,1);
imshow(bit(:,:,1));
title('bit 1');
subplot(5,2,2);
imshow(bit(:,:,2));
title('bit 2');
subplot(5,2,3);
imshow(bit(:,:,3));
title('bit 3');
subplot(5,2,4);
imshow(bit(:,:,4));
title('bit 4');
subplot(5,2,5);
imshow(bit(:,:,5));
title('bit 5');
subplot(5,2,6);
imshow(bit(:,:,6));
title('bit 6');
subplot(5,2,7);
imshow(bit(:,:,7));
title('bit 7');
subplot(5,2,8);
imshow(bit(:,:,8));
title('bit 8');
subplot(5,2,9);
imshow(or);
title('oryginal');

%rekonstrukcja obrazu
r1=zeros(Y,X);
for k=7:8
    r1=r1+(bit(:,:,k)*2^(k-1));
end

r2=zeros(Y,X);
for k=5:8
    r2=r2+(bit(:,:,k)*2^(k-1));
end

r3=zeros(Y,X);
for k=1:8
    r3=r3+(bit(:,:,k)*2^(k-1));
end

figure();
subplot(1,3,1);
imshow(r1,[]);
title('Bity 7 i 8');
subplot(1,3,2);
imshow(r2,[]);
title('Bity od 8 do 5');
subplot(1,3,3);
imshow(r3,[]);
title('Bit od 8 do 1');



