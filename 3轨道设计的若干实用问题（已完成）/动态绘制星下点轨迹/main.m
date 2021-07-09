clc;
clear;
miu=3.986e5;%km

%��д���µ����ģ��

%����
rarrow=[1986.456; 6494.446; 1391.853];%
varrow=[-6.310264; 2.632283; -3.272889];%
t0=2455469.5;%JD��Ԫʱ��
Re=6378.140;%km
Rp=6356.755;%km


%����
T=0.1;%����
for t=t0:0.00001:t0+T
    [a,p,i,e,omega,w,~,~,~,~,tao,~,~]=earth2orbit(rarrow,varrow,t0,miu);
    [rrarrow,vvarrow]=orbitarrow(a,e,t,tao,miu);
    r=orbit2earth(rrarrow,omega,w,i);
    [longitude,latitude]=calsatpoint(r,t,Re,Rp);
end
%��������ȡ�γ�Ȼ����γ�ȡ��߶Ȼ򺣰θ߶�
geoshow('landareas.shp', 'FaceColor', [1 1 1]);hold on;
grid on;
axis([-180 180 -90 90])%���ö�άͼ��x-y���귶Χ
xlabel('����/deg');
ylabel('γ��/deg');
title('���µ�켣');
