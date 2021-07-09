clc;
clear;
clf;
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
miu=3.986e5;%m
Re=6378.140;%km
Rp=6356.755;

%输入矢量
%rarrow=input('请输入地心惯性系下的位置矢量（输入格式为列向量！）\nrarrow=');
%varrow=input('请输入地心惯性系下的速度矢量（输入格式为列向量！）\nvarrow=');
%t0=input('请输入此位置对应的时刻（儒略日）\nt0=');

%示例输入数据
rarrow=[4869.90753751011,-3429.43546946486,3207.84887293891];%km 
varrow=[2.04182533300771,6.38661097339316,3.73364922805568];%km/s
t0=2455469.5;%JD时间

[a,p,i,e,omega,w,f,E,M,n,tao,harrow,earrow]=earth2orbit(rarrow,varrow,t0,miu);
%% 实现Cowell轨道预报
disp('Part1--Cowell轨道预报');
disp('按“任意键”继续......');pause;
disp('正在计算中，请稍后......');

%计算地心惯性坐标系中位置和速度矢量
[rrarrow,vvarrow]=orbitarrow(a,e,t0,tao,miu);
rarrow=orbit2earth(rrarrow,omega,w,i);
varrow=orbit2earth(vvarrow,omega,w,i);
%预报Kepler轨道（已知r和v）（精度低！）见figure1
a=p/(1-e^2);
T=2*pi*sqrt((a^3)/miu);
CowellKepler(rarrow,varrow,Re,Rp,T);%J2项为0
%预报J2地球形状摄动的影响（精度低！）见figure2
CowellJ2Kepler(rarrow,varrow,Re,Rp,T);%J2项不为0
%不使用Cowell法的轨道预报(见figure3)
plotorbitpredict(rarrow,varrow,t0,Re,Rp,T,miu);
disp('已完成计算和绘图！');
disp('按“任意键”继续......');pause;
%% 编写太阳光同步轨道计算模块
%输入轨道半长轴a、偏心率e、降交点地方时、当前纪元时刻
%输出轨道倾角、升交点赤经
disp('Part2--太阳光同步轨道计算');
disp('按“任意键”继续......');pause;clear;
%输入
a=input('请输入轨道半长轴（单位：km）\na=');
e=input('请输入偏心率\ne=');
downtime=input('请输入降交点地方时（以24h计）\ndowntime=');
t0=input('请输入当前纪元时刻（儒略日）\nt0=');
%计算
miu=3.986e5;%km
[isso,omegasso]=calculateSSO(a,e,downtime,t0,miu);
%输出轨道倾角i、升交点赤经omega
disp('****SSO轨道计算结果如下****');
disp('SSO轨道倾角/deg');
disp(num2str(isso*180/pi));
disp('SSO轨道升交点赤经/deg');
disp(num2str(omegasso*180/pi));