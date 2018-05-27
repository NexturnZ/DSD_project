function draw(I)

Iplot = abs(I);
Iplot = Iplot/max(Iplot(:))*255;
imshow(uint8(abs(Iplot)));

end