clearvars;
close all;
clc;

figure('Name', 'Oryginal');
p=imread('jet.bmp');
imshow(p);

%HE
figure('Name','HE');
histeq(p);

%BBHE
[y,x]=size(p)
len=x*y;
ar=reshape(p,len,1);
arm=round(mean(ar));
xl=ar([ar<=arm]);
xu=ar([ar>arm]);
Hl=imhist(xl);
Hl=Hl(1:177);
size(Hl)
Hl=Hl/sum(Hl);
Hu=imhist(xu);
Hu=Hu(178:256);
size(Hu)
Hu=Hu/sum(Hu);
Cl=cumsum(Hl);
Cu=cumsum(Hu);
Cln=(arm*Cl);
Cun=(arm+(255-arm+1)*Cu);

glut=[Cln;Cun];
size(glut);
p2=intlut(uint8(p),uint8(glut));
figure('Name','BBHE');
imshow(p2);

