function DrawPath(n,arrayValue)
%�������
% ����ά��----n
% ��Ҫ�����ľ�����ֵ-----arrayValue
%��������� ��

%13,34,256��դ����У���1-n*n����ֵ
% [row,col] = ind2sub(20,[13 34 256]);%դ���е���ֵת������������ֵ
[row,col] = ind2sub(n,arrayValue);%դ���е���ֵת������������ֵ
[array_x,array_y] = arry2orxy(n,row,col);%�������±�ת��Ϊ������xy��ʽ
% scatter(array_x+0.5,array_y+0.5,'MarkerEdgeColor',[0 0 1],'LineWidth',1.5);%��դ��ͼ�б�ʾ����
% plot(array_x+0.5,array_y+0.5,' g-.s  ');%������������·����������ͼ��������
% plot(array_x+0.5,array_y+0.5,' b-h ');%������������·����������ͼ��������
% plot(array_x+0.5,array_y+0.5,'  k--p ');%������������·����������ͼ��������
plot(array_x+0.5,array_y+0.5,' r ', 'linewidth', 2);%������������·����������ͼ��������
end

%�ڶ������뷽ʽ
%function DrawPath(n,row,col)
%�������
%����ά��----n
%�������----row
%�������----col
%��������� ��
% [array_x,array_y] = arry2orxy(n,row,col);%�������±�ת��Ϊ������xy��ʽ
% scatter(array_x+0.5,array_y+0.5,'MarkerEdgeColor',[0 0 1],'LineWidth',1.5);%��դ��ͼ�б�ʾ����
% plot(array_x+0.5,array_y+0.5,'-b');%������������·����������ͼ��������
% end

% PS:��ֵ�����0.5��Ϊ�˱�֤�������������դ�����Ĵ�
