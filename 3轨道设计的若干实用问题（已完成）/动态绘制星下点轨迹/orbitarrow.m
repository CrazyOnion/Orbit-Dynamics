function [rrarrow,vvarrow]=orbitarrow(a,e,t0,tao,miu)%ʹ��ʱ�̺ͽ���Ǽ���������ϵ�µ�ʸ��
%��������
p=a*(1-e^2);%�����ͨ��p
h=sqrt(p*miu);
n=sqrt(miu/(a^3));%ƽ���˶����ٶ�
M=mod(n*(t0-tao)*24*3600,2*pi);%ƽ�����M
E=fsolve(@(E)myfunEM(E,e,M),M,optimset('Display','off'));%�����ƫ�����E
E=mod(E,2*pi);
f=acos((cos(E)-e)/(1-e*cos(E)));%������f
f=mod(f,2*pi);
r=p/(1+e*cos(f));%��������е�r��С
v=sqrt(miu*(2/r-1/a));%�ٶȴ�С
%�ڹ������ϵ��
xx=r*cos(f);
yy=r*sin(f);
zz=0;
rrarrow=[xx;yy;zz;];
%�������ϵ�µ��ٶ�
vvr=-(miu/h)*sin(f);
vvu=(miu/h)*(e+cos(f));
vvz=0;
vvarrow=[vvr;vvu;vvz;];

end