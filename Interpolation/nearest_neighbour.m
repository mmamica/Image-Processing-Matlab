%nearest neighbour algorithm
clearvars;
close all;
clc;

IInfo=imfinfo('parrot.bmp')
I=imread('parrot.bmp')
figure(1);
imshow('parrot.bmp');

xReScale = 1.5;
yReScale = 1.5;
[YY,XX]=size(I);

nYY=round(YY*yReScale);
nXX=round(XX*xReScale);

nI=uint8(zeros(nYY,nXX)); %making a new image

xStep=XX/nXX;
yStep=YY/nYY;

for yy = 0:nYY-1
    for xx = 0:nXX-1
        y=round(yy*yStep);
        if y > YY-1
            y = YY-1;
        end
        x=round(xx*xStep);
        if x > XX-1
            x = XX-1;
        end
        nI(yy+1,xx+1) = I(y+1,x+1);
    end
end
figure(2);
imshow(nI);

