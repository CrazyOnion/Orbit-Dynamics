clc;
clear;
%****参数一览表****
%f真近点角
%E偏近点角
%M平近点角
%p半通径
%a半长轴
%e偏心率
%i轨道倾角
%omega升交点赤经
%w近地点俯角
miu=3.986e5;%km^3
Re=6378.140;%km

%% 计算平面内圆轨道霍曼转移所需的燃料以及实现交会对接所需等待的时间。
%输入：给定轨道平面升交点赤经和轨道倾角，初始圆轨道和目标圆轨道的轨道半径以及各自当前时刻的近地点俯角。
%输出：霍曼轨道转移的两次脉冲速度增量以及在惯性坐标系中的速度投影，霍曼轨道转移两次脉冲速度作用时时刻。
disp('***计算平面内圆轨道霍曼转移所需的燃料以及实现交会对接所需等待的时间***');
disp('按“任意键”继续......');
pause;
%输入
% disp('请输入当前时刻（儒略日）');
% t0=input('t0=');
% disp('请输入轨道平面升交点赤经（以度数计）');
% omega=input('omega=');omega=omega*pi/180;
% disp('请输入轨道倾角（以度数计）');
% i=input('i=');i=i*pi/180;
% disp('请输入初始圆轨道的轨道半径（以km计）');
% alow=input('alow=');
% disp('请输入当前时刻初始圆轨道的近地点俯角（以度数计）');
% flow=input('flow=');flow=flow*pi/180;
% disp('请输入目标圆轨道的轨道半径（以km计）');
% ahigh=input('ahigh=');
% disp('请输入当前时刻目标圆轨道的近地点俯角（以度数计）');
% fhigh=input('fhigh=');fhigh=fhigh*pi/180;


%测试用输入数据
t0=2466500;%当前时刻
omega=300.4147*pi/180;%平面升交点赤经
i=51.639*pi/180;%轨道倾角
alow=340+Re;%小圆轨道半径km
flow=0;%小圆轨道真近点角
ahigh=405+Re;%大圆轨道半径km
fhigh=pi;%大圆轨道真近点角

%计算
[deltaV1,deltaV2,delaytime,deltaV1time,deltaV2time,deltaV1eartharrow,deltaV2eartharrow]=HohmanManeuver(t0,miu,omega,i,alow,flow,ahigh,fhigh);

%输出
disp('滑行椭圆轨道近地点速度增量大小(m/s)');
disp(num2str(deltaV1*1000));%单位：m/s
disp('滑行椭圆轨道远地点速度增量大小(m/s)');
disp(num2str(deltaV2*1000));%单位：m/s
disp('惯性坐标系下速度增量deltaV1的投影(m/s)');
disp(num2str(deltaV1eartharrow'*1000));%单位：m/s
disp('惯性坐标系下速度增量deltaV2的投影(m/s)');
disp(num2str(deltaV2eartharrow'*1000));%单位：m/s
disp('交会对接时间（等待+滑行）/h');
disp(num2str(delaytime/3600));
disp('近地点机动时刻(JD)');
disp(num2str(deltaV1time));
disp('远地点机动时刻(JD)');
disp(num2str(deltaV2time));