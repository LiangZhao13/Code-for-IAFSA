%%
% ���ڴ�ͳ�˹���Ⱥ�㷨����դ�񻷾��е��Ż�.
% �Ľ��������£�
% ����Ӧ��Ұ
% ����Ӧ����
% ����ʳ��Ϊ�м��뷽������
%%
close all;
clear all;
clc;
%%
%���������˵��ϰ�����������עstart,goalλ��
% a = rand(20)>0.35;%�ڰ׸���ռ����
tic;

a = load('object.txt');

n = size(a,1);
b = a;
b(end+1,end+1) = 0;
figure;
colormap([0 0 0;1 1 1])
pcolor(b); % ����դ����ɫ

set(gca,'XTick',10:10:n,'YTick',10:10:n);  % ��������
axis image xy

% displayNum(n);%��ʾդ���е���ֵ

text(0.5,0.5,'START','Color','red','FontSize',10);%��ʾstart�ַ�
text(n+0.5,n+1.5,'GOAL','Color','red','FontSize',10);%��ʾgoal�ַ�

hold on
% 
% 
% hold on

%%
%�ϰ��ռ���󼯺�B
Barrier = (find(a==0))';

%%
%����������

%%
%main
%%
% arrayValue = [13,34,256];
% %�жϽ��Ƿ����ϰ�����
% NB = length(arrayValue);
% for i = 1:1:NB
%     if ismember(arrayValue(i),Barrier) ==1
%         arrayValue(i) = randi([1 400],1); %ɾ���������ϰ��ﴦ������.������1-400��������� 
%     end
% end
N = 50;%�˹�������
try_number = 8;
MAXGEN = 50;%����������
visual = 10; %��ʼֵ
delta = 0.618;
start = 1;%�˹���Ⱥ��ʼλ��
DistMin = sqrt((1-n)^2+(n-1)^2);%��̾����־λ
goal = n*n;%Ŀ��λ��
shift = 1;%��ʳ��Ϊ��{Ⱥ�ۣ�׷β}��Ϊ��ģʽ�л���
shiftFreq = 4;%��ʳ��Ϊ��{Ⱥ�ۣ�׷β}��Ϊ���� ��Ƶ��
rightInf = sqrt(2);
% arrayValue = [20 39 58 77 96 115 134 153 172 192 212 232 252 272 291 310 
%                 329 328 327 326 325 324 344 364 363 362 361 381];%��ʼ��
arrayValue = [20];%����ȷ���Ҫ��ʾ��������.
for i =1:1:N
    ppValue(i) = start;%�����˹���Ⱥλ�õı���
end
H =GrideAF_foodconsistence(n,ppValue,goal);
count = 1;%��¼ִ����ʳ��Ϊ�Ĵ���
runDist = 0;%��¼����·�����ܳ���
runDist_part = 0;%��¼ÿһ�����е�����·�����ȣ����ڱȽ�
BestH = zeros(1,MAXGEN);%��¼ÿһ�ε����е�����Hֵ 
index = [];%��¼�ҵ�·������Ⱥ
% endpath = 1;%��¼�Ż�������·���ĵڼ�����
% path_optimum = [];%��¼�Ż����·��
% Rf = 4*sqrt(2);%�Ż�������Ұ�뾶
% kcount = 0;%����Ѱ�ż���                                                  
% dupilcate = 1;%�Ż���������
%-----------------------------------------���˱���������ʼ��ȫ������------------------------------------------------------
for j = 1:1:MAXGEN
    switch shift
%------------------------------------��ʳ��Ϊ----------------------------------------------------------------------------
        case 1
            for i = 1:1:N
               [nextPosition,nextPositionH] = GridAF_prey(n,ppValue(i),i,try_number,H,Barrier,goal, j, MAXGEN);
               %��Ҫ��¼��ÿ�����Ӧ��λ�ã��Լ�ʳ��Ũ��.�Ա��´θ���.
               position(j,i) = nextPosition;%position���������Ⱥ��λ��.
               H(i) = nextPositionH;
            end
%             disp('prey!!!!')
%------------------------------------Ⱥ����Ϊ---------------------------------------------------------------------------    
         case 2     
            for i = 1:1:N
                [nextPosition_S,nextPositionH_S] = GridAF_swarm(n,N,position(j-1,:),i,visual,delta,try_number,H,Barrier,goal, j, MAXGEN);
                [nextPosition_F,nextPositionH_F] = GridAF_follow(n,N,position(j-1,:),i,visual,delta,try_number,H,Barrier,goal, j, MAXGEN);
                if nextPositionH_F < nextPositionH_S
                    nextPosition = nextPosition_F;
                    nextPositionH = nextPositionH_F;
                else
                    nextPosition = nextPosition_S;
                    nextPositionH = nextPositionH_S;
                end
                 position(j,i) = nextPosition;%position���������Ⱥ��λ��.
                 H(i) = nextPositionH;
            end 
%             disp('swarm & follow!!!')
    end
%-----------------------------------------------------------------------------------------------------------------
    count = count+1;%�����˹��㶼�����һ����ʳ��Ϊ
    if rem(count,shiftFreq) == 0 %��Ϊcount��1��ʼ�ǣ�����5ʱ������4����ʳ��Ϊ
        shift = 2;
    else
        shift = 1;
    end
    %Ҫ����ppValue��ֵ
    ppValue =  position(j,:);
    %����position���ҵ��˹��㵽��goal��ʱ��������ѭ��
    index = find(position(j,:)==goal);
    if ~isempty(index)
        break;
    end

end

%%�������Ϊ������������������ѭ������˵��û��·������
if MAXGEN <= j
    disp('There is no way can arrive to the goal!!!');
else

%�����п���·�����ҳ����·��
    for i = 1:1:length(index)
        arrayValue =[start;position(:,index(i))]';
%----------------------���������·�����ܳ���-----------------------------
        for j = 1:1:length(arrayValue)-1
            d = distance(n,arrayValue(j),arrayValue(j+1));
            runDist_part = runDist_part + d;
        end
        transimit(i) = runDist_part;%��¼���п���·�����ܳ���   
        runDist_part = 0;
    end
    [runDist,runMin_index] = min(transimit);
    arrayValue = [start;position(:,index(runMin_index))]';

    
    for i =1:1:length(arrayValue)
        BestH(i) = goal-arrayValue(i);%��¼���ſ��н�ĵ���ͼ
    end
    
    DrawPath(n,arrayValue);%��������·��       
%------------------------------------------------------------------------
    fprintf('���߳���Ϊ: %f\n',runDist)%��ʾ����·���ĳ���
end

time = toc;
% PS:��ֵ�����0.5��Ϊ�˱�֤�������������դ�����Ĵ�
