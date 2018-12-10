close all;
clc;
clearvars;

load('MR_data.mat');

window = 9;

n1Convolution = convolution(I_noisy1, [window window]);
n2Convolution = convolution(I_noisy2, [window window]);
n3Convolution = convolution(I_noisy3, [window window]);
n4Convolution = convolution(I_noisy4, [window window]);


sigma=30;
n1Bilateral = bilateral(I_noisy1, [window window]);
n2Bilateral = bilateral(I_noisy2, [window window]);
n3Bilateral = bilateral(I_noisy3, [window window]);
n4Bilateral = bilateral(I_noisy4, [window window]);


figure('Name', 'I_noisy1');
subplot(3,1,1);
imshow(I_noisy1,[]);
title('zaszumiony');
subplot(3,1,2);
imshow(n1Convolution,[]);
title('splot');
subplot(3,1,3);
imshow(n1Bilateral,[]);
title('bilateralna');

figure('Name', 'I_noisy2');
subplot(3,1,1);
imshow(I_noisy2,[]);
title('zaszumiony');
subplot(3,1,2);
imshow(n2Convolution,[]);
title('splot');
subplot(3,1,3);
imshow(n2Bilateral,[]);
title('bilateralna');

figure('Name', 'I_noisy3');
subplot(3,1,1);
imshow(I_noisy3,[]);
title('zaszumiony');
subplot(3,1,2);
imshow(n3Convolution,[]);
title('splot');
subplot(3,1,3);
imshow(n3Bilateral,[]);
title('bilateralna');

figure('Name', 'I_noisy4');
subplot(3,1,1);
imshow(I_noisy4,[]);
title('zaszumiony');
subplot(3,1,2);
imshow(n4Convolution,[]);
title('splot');
subplot(3,1,3);
imshow(n4Bilateral,[]);
title('bilateralna');