clear all; close all;
dbstop if error;
%% Obtain image
Image = double(imread('Screenshot9.png'));
s = size(Image);
I = Image(round(s(1)/3):round(s(1)/3*2),:,:);
% figure;draw(I);title('origin');
%% transfer RGB to HSI

I_hsi = RGBtoHSI(I);
% figure;draw(I_hsi(:,:,1));title('Hue');
% figure;draw(I_hsi(:,:,2));title('Saturate');
% figure;draw(I_hsi(:,:,3));title('Intensity');

%% detect chess piece in intensity field
chess = chessDetect(I_hsi(:,:,3),30);   % the radius of chess head is 30
if chess(2)>s(2)/2
    direction = 0;  % the next stage is on the left side
else
    direction = 1;  % the next stage is on the right side
end
%% detect center of next stage
stage = stageDetect(I_hsi(:,:,1),direction);

%% display

chess_pointer = zeros(1,1,3);
chess_pointer(1) = 255;
stage_pointer = 255*ones(1,1,3);
stage_pointer = stage_pointer-I(stage(1),stage(2),:);

Output = I;
Output(chess(1)-7:chess(1)+7,chess(2)-1:chess(2)+1,:) = repmat(chess_pointer,15,3);
Output(chess(1)-1:chess(1)+1,chess(2)-7:chess(2)+7,:) = repmat(chess_pointer,3,15);

Output(stage(1)-7:stage(1)+7,stage(2)-1:stage(2)+1,:) = repmat(stage_pointer,15,3);
Output(stage(1)-1:stage(1)+1,stage(2)-7:stage(2)+7,:) = repmat(stage_pointer,3,15);

figure; hold on;
imshow(uint8(Output));
hold off;
