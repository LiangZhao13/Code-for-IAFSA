function displayNum(n)
%�������
%����ά��----n
%�����
%%
x_text = 1:1:n*n;%����1-400����ֵ.
test_num = 32;
%%
%����ֵ��դ��ͼ����ʾ����
for i = 1:1:n*n
    [row,col] = ind2sub(n,i);
    [array_x,array_y] = arry2orxy(n,row,col);
    text(array_x+0.2,array_y+0.5,num2str(x_text(i)));
end
%��֤դ����ֵ������ֵ�Ƿ��Ӧ
[row,col] = ind2sub(n,test_num);
[array_x,array_y] = arry2orxy(n,row,col);
fprintf('the value %d is on array_x = %d,array_y = %d\n',test_num,array_x,array_y);%��ʾУ����Ϣ�����˹�����.
end

