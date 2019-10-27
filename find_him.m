% Skip Fourier transform (4f system) method.  Just take correlation of
% object with target.  The result should be the same
clear;clc;

%Read in target
target=imread('target_matlab.bmp','bmp');
target=rgb2gray(target);
target=double(target)/255;

%Read in image
image=imread('testc.bmp','bmp');
image=rgb2gray(image);
image=double(image)/255;

%Take cross-correlation
output=xcorr2(image,target);
[num,idx]=max(output(:)); %finds indices of output maximum
[x,y]=ind2sub(size(output),idx);

figure(1)
imagesc(target)
colormap('gray'); title('Target');

figure(2)
imagesc(image)
colormap('gray'); title('Object');

figure(3)
imagesc(abs(output).^4); title('Output');
colormap gray