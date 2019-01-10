close all;
clearvars;
clc;

kwadraty=imread('lab112.png');
I=kwadraty;
figure('Name','Oryginal');
imshow(I);


IBin=im2bw(I,46/255);
figure('Name','Binaryzacja');
imshow(IBin);

SE=ones(1,7);
Ie=imclose(IBin,SE);

figure('Name','Zamkniêcie');
imshow(Ie);
I=Ie;

%I=imread('dom.png');
%Il=edge(I,'log');
%I=Il;

figure('Name','Krawêdzie kwadatów');
Id=edge(I,'Sobel');
imshow(Id);
[H,T,R]=hough(Id);
figure('Name','Hough kwadatów');
imshow(H,[]);
hold on;
%dla domu 20
P=houghpeaks(H,8)
plot(P(:,2), P(:,1), 'o');
hold off;

lines=houghlines(Id,T,R,P);

figure('Name','Krawedzie');
hold on;

for k = 1:length(lines)
xy = [lines(k).point1; lines(k).point2];
plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');
end