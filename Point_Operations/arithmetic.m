%arytmetyczne
clearvars;
close all;
clc;

I1=imread('lena.bmp');
figure(1)
imshow(I1);
I2=imread('jet.bmp');
figure(2)
imshow(I2);

%dodawanie

sum=imadd(I1,I2);
figure(3);
imshow(uint16(sum),[]);

%liniowa

lin=imlincomb(1,I1,0.5,I2);
figure(4);
imshow(lin,[]);

%odejmowanie

sub=imsubtract(I1,I2);
figure(5);
imshow(sub,[]);

lena16=int16(I1);
jet16=int16(I2);
sub2=imsubtract(lena16,jet16);
figure(6);
imshow(sub2,[]);

%wartoœæ bezwglêdna z ró¿nicy
figure(7);
sub3=imabsdiff(I1,I2)
imshow(sub3,[]);

%mno¿enie dwóch obrazów

mul=immultiply(I1,I2);
figure(8);
imshow(mul,[]);

%mno¿enie przez sta³a

mul2=immultiply(I1,4);
figure(9);
imshow(mul2,[]);

%mno¿enie przez maskê binarn¹

mas=imread('kolo.bmp');
maska=boolean(mas);
mul3=immultiply(I1,maska);
figure(10)
imshow(mul3,[]);

%negatyw

neg=imcomplement(I1);
figure(11)
imshow(neg,[]);


figure(12)
subplot(4,3,1);
imshow(sum);
title('suma');
subplot(4,3,2);
imshow(lin);
title('liniowe');
subplot(4,3,3);
imshow(sub);
title('odejmowanie');
subplot(4,3,4);
imshow(sub2);
title('odejmowanie int16');
subplot(4,3,5);
imshow(sub3);
title('abs róznicy');
subplot(4,3,6);
imshow(mul);
title('m. 2 ob.');
subplot(4,3,7);
imshow(mul2);
title('m. stala');
subplot(4,3,8);
imshow(mul3);
title('m. maska');
subplot(4,3,9);
imshow(neg);
title('negacja');
subplot(4,3,10);
imshow(I1);
title('lena');
subplot(4,3,11);
imshow(I2);
title('jet');

