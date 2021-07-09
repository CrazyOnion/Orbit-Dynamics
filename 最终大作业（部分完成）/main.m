clc;clear;
%常数
miu=398600.4418;%km
Re=6378.14;
Rp=6356.755;
J2=0.001082626173852;%EGM2008模型使用的J2数值
we=7.292e-5;%地球自转角速度rad/s

%输入
% rarrow=input('请输入地心惯性系下的位置矢量（输入格式为列向量！）\nrarrow=');
% varrow=input('请输入地心惯性系下的速度矢量（输入格式为列向量！）\nvarrow=');
% t0=input('请输入此位置对应的时刻（儒略日）\nt0=');

%测试用数据
rarrow=[1986.456; 6494.446; 1391.853];%km
varrow=[-6.310264; 2.632283; -3.272889];%km/s
t0=2455469.5;%JD时间

%% 惯性坐标系中的速度与位置矢量转轨道要素
disp('Part1--惯性坐标系中的速度与位置矢量转轨道要素。');
disp('按“任意键”继续......');
pause;
%计算轨道要素
[a,p,i,e,omega,w,f,E,M,n,tao,~,~]=earth2orbit(rarrow,varrow,t0,miu);%计算轨道要素
%输出
disp('倾角i/deg');
disp(num2str(i*180/pi));
disp('升交点赤经omega/deg');
disp(num2str(omega*180/pi));
disp('偏心率大小e');
disp(num2str(e));
disp('近地点俯角w/deg');
disp(num2str(w*180/pi));
disp('半长轴a/km');
disp(num2str(a));
disp('真近点角f/deg');
disp(num2str(f*180/pi));
disp('偏近点角E/deg');
disp(num2str(E*180/pi));
disp('平近点角M/deg');
disp(num2str(M*180/pi));
disp('过近地点时刻tao/JDtime');
disp(num2str(tao));

disp('按“任意键”继续......');
pause;
%% 轨道要素转惯性坐标系中的速度与位置矢量
disp('Part2--轨道要素转惯性坐标系中的速度与位置矢量。');
disp('按“任意键”继续......');
pause;
%输入
% p=input('轨道半通径（km） p=');
% i=input('轨道倾角（deg） i=');i=i*pi/180;
% e=input('轨道偏心率e=');
% omega=input('轨道升交点赤经（deg） omega=');omega=omega*pi/180;
% w=input('轨道近地点俯角（deg） w=');w=w*pi/180;
% tao=input('过近地点时刻(儒略日) tao=');
% t0=input('请输入此位置对应的时刻（儒略日）t0=');

%计算轨道平面坐标系内向量
[rrarrow,vvarrow]=orbitarrow(p,e,t0,tao,miu);
%转换到惯性系
varrow=orbit2earth(vvarrow,omega,w,i);
rarrow=orbit2earth(rrarrow,omega,w,i);

%输出
disp('该时刻的位置矢量rx ry rz (单位：km)');
disp(num2str(rarrow'));
disp('该时刻的速度矢量vx vy vz (单位：km/s)');
disp(num2str(varrow'));
disp('按“任意键”继续......');
pause;
%% 二体的轨道预报器
%基于数值积分的Cowell轨道预报器







%% 二体的轨道预报器
%二体+J2项长期摄动影响修正的轨道预报器







%% 典型的轨道设计计算工具
%太阳同步轨道
%地球同步轨道
%回归轨道
%临界轨道









%% 星下点轨迹计算与绘制








