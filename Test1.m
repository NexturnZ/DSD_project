Image = imread('Screenshot.png');
I = sum(Image(605:1481,:,:),3)/3;
G = [-1,-1,-1;...
     -1, 8,-1;...
     -1,-1,-1];

O = mask_conv(I,G);
O(O>=10)=255;
O(O<10) = 0;
draw(O);

