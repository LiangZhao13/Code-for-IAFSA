function [ dist ] = distance(n,ppValue,randomValue )
%���������
%n----�����ά��
% ppValue----��ǰλ��
% randomValue----����λ��
% ���������
% dist----����Ԫ��֮��ľ���

[pprow,ppcol] = ind2sub(n,ppValue);%դ���е���ֵת������������ֵ
[pp_array_x,pp_array_y] = arry2orxy(n,pprow,ppcol);%�������±�ת��Ϊ������xy��ʽ

[randrow,randcol] = ind2sub(n,randomValue);%դ���е���ֵת������������ֵ
[rand_array_x,rand_array_y] = arry2orxy(n,randrow,randcol);%�������±�ת��Ϊ������xy��ʽ

dist = sqrt((pp_array_x-rand_array_x)^2+(pp_array_y-rand_array_y)^2);

end

