%% Read the images
ref = imread('E-1.png');
A = imread('O-1.png');
B = imread('U-1.png');

%% Calculate PSNR/SNR
[peaksnr, snr] = psnr(A, ref);
[peaksnr2, snr2] = psnr(B, ref);
fprintf('\n The O-net PSNR value is %0.4f', peaksnr);
fprintf('\n The O-net SNR value is %0.4f \n', snr);
fprintf('\n The U-net PSNR value is %0.4f', peaksnr2);
fprintf('\n The U-net SNR value is %0.4f \n', snr2);

%% Calculate IMSE (https://www.mathworks.com/help/images/ref/immse.html)
err = immse(A, ref);
err2 = immse(B, ref);
fprintf('\n The O-Net mean-squared error (IMSE) is %0.4f\n', err);
fprintf('\n The U-Net mean-squared error (IMSE) is %0.4f\n', err2);

%% Calculate SSIM (https://www.mathworks.com/help/images/ref/ssim.html)
[ssimval,ssimmap] = ssim(A,ref);
[ssimval2,ssimmap2] = ssim(B,ref);
ssimscore = squeeze(ssimval);
ssimscore2 = squeeze(ssimval2);
fprintf('\n The O-Net SSIM is %0.4f\n', ssimscore);
fprintf('\n The U-Net SSIM is %0.4f\n', ssimscore2);

%% Calculate MS-SSIM (https://www.mathworks.com/help/images/ref/multissim.html)
scoreo = multissim(A,ref);
scoreoa = squeeze(scoreo);
scoreu = multissim(B,ref);
scoreua = squeeze(scoreu);

fprintf('\n The O-Net MS-SSIM is %0.4f\n', scoreoa);
fprintf('\n The U-Net MS-SSIM is %0.4f\n', scoreua);

%% Calculate FSIM/FSIMc
%Given 2 test images img1 and img2. For gray-scale images, their dynamic range should be 0-255.
%For colorful images, the dynamic range of each color channel should be 0-255.
[AFSIM, AFSIMc] = FeatureSIM(ref, A);
[BFSIM, BFSIMc] = FeatureSIM(ref, B);

%% Calculate ICI (images are 8-bit)
ICI_O = (mean((abs(A-ref)),'all'))/255;
ICI_U = (mean((abs(B-ref)),'all'))/255;

fprintf('\n The O-Net ICI is %0.6f\n', ICI_O);
fprintf('\n The U-Net ICI is %0.6f\n', ICI_U);
