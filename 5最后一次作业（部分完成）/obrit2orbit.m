function [ft,Et,Mt,taot]=obrit2orbit(miu,p,e,tao,t0,t)%��������ʱ�̵ľ�����Ҫ��
%��������ʱ�̣�������Ҫ��p,i,e,omega,w,t0����仯����ֻ����f,E,M,tao
a=p/(1-e^2);%����볤��
%h=sqrt(p*miu);
n=sqrt(miu/(a^3));%ƽ���˶����ٶ�
M=mod(n*(t0-tao)*24*3600,2*pi);%��ǰʱ��ƽ�����M
Mt=mod(M+n*(t-t0)*24*3600,2*pi);%tʱ��ƽ�����Mt
Et=fsolve(@(E)myfunEM(E,e,Mt),Mt,optimset('Display','off'));%�����ƫ�����Et
Et=mod(Et,2*pi);
ft=mod(acos((cos(Et)-e)/(1-e*cos(Et))),2*pi);%������f

taot=t-(Mt/n)/24/3600;%��ǰʱ�̵�ʱ�䳣�����ϴι�������ʱ�䣩
end