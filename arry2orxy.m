function  [array_x,array_y] = arry2orxy( n,row,col )
%�Ѿ����±�ת��������������
%��������
% ά��----n
% ��----row
% ��----col
%���������
% ������----arrayx
% ������----arrayy
k = length(row);
for i = 1:1:k
    array_x(i) = col(i);
    array_y(i) = row(i);
end

end

