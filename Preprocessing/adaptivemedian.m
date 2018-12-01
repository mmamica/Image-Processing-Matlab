close all;
clc;
clearvars;

I=imread('lenaSzum.bmp');
[Y,X]=size(I);
I2=uint8(zeros(Y,X));


for yy=4:(Y-3)
    for xx=4:(X-3)
        I2(yy,xx)=phaseA(I,yy,xx);
    end
end

imshow(I2)
figure()
imshow(I)
