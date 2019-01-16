function split(image, xs, ys, xe, ye)

global eps pieces index segRes mRes;

I=image(ys:ye,xs:xe);
av=mean(I(:));
st=std(I(:));

if(st<eps || (xe-xs)<pieces)
    index=index+1;
    segRes(ys:ye,xs:xe)=index;
    mRes(ys:ye,xs:xe)=av;
else
    splitX=floor((xs+xe)/2);
    splitY=floor((ys+ye)/2);
    
    split(image, xs, ys, splitX,splitY);
    split(image,splitX+1,ys,xe,splitY);
    split(image, xs,splitY+1, splitX, ye);
    split(image, splitX+1, splitY+1, xe, ye);
end
end
