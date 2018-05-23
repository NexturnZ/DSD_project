clear all; close all;
dbstop if error;
I = double(imread('Screenshot1.png'));

s = size(I);
%% transfer RGB to HSI

I_hsi = zeros(s(1),s(2),3);
for i1 = 1:s(1)
   for i2 = 1:s(2)
      [I_hsi(i1,i2,1),I_hsi(i1,i2,2),I_hsi(i1,i2,3)] = RGBtoHSI(I(i1,i2,:)); 
   end
end
draw(I);title('origin');
draw(I_hsi(:,:,1));title('Hue');
% draw(I_hsi(:,:,2));title('Saturate');
% draw(I_hsi(:,:,3));title('Intensity');
%% edge detection
G = [-1,-1,-1;...
     -1, 8,-1;...
     -1,-1,-1];
O = mask_conv(I_hsi(:,:,1),G);
% O(O>=10)=255;
% O(O<10) = 0;
draw(O(2:end-1,2:end-1));

%% circle finding 
r = 30;
for i1 = 1:s(1)
   for i2 = 1:s(2)
       
   end
end

creigon = O(1:end/2,:);








