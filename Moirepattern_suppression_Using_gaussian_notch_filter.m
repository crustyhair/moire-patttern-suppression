clc; clear all; close all;
img1 = imread('Radiograph_1.jpg');
img2 = imread('Radiograph_2.jpg');

%%%%%%%%%%% converting the image from image domain to the frequency%%%%%%%
%%%%%%%%%%% domian%%%%%%%%%%%
fd1 = fftshift(fft2(img1));
magnitude1 = abs(fd1);%%%%%%%%%%%%%%%%
log_magnitude1 = log(1+magnitude1);
figure;
imshow(log_magnitude1,[]);
title('magnitude of fft brain')
figure;
mesh(log_magnitude1);
title('To identify the co-ordinates of the high frequency components')%%% to identify the co-ordinates of the highfrequency components
% Co-ordinates for the notch filters to be applied 
%%%%%supression%%%%%%%%%%%%%%%%%%%%%%%55



