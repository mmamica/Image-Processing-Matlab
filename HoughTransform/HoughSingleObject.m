close all;
clearvars;
clc;

kwadraty=imread('kwadraty.png');
I=kwadraty;
figure('Name','Krawêdzie kwadatów');
Id=edge(I,'Sobel');
imshow(Id);
[H,T,R]=hough(Id);
figure('Name','Hough kwadatów');
imshow(H,[]);
hold on;
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