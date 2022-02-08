function map = image_process()
% 函数作用：将rgb地图转化为栅格图
% 输出：map 100*100矩阵，0为障碍物，1为可行域
% 
% I=imread('map.png');   %读入图片
% % I = rgb2gray(I);
% bw = im2bw(I, 0.4);
% bw = 1-bw;
% a=100; 
% b=100; 
% l=1;    %网格边长
% bw = imresize(bw,[a/l b/l]);%   将数字矩阵转为规定的大小
% 
% for i = 1:a
%     for j = 1:b
%         if 0.9 < bw(i, j)
%             bw(i, j) = 1;
%         else
%             bw(i, j) = 0;
%         end
%     end
% end
% % a=50; 
% % b=50; 
% % l=1;    %网格边长
% % bw = imresize(bw,[a/l b/l]);
% 
% map = uint8(bw);
% map = flip(map,1);

map = load('map.mat');
map = map.map;
colormap([0 0 0;1 1 1])

pcolor(map); % 赋予栅格颜色

end

