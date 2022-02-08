function [ D ] = eachAF_dist(n,N,ppValue,position )
%���������
% n----����ά��
% N----�˹�������
% ppValue----��ǰ�˹����λ��
% position----�����˹����λ��
% ���������
% D----��ǰ�˹����������˹����λ�ã�������������.

D = zeros(1,N);
%����ǰ�˹���λ��ת��������
[pprow,ppcol] = ind2sub(n,ppValue);%դ���е���ֵת������������ֵ
[pp_array_x,pp_array_y] = arry2orxy(n,pprow,ppcol);%�������±�ת��Ϊ������xy��ʽ

for i = 1:1:N
 
    [positionrow,positioncol] = ind2sub(n,position(i));%դ���е���ֵת������������ֵ
    [position_array_x,position_array_y] = arry2orxy(n,positionrow,positioncol);%�������±�ת��Ϊ������xy��ʽ
    
    D(i) = norm([pp_array_x,pp_array_y] - [position_array_x,position_array_y]);
end

end

