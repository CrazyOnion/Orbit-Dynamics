clc;
clear;
%常数项
miu=398600.4418;%按km计算
Re=6378.14;%km
Rp=6356.755;%km
%% 根据地心惯性系中位置速度矢量计算对应的经典轨道要素
disp('Part1--根据地心惯性系中位置速度矢量计算对应的经典轨道要素。');
disp('按“任意键”继续......');
pause;

%输入
%rarrow=input('请输入地心惯性系下的位置矢量（输入格式为列向量！）\nrarrow=');
%varrow=input('请输入地心惯性系下的速度矢量（输入格式为列向量！）\nvarrow=');
%t0=input('请输入此位置对应的时刻（儒略日）\nt0=');

%使用某算例的矢量
rarrow=[1986.456; 6494.446; 1391.853];%km
varrow=[-6.310264; 2.632283; -3.272889];%km/s
t0=2455469.5;%JD时间

%计算轨道要素
[a,p,i,e,omega,w,f,E,M,n,tao,harrow,earrow]=earth2orbit(rarrow,varrow,t0,miu);%计算轨道要素
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
%% 计算任意时刻的经典轨道要素
%已知现有的经典轨道要素，求任意时刻的经典轨道要素。
disp('Part2--计算任意时刻的经典轨道要素');
disp('按“任意键”继续......');
pause;

%输入
% p=input('轨道半通径p（km）=');
% i=input('轨道倾角i（deg）=');i=i*pi/180;
% e=input('轨道偏心率e=');
% omega=input('轨道升交点赤经mega（deg）=');omega=omega*pi/180;
% w=input('轨道近地点俯角（deg）=');w=w*pi/180;
% t0=input('请输入此位置对应的时刻（儒略日）t0=');
t=input('请输入要计算的时刻（使用J2000历的儒略日）\nt=');

%对于任意时刻，经典轨道要素p,i,e,omega,w,t0不会变化，故只计算f,E,M,tao
[ft,Et,Mt,taot]=obrit2orbit(miu,p,e,tao,t0,t);

%输出
disp('该时刻的真近点角ft/deg');
disp(num2str(ft*180/pi));
disp('该时刻的真近点角Et/deg');
disp(num2str(Et*180/pi));
disp('该时刻的真近点角Mt/deg');
disp(num2str(Mt*180/pi));
disp('该时刻前的过近拱点时刻taot/JDtime');
disp(num2str(taot));
disp('按“任意键”继续......');
pause;
%% 计算任意时刻地心惯性坐标系中位置速度矢量
%已知现有的经典轨道要素，求任意时刻的经典轨道要素。
disp('Part3--计算任意时刻地心惯性坐标系中位置速度矢量。');
disp('按“任意键”继续......');
pause;

%输入
% p=input('轨道半通径p（km）=');
% i=input('轨道倾角i（deg）=');i=i*pi/180;
% e=input('轨道偏心率e=');
% omega=input('轨道升交点赤经mega（deg）=');omega=omega*pi/180;
% w=input('轨道近地点俯角（deg）=');w=w*pi/180;
% t0=input('请输入此位置对应的时刻（儒略日）t0=');
t=input('请输入要计算的时刻（儒略日）\nt=');

%对于任意时刻，经典轨道要素p,i,e,omega,w,t0不会变化，故只计算f,E,M,tao
[~,~,~,taot]=obrit2orbit(miu,p,e,tao,t0,t);
%计算轨道平面坐标系内向量
[rrarrow,vvarrow]=orbitarrow(p,e,t,taot,miu);
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
%% 绘图表示对应的开普勒轨道问题的圆锥曲线及位置和速度随时间变化的曲线（轨道预报仿真）
disp('Part4--轨道预报仿真');
disp('按“任意键”继续......');
pause;

%输入
%rarrow=input('请输入地心惯性系下的位置矢量（输入格式为列向量！）\nrarrow=');
%varrow=input('请输入地心惯性系下的速度矢量（输入格式为列向量！）\nvarrow=');
%t0=input('请输入此位置对应的时刻（儒略日）\nt0=');
%[~,p,~,e,~,~,~,~,~,~,~,~,~]=earth2orbit(rarrow,varrow,t0,miu);%计算轨道要素

%计算
list=[rarrow',varrow'];

%输出
showorbit(list,Re,Rp,miu);
plotrandv(miu,p,e);