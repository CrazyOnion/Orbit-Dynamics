function [rrarrow,vvarrow]=orbitarrow(p,e,t0,tao,miu)%使用时刻和近点角计算轨道坐标系下的矢量
%计算主体
a=p/(1-e^2);
h=sqrt(p*miu);
n=sqrt(miu/(a^3));%平均运动角速度
M=mod(n*(t0-tao)*24*3600,2*pi);%平近点角M
E=fsolve(@(E)myfunEM(E,e,M),M,optimset('Display','off'));%反解出偏近点角E
E=mod(E,2*pi);
f=acos((cos(E)-e)/(1-e*cos(E)));%真近点角f
f=mod(f,2*pi);
r=p/(1+e*cos(f));%轨道坐标中的r大小
%在轨道坐标系中
xx=r*cos(f);
yy=r*sin(f);
zz=0;
rrarrow=[xx;yy;zz;];
%轨道坐标系下的速度
vvr=-(miu/h)*sin(f);
vvu=(miu/h)*(e+cos(f));
vvz=0;
vvarrow=[vvr;vvu;vvz;];

end