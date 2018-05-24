function I_hsi = RGBtoHSI(Image)
s = size(Image);
R = Image(:,:,1);
G = Image(:,:,2);
B = Image(:,:,3);
% Hue calculation
H = zeros(s(1),s(2));
theta = acos(0.5*(R-G+R-B)./sqrt(0.1+(R-G).^2+(R-B).*(G-B)));
H(B<=G) = theta(B<=G)/pi*180;
H(B>G)  = 360-theta(B>G)/pi*180;
% Saturate calculation
S = 1-3*min(Image,[],3)./sum(Image,3);
% intensity calculation
I = mean(Image,3);

I_hsi = zeros(s);
I_hsi(:,:,1) = H;
I_hsi(:,:,2) = S;
I_hsi(:,:,3) = I;
end