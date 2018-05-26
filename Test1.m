clear all; close all;
dbstop if error;
%% Obtain image
Image = double(imread('Screenshot4.png'));
s = size(Image);
I = Image(round(s(1)/3):round(s(1)/3*2),:,:);
draw(I);title('origin');
%% transfer RGB to HSI

I_hsi = RGBtoHSI(I);
draw(I_hsi(:,:,1));title('Hue');
% draw(I_hsi(:,:,2));title('Saturate');
draw(I_hsi(:,:,3));title('Intensity');

%% detect chess piece
chess = chessDetect(I_hsi(:,:,3),30);   % the radius of chess head is 30

%% edge detection in hue image ---- for next stage detect
Sobel = [-1, 2,-1;...       % Sobel -- avoid horizontal edge in background
          0, 0, 0;...
         -1, 2,-1];
edge_hue = mask_conv(I_hsi(:,:,1),Sobel);   % extarct edge in hue field
Iplot = abs(edge_hue);
Iplot = Iplot/max(Iplot(:))*255;
Iplot(Iplot>=1)=255;
Iplot(Iplot<1) = 0;
draw(Iplot);title('edge of hue image');

% I_edge = edge(I_hsi(:,:,1),'sobel');
% figure;imshow(I_edge);









