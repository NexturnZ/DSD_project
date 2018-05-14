function Hue = RGBtoHue(pixel)
R = pixel(1);
G = pixel(2);
B = pixel(3);
theta = acos(0.5*(R-G+R-B)/sqrt((R-G)^2+(R-B)*(G-B)));
if B<=G
    Hue = theta/pi*180;
else
    Hue = 360-theta/pi*180;
end