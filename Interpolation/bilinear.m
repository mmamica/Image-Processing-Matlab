%bilinear interpolation

clearvars;
close all;
clc;

p=imread('parrot.bmp');
ch=imread('chessboard.bmp');
c=imread('clock.bmp');
I=p;
figure(1);
imshow(I);
xReScale=1.5;
yReScale=1.5;
[YY,XX]=size(I);
nYY=round(YY*yReScale);
nXX=round(XX*xReScale);

nI=im2double(uint8(zeros(nYY,nXX))); 

xStep=XX/nXX;
yStep=YY/nYY;

for j = 0:nYY-1
for i = 0:nXX-1
i1=floor(i*xStep);
i2=i1+1;
j1=floor(j*yStep);
j2=j1+1;

if i1 > XX-1
i1=XX-1;
end

if i2 > XX-1
i2=XX-1;
end

if j1 > YY-1
j1=YY-1;
end

if j2 > YY-1
j2=YY-1;
end

A = double(I(j1+1,i1+1));
B = double(I(j1+1,i2+1));
C = double(I(j2+1,i2+1));
D = double(I(j2+1,i1+1));
x=i*xStep-i1;
y=j*yStep-j1;
nI(j+1,i+1) = [1-x x] * [A D; B C] * [1-y; y];
end
end

figure(2)
imshow(uint8(nI));

