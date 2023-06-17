clear, clc, close all;

cat = imread('cat.jpg');
catGray = rgb2gray(cat);

owls = imread('owls.jpg');
owlsGray = rgb2gray(owls);

montage({owls,cat})

figure
imshow(owls), hold on;

rCat = normxcorr2(catGray,owlsGray);
[maxVal,maxIndex] = max(abs(rCat(:)));
[max_Y,max_X] = ind2sub(size(rCat),maxIndex);

rectangle('Position',[(max_X-102) (max_Y-75) 102 75], ...
    'LineWidth',4,'EdgeColor','g','Curvature',[0 0]);

figure;

srf = surf(rCat);
set(srf, 'LineStyle', 'none');
