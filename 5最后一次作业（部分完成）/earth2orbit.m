function  [a,p,i,e,omega,w,f,E,M,n,tao,harrow,earrow]=earth2orbit(rarrow,varrow,t0,miu)
%miu=3.986e5;%km
harrow=cross(rarrow,varrow);%������
h=norm(harrow);
i=acos(harrow(3)/norm(harrow));%���
p=(h^2)/miu;%�����ͨ��/km
omega=mod(atan(-1*harrow(1)/harrow(2)),2*pi);%������ྭ
earrow=cross(varrow,harrow)/miu-rarrow/norm(rarrow);%ƫ����
e=norm(earrow);%ƫ���ʴ�С
K=[0;0;1];%z��λ����
n=cross(K,harrow)/norm(cross(K,harrow));%���ߵ�λ����
w=mod(acos(dot(n,earrow)/e),2*pi);%���ص㸩��w
temp=cross(n,earrow);
if (temp(3)<0)
    w=2*pi-w;
end
a=p/(1-e^2);%�볤��/km
f=mod(acos(dot(rarrow,earrow)/(e*norm(rarrow))),2*pi);%������f/rad
E=2*atan(sqrt((1-e)/(1+e))*tan(f/2));%ƫ�����E/rad
M=mod(E-e*sin(E),2*pi);%ƽ�����M/rad
n=sqrt(miu/(a^3));%ƽ���˶����ٶ�
tao=t0-(M/n)/3600/24;%�����ص�ʱ��tao//JDʱ�䣡����
end
