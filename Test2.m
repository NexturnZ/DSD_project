Image = double(imread('Screenshot3.png'));
I = Image(894:970,333:405,:);
s = size(I);
O = zeros(s(1),s(2));
for i1 = 1:s(1)
   for i2 = 1:s(2)
      O(i1,i2) = RGBtoHue(I(i1,i2,:)); 
   end
end
draw(O);

