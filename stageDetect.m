% I should be in hue field
function center = stageDetect(Image,direction)
center = [0,0];
if direction == 0
    I = Image(:,1:round(end/7*4));
elseif direction == 1
    I = Image(:,(end/7*3):end);
end

%% edge detection in hue image ---- for next stage detect
Sobel = [-1, 2,-1;...       % Sobel -- avoid horizontal edge in background
          0, 0, 0;...
         -1, 2,-1];
edge_hue = mask_conv(I(:,:,1),Sobel);   % extarct edge in hue field
Iplot = abs(edge_hue);
Iplot = Iplot/max(Iplot(:))*255;
Iplot(Iplot>=1)=255;
Iplot(Iplot<1) = 0;
figure;draw(Iplot);title('edge of hue image');

% I_edge = edge(I_hsi(:,:,1),'sobel');
% figure;imshow(I_edge);

%% detect the center next stage based on edge




end

