clc;
clear;
miu=3.986e5;%km

%编写星下点计算模块

%输入
rarrow=[1986.456; 6494.446; 1391.853];%
varrow=[-6.310264; 2.632283; -3.272889];%
t0=2455469.5;%JD纪元时刻
Re=6378.140;%km
Rp=6356.755;%km


%计算
T=0.1;%周期
for t=t0:0.00001:t0+T
    [a,p,i,e,omega,w,~,~,~,~,tao,~,~]=earth2orbit(rarrow,varrow,t0,miu);
    [rrarrow,vvarrow]=orbitarrow(a,e,t,tao,miu);
    r=orbit2earth(rrarrow,omega,w,i);
    [longitude,latitude]=calsatpoint(r,t,Re,Rp);
end
%输出：经度、纬度或地理纬度、高度或海拔高度
geoshow('landareas.shp', 'FaceColor', [1 1 1]);hold on;
grid on;
axis([-180 180 -90 90])%设置二维图的x-y坐标范围
xlabel('经度/deg');
ylabel('纬度/deg');
title('星下点轨迹');
