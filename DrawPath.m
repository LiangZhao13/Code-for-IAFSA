function [x, y] = DrawPath(x, y, n,arrayValue)
%�������
% ����ά��----n
% ��Ҫ�����ľ�����ֵ-----arrayValue
[row,col] = ind2sub(n,arrayValue);%դ���е���ֵת������������ֵ
[x,y] = arry2orxy(n,row,col);%�������±�ת��Ϊ������xy��ʽ
plot(x+0.5,y+0.5,' r ', 'linewidth', 2);%������������·����������ͼ��������

% ���ݴ������������껻��ʵ�����꣬��Ϊ��λ
% ���������Ϊ(0, 0)������ֱ�ӷ���DPϵͳ
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

