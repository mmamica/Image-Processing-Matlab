function LUT( img, code )
    LUTimg = intlut(img, code);
    subplot(1,3,1); 
    plot(code);
    subplot(1,3,2); 
    imshow(img); 
    title('Before');
    subplot(1,3,3);
    imshow(LUTimg);
    title('After');
end

