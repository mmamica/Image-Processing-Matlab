close all;
clearvars;
clc;


I=zeros(11,11);
I(3,4)=1;
I(10,10)=1;
I(10,1)=1;
I(5,5)=1;
[H,theta,rho]=hough(I,'RhoResolution',0.1,'ThetaResolution',0.5);
figure('Name','Transformata Hough dla ma³ej liczby punktów');
imshow(H,[]);
hold on;

r=rho(160);
t=theta(126);
x=0:0.1:10;
y=((r-x*cosd(t))/sind(t))

figure('Name','Prosta Hough');
imshow(I,[]);
hold on;
plot(x+1,y+1);