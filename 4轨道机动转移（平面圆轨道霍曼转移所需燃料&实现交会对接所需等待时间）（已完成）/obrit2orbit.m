function [ft,Et,Mt,taot]=obrit2orbit(miu,p,e,tao,t0,t)%计算任意时刻的经典轨道要素
%对于任意时刻，经典轨道要素p,i,e,omega,w,t0不会变化，故只计算f,E,M,tao
a=p/(1-e^2);%轨道半长轴
%h=sqrt(p*miu);
n=sqrt(miu/(a^3));%平均运动角速度
M=mod(n*(t0-tao)*24*3600,2*pi);%当前时刻平近点角M
Mt=mod(M+n*(t-t0)*24*3600,2*pi);%t时刻平近点角Mt
Et=fsolve(@(E)myfunEM(E,e,Mt),Mt,optimset('Display','off'));%反解出偏近点角Et
Et=mod(Et,2*pi);
ft=mod(acos((cos(Et)-e)/(1-e*cos(Et))),2*pi);%真近点角f

taot=t-(Mt/n)/24/3600;%当前时刻的时间常量（上次过近拱点时间）
end