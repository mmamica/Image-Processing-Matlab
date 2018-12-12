function [wynik] = gameFunction(nhood)
    wynik=0;
    if(nhood(2,2))
        s = sum(nhood(:))-1;
        wynik = (s==2 || s==3);
    end
    if(~nhood(2,2))
        s = sum(nhood(:));
        wynik = (s==3);
    end
end
                                                                                                                                    
