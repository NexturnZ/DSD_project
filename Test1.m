Image = imread('Screenshot4.png');
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

s = size(O);


