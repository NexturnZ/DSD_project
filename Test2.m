clear all;  close all;
dbstop if error;
Image = double(imread('Screenshot1.png'));
% I = Image(894:970,333:405,:);
I = Image;
s = size(I);
O = zeros(s(1),s(2),3);
for i1 = 1:s(1)
   for i2 = 1:s(2)
      [O(i1,i2,1),O(i1,i2,2),O(i1,i2,3)] = RGBtoHSI(I(i1,i2,:)); 
   end
end
draw(I);title('origin');
draw(O(:,:,1));title('Hue');
draw(O(:,:,2));title('Saturate');
draw(O(:,:,3));title('Intensity');
