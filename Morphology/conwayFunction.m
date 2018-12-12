function [ wynik ] = conwayFunction( nhood )
        wynik = nhood(2,2) & (sum(nhood(:)) == 2);
end
                                                                                                                                    
