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
% figure;draw(I_hsi(:,:,3));title('Intensity');

%% detect chess piece in intensity field
chess = chessDetect(I_hsi(:,:,3),30);   % the radius of chess head is 30
if chess(2)>s(2)/2
    direction = 0;  % the next stage is on the left side
else
    direction = 1;  % the next stage is on the right side
end
%% detect center of next stage
stage = stageDetect(I_hsi(:,:,1),direction);
