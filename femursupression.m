fd2 = fftshift(fft2(img2));
magnitude2 = abs(fd2);
log_magnitude2 = log(1+magnitude2);
figure;
imshow(log_magnitude2,[]);
surf(log_magnitude2);










N =2 ; % Number of notches
u0 = [209,277]; % u-coordinates of notch centers
v0 = [451,443]; % v-coordinates of notch centers
sigma = [7,7]; 

% Image dimensions
M = 893; % Number of rows
L = 485; % Number of columns

% Create a grid of frequencies
[U, V] = meshgrid(1:L, 1:M);

% Initialize the filter with ones
H = ones(M, L);

% Loop over each notch and apply the formula
for i = 1:N
    H = H .* (1 - exp(-((U - u0(i)).^2 + (V - v0(i)).^2) / sigma(i)^2));
end



% Display the filter
figure;
imagesc(H); axis image; colormap gray;
xlabel('u');
ylabel('v');
title('Notch Filter H(u, v) for femur');
fds2 = fd2.*H;
magnitudes1 = abs(fds2);
log_magnitudes1 = log(1+magnitudes1);
figure;
imshow(log_magnitudes1,[])
title('notch filter application for femur');
inversed = ifft2(ifftshift(fds2));
filtered_image2 = real(inversed);
filtered_image2 = abs(filtered_image2);
filtered_image2 = uint8(filtered_image2);
figure;
imshow(filtered_image2);
title('Fitered femur')
figure;
montage({img2,filtered_image2})
title('comparision of femur');
figure;
montage({img1,filtered_image});
title('brain comparision');

