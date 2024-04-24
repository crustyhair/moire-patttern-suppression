% Parameters
N =4 ; % Number of notches
u0 = [268, 260,244,238]; % u-coordinates of notch centers
v0 = [82, 124,216,258]; % v-coordinates of notch centers
sigma = [20,15,20,15]; 

% Image dimensions
M = 339; % Number of rows
L = 505; % Number of columns

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
title('Notch Filter H(u, v) for brain');
fds1 = fd1.*H;
magnitudes1 = abs(fds1);
log_magnitudes1 = log(1+magnitudes1);
figure;
imshow(log_magnitudes1,[])
title('Notch filter application brain');
inversed = ifft2(ifftshift(fds1));
filtered_image = real(inversed);
filtered_image = abs(filtered_image);
filtered_image = uint8(filtered_image);
figure;
imshow(filtered_image);
title('filterd image brain');








