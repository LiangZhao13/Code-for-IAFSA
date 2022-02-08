function [ nextPosition,nextPositionH ] = GridAF_follow( n,N,ppValue,ii,visual,delta,try_number,lastH,Barrier,goal, j, MAXGEN)
%���������
% n----����ά��
% N----�˹�������
% ppValue----�����˹���Ⱥ��λ��
% ii----��ǰ�˹���Ⱥ�ı��
% visual----��֪��Χ
% delta----ӵ������
% try_number----���Դ���
% LastH----��ǰ�˹�����һ�ε�ʳ��Ũ��
% Barrier----�ϰ������
% goal----�˹���Ŀ��λ��
%j , MAXGEN���ڴ���prey�����Ĳ������뱾�����޹�
% ���������
% nextPosition----��һʱ�̸����˹����λ��
% nextPositionH----��һʱ�̸����˹���λ�ô���ʳ��Ũ��


Xi = ppValue(ii);%��ǰ�˹����λ��
D = eachAF_dist(n,N,Xi,ppValue);%���㵱ǰ�˹���������������Ⱥ��ŷʽ����
visual = mean(D); %����Ӧ��Ȩ��Ұ
index = find(D > 0 & D < visual);%�ҵ���Ұ�е�������Ⱥ
Nf = length(index);%ȷ����Ұ֮�ڵ���Ⱥ����
j = 1;%��¼�����������ĸ���
rightInf = sqrt(2);
%%
%���㵱ǰ�˹���Ŀ�����
A = 1:1:n^2;
allow = setdiff(A,Barrier);    
for i = 1:1:length(allow)
    if 0 < distance(n,Xi,allow(i)) && distance(n,Xi,allow(i)) <= rightInf  
        allow_area(j) = allow(i);
        j = j+1;
    end
end
%%
if Nf > 0          %Nf > 0˵����Ұ֮���������˹���Ⱥ������Խ���Ⱥ����Ϊ
%----------------------------------------�����Hmin����Ӧ��Xmin--------------------------------------------------------------------
    Xvisual = ppValue(index);%ȡ���뵱ǰ�˹����ڽ�����Ⱥ������
    Hvisual = lastH(index);%ȡ���뵱ǰ�˹����ڽ�����Ⱥ��ʳ��Ũ��
    [Hmin,minindex] = min(Hvisual);%����ڽ���Ⱥ��ʳ��Ũ����͵�ֵ
    Xmin = Xvisual(minindex);%�õ�ʳ��Ũ����͵���Ⱥλ��
%-------------------------------------------------------------------------------------------------------------    
    Hi = lastH(ii);%��ǰ�˹����ʵ��Ũ��
    if Hmin/Nf <= Hi*delta     %�������λ�õ�ʳ��Ũ�ȱȵ�ǰλ�øߣ����Ҳ�ӵ������������λ����һ��      PS��HֵԽС������Ŀ��Խ��
        %�ڿ������У������һ�����Ƚϵ����ĵ�����뵱ǰֵ�����ĵ���룬˭С��ȡ˭
        for i = 1:1:try_number
            Xnext = allow_area(uint16(rand*(length(allow_area)-1)+1));%�ڿ����������ѡ��һ��.
            if distance(n,Xnext,Xmin) < distance(n,Xi,Xmin)
                nextPosition = Xnext;
                nextPositionH = GrideAF_foodconsistence(n,nextPosition,goal);
                break;
            else
                nextPosition = Xi;
                nextPositionH = GrideAF_foodconsistence(n,nextPosition,goal);
            end
        end
    else     %�������λ�õ�ʳ��Ũ��û�е�ǰλ�õ�ʳ��Ũ�ȸߣ��������ʳ��Ϊ
        [nextPosition,nextPositionH] = GridAF_prey(n,ppValue(ii),ii,try_number,lastH,Barrier,goal, j, MAXGEN);
    end
    
else                %����Nf < 0˵����Ұ��Χ��û�������˹��㣬��ô��ִ����ʳ��Ϊ  
    [nextPosition,nextPositionH] = GridAF_prey(n,ppValue(ii),ii,try_number,lastH,Barrier,goal, j, MAXGEN);
end




end

