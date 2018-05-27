clear all; close all;
dbstop if error;
%% Obtain image
Image = double(imread('Screenshot11.png'));
s = size(Image);
I = Image(round(s(1)/3):round(s(1)/3*2),:,:);
figure;draw(I);title('origin');
%% transfer RGB to HSI

I_hsi = RGBtoHSI(I);
% figure;draw(I_hsi(:,:,1));title('Hue');
% figure;draw(I_hsi(:,:,2));title('Saturate');
figure;draw(I_hsi(:,:,3));title('Intensity');

%% test chess_detect
pixel = chessDetect(I_hsi(:,:,3),30);
Output = I;
Output(pixel(1)-5:pixel(1)+5,pixel(2),:) = repmat([255,0,0],11,1);
Output(pixel(1),pixel(2)-5:pixel(2)+5,:) = repmat([255,0,0],11,1);
figure(1); hold on;
imshow(uint8(Output));
hold off;