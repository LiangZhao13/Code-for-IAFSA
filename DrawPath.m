function [x, y] = DrawPath(x, y, n,arrayValue)
%输入参数
% 矩阵维数----n
% 需要画出的矩阵数值-----arrayValue
[row,col] = ind2sub(n,arrayValue);%栅格中的数值转化成数组行列值
[x,y] = arry2orxy(n,row,col);%将矩阵下标转换为坐标轴xy形式
plot(x+0.5,y+0.5,' r ', 'linewidth', 2);%将保留的最优路径点用折线图连接起来

% 数据处理，将网格坐标换成实际坐标，米为单位
% 将起点设置为(0, 0)，方便直接放入DP系统
x = x.*33.5;
y = y.*22.3;
m = length(arrayValue);
for i = 1: m
    x(i) = x(i) - x(m);
    y(i) = y(i) - y(m);
end
x = flip(x);
y = flip(y);
end

