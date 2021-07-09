function f=J2fun(t,x)
p=x(1);
i=x(2);
e=x(3);
w=x(4);
f=x(5);
omega=x(6);
r=p/(1+e*cos(f));

%常参数
miu=398600.4418;%km
Re=6378.140;%km
J2=0.001082626173852;%EGM2008模型使用的J2数值
%J2=0;

%摄动力
fr=(-1.5*J2*(miu*(Re^2)/(r^4))*(1-3*(sin(i)^2)*(sin(w+f))^2));
fu=(-1.5*J2*(miu*(Re^2)/(r^4))*3*(sin(i)^2)*sin(2*w+2*f));
fh=(-1.5*J2*(miu*(Re^2)/(r^4))*3*sin(2*i)*sin(w+f));%theta为真近点角


%6个表达式
Dp=2*r*fu*(p/miu)^0.5;%Dp
Di=r*cos(w+f)*fh/(miu*p)^0.5;%Di
De=((p/miu)^0.5)*(sin(f)*fr+((1+r/p)*cos(f)+e*r/p)*fu);%De
Dw=(1/e)*((p/miu)^0.5)*(-cos(f)*fr+(1+r/p)*sin(f)*fu-e*r*sin(w+f)*fh/(p*tan(i)));%Dw
Df=((miu*p)^0.5)/(r^2)+cos(f)*((p/miu)^0.5)*fr/e-(sin(f)/e)*(1+r/p)*fu*((p/miu)^0.5);%Df
Domega=r*sin(w+f)*fh/(sqrt(miu*p)*sin(i));
%DM=(miu/(a^3))^0.5;
%Dr=(Dp*(1+e*cos(theta))-p*De*cos(theta)+p*e*sin(theta))/(1+e*cos(theta))^2;%Dr
f=[Dp;Di;De;Dw;Df;Domega];
end  