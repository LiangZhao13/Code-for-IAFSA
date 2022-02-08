function [ H ] = GrideAF_foodconsistence(n,X,goal )
%���������
% n----����ά��
% X----�˹���Ⱥ��ǰλ��
% goal----�˹���Ŀ��λ��
% %���������
% H----��ǰλ���˹���Ⱥ��ʵ��Ũ��

Xf = [];%��¼��ǰ��Ⱥ�ĺ�����
Yf = [];%��¼��ǰ��Ⱥ��������
H = [];%��¼��ǰ��Ⱥ��ʵ��Ũ��
fishnum = size(X,2);

% goal = 381;%Ŀ��λ��,ת��Ϊ�������ʾ��ʽ
[row,col] = ind2sub(n,goal);
[Xg,Yg] = arry2orxy(n,row,col);

%%
%���˹���λ��ת��Ϊ����ֵ
for i =1:1:fishnum 
    [row,col] = ind2sub(n,X(i));
    [Xf(i),Yf(i)] = arry2orxy(n,row,col);
end
%����ʵ��Ũ�ȵ�ŷ�Ͼ���
for i = 1:1:fishnum
    H(i) = sqrt((Xf(i)-Xg)^2+(Yf(i)-Yg)^2);
end

end

