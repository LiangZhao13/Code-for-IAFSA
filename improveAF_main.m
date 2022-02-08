function [waypoint_x, waypoint_y, waypoint_yaw] = improveAF_main()
%%
% ������Ϊ�Ľ��˹���Ⱥ��������
% ���룺��
% �����waypoint��x�����Լ�y����
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
tic;
a = image_process();
% a = logical(a);
n = size(a,1);
b = a;
b(end+1,end+1) = 0;
figure;
colormap([0 0 0;1 1 1])
pcolor(b); % ����դ����ɫ
set(gca,'XTick',0:10:n,'YTick',0:10:n);  % ��������
% axis image xy

% text(0.5,0.5,'START','Color','red','FontSize',10);%��ʾstart�ַ�
% text(n+0.5,n+1.5,'GOAL','Color','red','FontSize',10);%��ʾgoal�ַ�

% case 1
% x_start = 92;
% y_start = 70;
% x_goal = 36;
% y_goal = 22;

%case 2
x_start = 96;
y_start = 74;
x_goal = 31;
y_goal = 23;

hold on

%������ʼ���Ŀ���λ��
scatter(x_start+0.5,y_start+0.5,'MarkerEdgeColor',[1 0 0],'MarkerFaceColor',[1 0 0], 'LineWidth',1);%start point
scatter(x_goal+0.5,y_goal+0.5,'MarkerEdgeColor',[0 1 0],'MarkerFaceColor',[0 1 0], 'LineWidth',1);%goal point

hold on

%%
%�ϰ��ռ���󼯺�B
Barrier = (find(a==0))';
%%
%��ʼ��
N = 10;%�˹�������
try_number = 8;
MAXGEN = 500;%����������
visual = 10; %��ʼֵ
delta = 0.618;
start = (x_start-1)*n+y_start;%�˹���Ⱥ��ʼλ��
DistMin = sqrt((1-n)^2+(n-1)^2);%��̾����־λ
goal = (x_goal-1)*100+y_goal;%Ŀ��λ��
shift = 1;%��ʳ��Ϊ��{Ⱥ�ۣ�׷β}��Ϊ��ģʽ�л���
shiftFreq = 8;%��ʳ��Ϊ��{Ⱥ�ۣ�׷β}��Ϊ���� ��Ƶ��
rightInf = sqrt(2);
arrayValue = [20];%����ȷ���Ҫ��ʾ��������.
%����waypoint������
x = [];
y = [];
for i =1:1:N
    ppValue(i) = start;%�����˹���Ⱥλ�õı���
end
H =GrideAF_foodconsistence(n,ppValue,goal);
count = 1;%��¼ִ����ʳ��Ϊ�Ĵ���
runDist = 0;%��¼����·�����ܳ���
runDist_part = 0;%��¼ÿһ�����е�����·�����ȣ����ڱȽ�
BestH = zeros(1,MAXGEN);%��¼ÿһ�ε����е�����Hֵ 
index = [];%��¼�ҵ�·������Ⱥ
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
            disp('prey!!!!')
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
            disp('swarm & follow!!!')
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

%�������Ϊ������������������ѭ������˵��û��·������
if MAXGEN <= j
    disp('There is no way can arrive to the goal!!!');
else

%%
%�����п���·�����ҳ����·��
    for i = 1:1:length(index)
        arrayValue =[start;position(:,index(i))]';
%���������·�����ܳ���
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
    
    %·���Ż�
    arrayValue = path_smooth(arrayValue);
    [waypoint_x, waypoint_y] = DrawPath(x, y, n,arrayValue);%��������·��
    waypoint_num = length(waypoint_x);
    waypoint_yaw = [0];
    for i = 1:waypoint_num-1
        angle = atan((waypoint_y(i+1)-waypoint_y(i))/(waypoint_x(i+1)-waypoint_x(i)));
        waypoint_yaw = [waypoint_yaw angle];
    end
%     fprintf('���߳���Ϊ: %f\n',runDist)%��ʾ����·���ĳ���
end
toc;
end