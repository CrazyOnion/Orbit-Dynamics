function [rrarrow,vvarrow]=satlist2orbitarrow(e,M,n,miu)%ʹ��ʱ�̺ͽ���Ǽ���������ϵ�µ�ʸ��
%��������
a=(miu/(n^2))^(1/3);%�볤��
p=a*(1-e^2);%�����ͨ��p
h=sqrt(p*miu);
%M=mod(n*(t0-tao)*24*3600,2*pi);%ƽ�����M
E=fsolve(@(E)myfunEM(E,e,M),M,optimset('Display','off'));%�����ƫ�����E
E=mod(E,2*pi);
f=acos((cos(E)-e)/(1-e*cos(E)));%������f
f=mod(f,2*pi);
r=a*(1-e*cos(E));%��������е�r��С

%�ڹ������ϵ��
xx=r*cos(f);
yy=r*sin(f);
zz=0;
rrarrow=[xx;yy;zz;];
%�������ϵ�µ��ٶ�
vvr=-miu*sin(f)/h;
vvu=miu*(e+cos(f))/h;
vvz=0;
vvarrow=[vvr;vvu;vvz;];

end