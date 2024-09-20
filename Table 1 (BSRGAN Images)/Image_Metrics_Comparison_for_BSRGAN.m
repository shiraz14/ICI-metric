%% Read the images
ref = imread('Source-1.png');
Image = imread('BSRGANx2 - Res 1.png');
A = imresize(Image,0.5);

%% Calculate PSNR/SNR
[peaksnr, snr] = psnr(A, ref);
fprintf('\n The BSRGAN PSNR value is %0.4f', peaksnr);
fprintf('\n The BSRGAN SNR value is %0.4f \n', snr);

%% Calculate IMSE (https://www.mathworks.com/help/images/ref/immse.html)
err = immse(A, ref);
fprintf('\n The BSRGAN mean-squared error (IMSE) is %0.4f\n', err);

%% Calculate SSIM (https://www.mathworks.com/help/images/ref/ssim.html)
[ssimval,ssimmap] = ssim(A,ref);
ssimscore = squeeze(ssimval);
fprintf('\n The BSRGAN SSIM is %0.4f\n', ssimscore);

%% Calculate MS-SSIM (https://www.mathworks.com/help/images/ref/multissim.html)
score = multissim(A,ref);
scorea = squeeze(score);
fprintf('\n The BSRGAN MS-SSIM is %0.4f\n', scorea);

%% Calculate FSIM/FSIMc
%Given 2 test images img1 and img2. For gray-scale images, their dynamic range should be 0-255.
%For colorful images, the dynamic range of each color channel should be 0-255.
[FSIM, FSIMc] = FeatureSIM(ref, A);

%% Calculate ICI (images are 8-bit)
ICI_B = (mean((abs(A-ref)),'all'))/255;
fprintf('\n The BSRGAN ICI is %0.6f\n', ICI_B);
