close all;
clearvars;
clc;

knee=imread("knee.png");
I=knee;

imshow(I);

[x,y]=ginput(1);

x=floor(x);
y=floor(y);

%x=221;
%y=363;

I=double(I);
[xSize,ySize]=size(I);
visited=zeros(xSize,ySize);
segmented=zeros(xSize,ySize);
stack=zeros(10000,2);
iStack=1;

visited(x,y)=1;
segmented(x,y)=1;
eps=32
stack(iStack, 1:2) = [x, y];
ns=0;
mv=0;


while iStack>0
    rx=stack(iStack,1);
    ry=stack(iStack,2);
    ns=ns+1;
    iStack=iStack-1;
    mv=(mv*(ns-1)+I(rx,ry))/ns;

    if(rx>1 && rx<xSize && ry>1 && ry<ySize)
        for ix=rx-1:rx+1
            for iy=ry-1:ry+1
                if (visited(ix,iy)==0 &&((abs(I(ix,iy)-mv))<eps))
                    iStack=iStack+1;
                    stack(iStack,:)=[ix,iy];
                    segmented(ix,iy)=I(ix,iy);
                end
                visited(ix,iy)=1;
            end
            
        end
            
    end
end
    
figure();
imshow(segmented,[])