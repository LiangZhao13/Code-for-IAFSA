function [ allow_area ] = allow_fun( n,Barrier,Xi,Rf )
%���㵱ǰ�˹���Ŀ�����
%���������
% n----����ά��
% Barrier----�ϰ���
% Xi----��ǰ�˹����λ��
% rightInf-Rf----�������Ͻף��������Ϊ��Ұ
% ���������
% allow_area----��ǰ�˹���Ŀ�����
    j = 1;%��¼�����������ĸ���
    A = 1:1:n^2;
    allow = setdiff(A,Barrier);    
    for i = 1:1:length(allow)
        if 0 <= distance(n,Xi,allow(i)) && distance(n,Xi,allow(i)) <= Rf  
            allow_area(j) = allow(i);
            j = j+1;
        end
    end

end
