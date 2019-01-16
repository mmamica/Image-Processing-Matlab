close all;
clear vars;
clc;

global eps pieces index segRes mRes;
eps=0.05;
pieces=8;
index=1;

umrella=imread('umbrealla.png');
I=umrella;
imshow(I);

IHSV=rgb2hsv(I);
IHSV=double(IHSV);
IH=IHSV(:,:,1);

[x,y]=size(IH);
mRes=zeros(size(IH));
segRes=zeros(size(IH));
boarder=5/255;
min=25;
figure('Name', 'Image H')
imshow(IH);
split(IH, 1,1,x,y);

i=0;
while i<=index
    IB=segRes==i;
    if(any(IB(:)))
        [yf,xf]=find(IB,1,'first');
        neighbours=imdilate(IB, strel('square',3));
        difference=imabsdiff(neighbours, IB);
        result=difference .* segRes;
        result=unique(nonzeros(result));
        join=0;
        for n=1:length(result)
            IBS=segRes == result(n);
            [yn,xn]=find(IBS,1,'first');
            if abs(mRes(yf,xf)-mRes(yn,xn))<boarder
                segRes(IBS)=i;
                join=1;
            end
        end
        if (join==0)
            i=i+1;
        end
    else
        i=i+1;
    end
end
figure('Name', 'AfterSegmentation');
imshow(segRes,[]);

U=unique(segRes);
for u=1:length(U)
    M=segRes==U(u);
    if sum(M)<min
        segRes(M)=0;
    end
end

U=unique(segRes);
for ii=1:length(U)
    C=segRes==U(ii);
    segRes(C)=ii;
end

Icolour=label2rgb(segRes);
figure('Name', 'Colour');
imshow(Icolour,[]);