function [isso,omegasso]=calculateSSO(a,e,downtime,t0,miu)
Re=6378.140;%km
Wes=1.991064e-7;%太阳公转角速度rad/s
J2=0.001082626173852;%EGM2008模型使用的J2数值
isso=acos(-Wes*(a^3.5)*((1-e^2)^2)/(1.5*J2*sqrt(miu)*(Re^2)));
%计算太阳赤经
T = (t0-2451545.0)/36525;%T为J2000起算的儒略世纪数
Lo = 280.46645 + 36000.76983*T + 0.0003032*T^2;%太阳几何平黄经/deg
M = 357.52910 + 35999.05030*T - 0.0001559*T^2 -0.00000048*T^3;%太阳平近点角/deg
C = (1.914600 - 0.004817*T -0.000014*T*T) * sin(M*pi/180)+(0.019993 - 0.000101*T) * sin(2*M*pi/180)+ 0.000290*sin(3*M*pi/180);%太阳中间方程/deg
theta = Lo + C;%太阳真黄经/deg
epsilon=(23+26/60+15.3308/3600)*pi/180;%黄赤交角/rad
omegas = atan(cos(epsilon)*tan(theta*pi/180));%太阳赤经

deltaomega=downtime-12;
omegasso=mod(omegas+deltaomega,2*pi);
end