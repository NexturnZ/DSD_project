% I is Intensity image, r should be 30
function pixel = chessDetect(I,r)
s = size(I);

%% edge detection in intensity image ---- for chess piece detect
Lap = [-1,-1,-1;...
       -1, 8,-1;...
       -1,-1,-1];
edge = mask_conv(I,Lap);     % extract edge in intensity field
Iplot = abs(edge);
Iplot = Iplot/max(Iplot(:))*255;
Iplot(edge>=30)=255;
Iplot(edge<30) = 0;
edge2 = Iplot;
draw(Iplot(2:end-1,2:end-1));title('edge of intensity image');

%% circle finding 
% r = 30;                 % radius of head of chess piece
H_field = zeros(s(1:2));     % initialize Hough transfer field
theta = linspace(0,2*pi);
for i1 = 1:s(1)
    for i2 = 1:s(2)          % for every points in image
        if edge2(i1,i2)==255
            for i3 = theta
                if round(i1+r*cos(i3))>=1 && round(i1+r*cos(i3))<s(1) &&...
                        round(i2+r*sin(i3))>=1 && round(i2+r*sin(i3))<s(2)
                    H_field(round(i1+r*cos(i3)),round(i2+r*sin(i3))) = ...
                        H_field(round(i1+r*cos(i3)),round(i2+r*sin(i3)))+1;
                end
            end
        end
    end
end
% figure;mesh(H_field);
[~,idx] = max(H_field(:));
head(1) = mod(idx,s(1));
head(2) = round(idx/s(1));
pixel = head+[163,0];
% pixel(1) = mod(idx,s(1));
% pixel(2) = round(idx/s(1));
end