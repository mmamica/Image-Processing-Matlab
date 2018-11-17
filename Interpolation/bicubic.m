%bicubical interpolation

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

nI=im2double(uint8(zeros(nYY,nXX))); %tworzenie nowego obrazu

xStep=XX/nXX;
yStep=YY/nYY;
load('a1.mat', 'A1');

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

j0=j1-1;
if j0<0
    j0=0;
end
i0=i1-1;
if i0<0
    i0=0;
end

j3=j2+1;
if j3>YY-1
    j3=YY-1;
end
i3=i2+1;
if i3>XX-1
    i3=XX-1;
end


Ax = double((I(j1+1,i2+1)-I(j1+1,i0+1))/2);
Ay = double((I(j2+1,i1+1)-I(j0+1,i1+1))/2);
Axy = double((I(j2+1,i2+1)-I(j0+1,i1+1)-I(j1+1,i0+1)+I(j1+1,i1+1))/4);

Bx = double((I(j1+1,i3+1)-I(j1+1,i1+1))/2);
By = double((I(j2+1,i2+1)-I(j0+1,i2+1))/2);
Bxy = double((I(j2+1,i3+1)-I(j0+1,i2+1)-I(j1+1,i1+1)+I(j1+1,i2+1))/4);

Cx = double((I(j2+1,i3+1)-I(j2+1,i1+1))/2);
Cy = double((I(j3+1,i2+1)-I(j1+1,i2+1))/2);
Cxy = double((I(j3+1,i3+1)-I(j1+1,i2+1)-I(j2+1,i1+1)+I(j2+1,i2+1))/4);

Dx = double((I(j2+1,i2+1)-I(j2+1,i0+1))/2);
Dy = double((I(j3+1,i1+1)-I(j1+1,i1+1))/2);
Dxy = double((I(j3+1,i2+1)-I(j1+1,i1+1)-I(j2+1,i0+1)+I(j2+1,i1+1))/4);

X=[A;B;D;C;Ax;Bx;Dx;Cx;Ay;By;Dy;Cy;Axy;Bxy;Dxy;Cxy];
alfa=A1*X;
alfa2=[alfa(1:4), alfa(5:8),alfa(9:12),alfa(13:16)];

x=i*xStep-i1;
y=j*yStep-j1;
nI(j+1,i+1) = [1 x x^2 x^3] * alfa2 * [1; y; y^2; y^3];
end
end

figure(2)
imshow(uint8(nI));

%ta sama iloœæ pêtli, co w interpolacji dwuliniowej, lecz w ka¿dej z nich
%jest wiêcej operacji arytemtycznych. Dok³adamy obliczanie pochodnych w
%punktach (+12 operacji) oraz wykonujemy 3 mno¿enia na macierzach, gdzie
%jedno z nich sprowadza siê do wykonania 16 równañ

