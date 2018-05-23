function [H,S,I] = RGBtoHSI(pixel)
R = pixel(1);
G = pixel(2);
B = pixel(3);
% Hue calculation
theta = acos(0.5*(R-G+R-B)/sqrt((R-G)^2+(R-B)*(G-B)));
if B<=G
    H = theta/pi*180;
else
    H = 360-theta/pi*180;
end
% Saturate calculation
S = 1-3*min(pixel)/sum(pixel);
% intensity calculation
I = mean(pixel);
end