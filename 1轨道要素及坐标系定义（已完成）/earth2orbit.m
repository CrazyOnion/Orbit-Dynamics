function  [a,p,i,e,omega,w,f,E,M,n,tao,harrow,earrow]=earth2orbit(rarrow,varrow,t0,miu)
%miu=3.986e5;%km
harrow=cross(rarrow,varrow);%动量矩
h=norm(harrow);
i=acos(harrow(3)/norm(harrow));%倾角
p=(h^2)/miu;%轨道半通径/km
omega=mod(atan(-1*harrow(1)/harrow(2)),2*pi);%升交点赤经
earrow=cross(varrow,harrow)/miu-rarrow/norm(rarrow);%偏心率
e=norm(earrow);%偏心率大小
K=[0;0;1];%z向单位向量
n=cross(K,harrow)/norm(cross(K,harrow));%节线单位向量
w=mod(acos(dot(n,earrow)/e),2*pi);%近地点俯角w
temp=cross(n,earrow);
if (temp(3)<0)
    w=2*pi-w;
end
a=p/(1-e^2);%半长轴/km
f=mod(acos(dot(rarrow,earrow)/(e*norm(rarrow))),2*pi);%真近点角f/rad
E=2*atan(sqrt((1-e)/(1+e))*tan(f/2));%偏近点角E/rad
M=mod(E-e*sin(E),2*pi);%平近点角M/rad
n=sqrt(miu/(a^3));%平均运动角速度
tao=t0-(M/n)/3600/24;%过近地点时刻tao//JD时间！！！
end
