function [isso,omegasso]=calculateSSO(a,e,downtime,t0,miu)
Re=6378.140;%km
Wes=1.991064e-7;%̫����ת���ٶ�rad/s
J2=0.001082626173852;%EGM2008ģ��ʹ�õ�J2��ֵ
isso=acos(-Wes*(a^3.5)*((1-e^2)^2)/(1.5*J2*sqrt(miu)*(Re^2)));
%����̫���ྭ
T = (t0-2451545.0)/36525;%TΪJ2000���������������
Lo = 280.46645 + 36000.76983*T + 0.0003032*T^2;%̫������ƽ�ƾ�/deg
M = 357.52910 + 35999.05030*T - 0.0001559*T^2 -0.00000048*T^3;%̫��ƽ�����/deg
C = (1.914600 - 0.004817*T -0.000014*T*T) * sin(M*pi/180)+(0.019993 - 0.000101*T) * sin(2*M*pi/180)+ 0.000290*sin(3*M*pi/180);%̫���м䷽��/deg
theta = Lo + C;%̫����ƾ�/deg
epsilon=(23+26/60+15.3308/3600)*pi/180;%�Ƴཻ��/rad
omegas = atan(cos(epsilon)*tan(theta*pi/180));%̫���ྭ

deltaomega=downtime-12;
omegasso=mod(omegas+deltaomega,2*pi);
end