function [deltaV1,deltaV2,delaytime,deltaV1time,deltaV2time,deltaV1eartharrow,deltaV2eartharrow]=HohmanManeuver(t0,miu,omega,i,alow,flow,ahigh,fhigh)
%小圆轨道环绕速度km/s
vlow=sqrt(miu/alow);
%大圆轨道环绕速度km/s
vhigh=sqrt(miu/ahigh);
%滑行椭圆轨道近地点速度km/s
vep=sqrt(2*miu*ahigh/(alow*(alow+ahigh)));
%滑行椭圆轨道远地点速度km/s
vea=sqrt(2*miu*alow/(ahigh*(alow+ahigh)));
%滑行椭圆轨道近地点速度增量大小km/s
deltaV1=vep-vlow;
%滑行椭圆轨道远地点速度增量大小km/s
deltaV2=vhigh-vea;

%椭圆轨道滑行时间
ttr=(pi/sqrt(miu))*((alow+ahigh)/2)^(3/2);
%计算机动时真近点角差
fH=pi*(1-((alow+ahigh)/(2*ahigh))^1.5);
%计算初始真近点角差
f0=mod(fhigh-flow,2*pi);


%计算机动前的等待时间
tw=(f0-fH)/(sqrt(miu)*(alow^(-1.5)-ahigh^(-1.5)));
%交会对接全程耗时
delaytime=ttr+tw;

%第1次机动时的近地点俯角ft1
[ft1,~,~,~]=obrit2orbit(miu,alow,0,t0,t0,t0+tw/3600/24);
ft1=mod(flow+ft1,2*pi);
%第2次机动时的近地点俯角ft1
[ft2,~,~,~]=obrit2orbit(miu,ahigh,0,t0,t0,t0+delaytime/3600/24);
ft2=mod(fhigh+ft2,2*pi);

deltaV1time=t0+tw/3600/24;%近地点机动时刻
deltaV2time=deltaV1time+ttr/3600/24;%远地点机动时刻

%计算速度增量在地心惯性坐标系下的投影
%（因为都是圆轨道，故在轨道平面坐标系下都只有切向速度vr）
deltaV1orbitarrow=[deltaV1;0;0];
deltaV2orbitarrow=[deltaV2;0;0];
%转换矩阵
deltaV1eartharrow=orbit2earth(deltaV1orbitarrow,omega,ft1,i);
deltaV2eartharrow=orbit2earth(deltaV2orbitarrow,omega,ft2,i);

end