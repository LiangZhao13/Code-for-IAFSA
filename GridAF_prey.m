function [ nextPosition,nextPositionH ] = GridAF_prey(n,ppValue,ii,try_number,lastH, Barrier,goal, j, MAXGEN)
%输入参数：
% n----矩阵维数
% present_position_value----ppValue人工鱼当前在栅格中的值(单个)
% ii----当前人工鱼序号
% try_number----最大尝试次数
% lastH----上次人工鱼食物浓度
% Barrier----障碍矩阵
% goal----人工鱼目标位置
%输出参数：
% nextPosition----下一时刻的人工鱼栅格矩阵值
%nextPositionH----下一时刻该条人工鱼位置处的食物浓度
%j 当前迭代次数，用于计算自适应步长
nextPosition = [];
allow_area = [];%记录可行域
j = 1;%记录单个鱼可行域的个数
present_H = lastH(ii);%当前位置时刻的实物浓度值.
rightInf = sqrt(2);

%自适应步长
rightInf = ceil(rightInf*(1 - j/MAXGEN));

%%
%人工鱼的可行域，计算出当前位置周边能走的点，距离在根号2以内
A = 1:1:n^2;
allow = setdiff(A,Barrier);    
for i = 1:1:length(allow)
    if 0 < distance(n,ppValue,allow(i)) && distance(n,ppValue,allow(i)) <= rightInf  
        allow_area(j) = allow(i);
        j = j+1; 
    end
end
%%
%加入方向因子，直接选择allow_area区域中的最小值
m = randsrc(1,1, [0 1; 0.2 0.8]);
%加入方向因子，直接选择allow_area区域中的最小值
if m == 0
    %正常选择，直接随机走一步
        for i = 1:1:try_number
            Xj = allow_area(uint16(rand*(length(allow_area)-1)+1));%在可行域中随机选择一步.
            Hj = GrideAF_foodconsistence(n,Xj,goal);
            if present_H > Hj%说明下一步的值距离goal更近，保留
               nextPosition = Xj;%因为Xj在可行域中，所以不用判断是否越界.
               break;  %找到一个小值就结束循环，所以得出的结果为，可行解，而不是最优解.
            end
        end
else
    H_min = present_H;
    for i  = 1:1:length(allow_area)
        Xi = allow_area(i);
        Hi = GrideAF_foodconsistence(n,Xi,goal);
        if Hi < H_min
            H_min = Hi;
            nextPosition = Xi;
        end
    end
end

if isempty(nextPosition)
     Xj = allow_area(uint16(rand*(length(allow_area)-1)+1));%在可行域中随机选择一步.
     nextPosition = Xj;%因为Xj在可行域中，所以不用判断是否越界.
end

%%
nextPositionH = GrideAF_foodconsistence(n,nextPosition,goal);
end

