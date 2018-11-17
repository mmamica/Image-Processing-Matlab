clearvars;
close all;
clc;


lenabGray=imread('lena_gray.bmp');
[lenaInd, map]=gray2ind(lenabGray, 256);
figure(1);
imshow(lenaInd,map)

mapS=colormap(summer(256));
figure(2);
imshow(lenaInd,mapS)