close all;
clc;
clearvars;

I=imread('tekstReczny.png');
figure('Name', 'Org');
subplot(2,1,1);
imshow(I);
title('orygina³')
subplot(2,1,2);
imhist(I);
title('histogram')


p=80;
IBin=im2bw(I,p/255);
ots = graythresh(I)
IOts=im2bw(I,ots);
figure('Name', 'Hist i Ots');
subplot(2,1,1);
imshow(IBin);
title(['Histogram based: ', num2str(p)]);
subplot(2,1,2);
imshow(IOts);
title(['ots: ', num2str(ots*255)]);

[y,x]=size(I);
%moving average
a=0.5;
n=20;
imageBin=I;
queue = zeros(1, n);
i = 1;
srednia = 0;

for iy = 1:y
    for ix = 1:x
        i_last = mod(i, 20) + 1;
        srednia = srednia + (queue(n) - queue(1)) / n;
        i = mod(i, 20) + 1;
        
        T = a * srednia;
        if I(iy,ix) > T
            imageBin(iy,ix) = 255;
        else
            imageBin(iy,ix) = 0;
        end
        queue(1:n-1) = queue(2:n);
        queue(n) = I(iy,ix);

    end
end

figure()
imshow(imageBin)

