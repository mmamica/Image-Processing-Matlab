function [ret]=phaseA(I,y,x)
    fazaA=1;
    M=1;
    while(fazaA==1)
    S=double(I(y-M:y+M,x-M:x+M));
    zmin=min(S(:));
    zmax=max(S(:));
    zmed=median(S(:));
    A1=zmed-zmin;
    A2=zmed-zmax;
    if ((A1>0) & (A2<0))
        fazaA=0
    else
        M=M+1;
        if(M<=3)
            %powtórz fazê A
        else
            ret = zmed;
            return;    
        end
    end
    end
        B1=I(y,x)-zmin;
        B2=I(y,x)-zmax;
        if ((B1>0) & (B2<0))
            ret=I(y,x);
            return;
        else
            ret=zmed;
            return;
        end
end