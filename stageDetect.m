% I should be in hue field
function center = stageDetect(Image,direction)
if direction == 0
    I = Image(:,1:round(end/7*4));
elseif direction == 1
    I = Image(:,round(end/7*3):end);
end
sImage = size(Image);
s = size(I);
x = 1:s(1);
y = 1:s(2);
[X,~] = meshgrid(x,y);
X = X.';
%% edge detection in hue image ---- for next stage detect
% Sobel = [-1, 2,-1;...       % Sobel -- avoid horizontal edge in background
%           0, 0, 0;...
%          -1, 2,-1];
% edge_hue = mask_conv(I(:,:,1),Sobel);   % extarct edge in hue field
% % Iplot = edge_hue-min(edge_hue(:));
% Iplot = abs(edge_hue);
% Iplot = Iplot/max(Iplot(:))*255;
% Iplot(Iplot>=10)=255;
% Iplot(Iplot<10) = 0;
% figure;draw(Iplot);title('edge of hue image');
% edge2 = Iplot;

I_edge = edge(I(:,:,1),'sobel');
figure;imshow(I_edge);
edge2 = 255*I_edge;
%% detect the center next stage based on edge

X_edge = X(edge2==255);
topx = min(X_edge);
topy_left = min(y(edge2(topx,:)==255));
topy_right = max(y(edge2(topx,:)==255));


counter_left = 1; counter_right = 1;
side_left = [topx, topy_left];
side_right = [topx, topy_right];
% left side
flag = 0;
while counter_left < 5
    
    for i1 = 2:-1:-1
        for i2 = 2:-1:0
            if edge2(side_left(1)+i2,side_left(2)-i1)==255
                if ~((i1==-1 || i1==0)&& i2==0)
                    side_left = side_left+[i2,-i1];
                    flag = 1;
                    if (i1==0 || i1==-1) && i2==1
                        counter_left = counter_left+1;
                    elseif (i1==0 || i1==-1) && i2==2
                        counter_left = counter_left+1;
                    end
                    break;
                end
            end
        end
        if flag == 1
            flag = 0;
            break;
        end
    end
    
%     if edge2(side_left(1)+1,side_left(2)-1)==255
%         side_left = side_left+[1,-1];
%     elseif edge2(side_left(1),side_left(2)-1)==255
%         side_left = side_left+[0,-1];
%     elseif edge2(side_left(1),side_left(2))==255
%         side_left = side_left+[1,0];
%         counter_left = counter_left+1;
%     else
%         counter_left = 5;
%         fprintf('error\n');
%     end
end

while counter_right < 5
    for i1 = 2:-1:-1
        for i2 = 2:-1:0
            if edge2(side_right(1)+i2,side_right(2)+i1)==255
                if ~((i1==-1 || i1==0) && i2==0)
                    side_right = side_right+[i2,+i1];
                    flag = 1;
                    if (i1==0 || i1==-1) && i2==1
                        counter_right = counter_right+1;
                    elseif (i1==0 || i1==-1) && i2==2
                        counter_right = counter_right+1;
                    end
                    break;
                end
            end
        end
        if flag == 1
            flag = 0;
            break;
        end
    end
    
    
%     if edge2(side_right(1)+1,side_right(2)+1)==255
%         side_right = side_right+[1,1];
%     elseif edge2(side_right(1),side_right(2)+1)==255
%         side_right = side_right+[0,1];
%     elseif edge2(side_right(1),side_right(2))==255
%         side_right = side_right+[1,0];
%         counter_right = counter_right+1;
%     else
%         counter_right = 5;
%         fprintf('error\n');
%     end
end

center = round((side_left+side_right-[0,10])/2);

if direction == 1
    center = center+[0,round(sImage(2)/7*3)-1];
end

end

