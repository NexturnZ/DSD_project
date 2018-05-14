Image = imread('Screenshot3.png');
I = sum(Image(605:1481,:,:),3)/3;   % extract important region

%% edge detection
G = [-1,-1,-1;...
     -1, 8,-1;...
     -1,-1,-1];
O = mask_conv(I,G);
O(O>=10)=255;
O(O<10) = 0;
draw(O);

%% circle finding 
r = 30;
s = size(O);
for i1 = 1:s(1)
   for i2 = 1:s(2)
       
   end
end

creigon = O(1:end/2,:);








