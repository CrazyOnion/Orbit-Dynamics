function [deltaV1,deltaV2,delaytime,deltaV1time,deltaV2time,deltaV1eartharrow,deltaV2eartharrow]=HohmanManeuver(t0,miu,omega,i,alow,flow,ahigh,fhigh)
%СԲ��������ٶ�km/s
vlow=sqrt(miu/alow);
%��Բ��������ٶ�km/s
vhigh=sqrt(miu/ahigh);
%������Բ������ص��ٶ�km/s
vep=sqrt(2*miu*ahigh/(alow*(alow+ahigh)));
%������Բ���Զ�ص��ٶ�km/s
vea=sqrt(2*miu*alow/(ahigh*(alow+ahigh)));
%������Բ������ص��ٶ�������Сkm/s
deltaV1=vep-vlow;
%������Բ���Զ�ص��ٶ�������Сkm/s
deltaV2=vhigh-vea;

%��Բ�������ʱ��
ttr=(pi/sqrt(miu))*((alow+ahigh)/2)^(3/2);
%�������ʱ�����ǲ�
fH=pi*(1-((alow+ahigh)/(2*ahigh))^1.5);
%�����ʼ�����ǲ�
f0=mod(fhigh-flow,2*pi);


%�������ǰ�ĵȴ�ʱ��
tw=(f0-fH)/(sqrt(miu)*(alow^(-1.5)-ahigh^(-1.5)));
%����Խ�ȫ�̺�ʱ
delaytime=ttr+tw;

%��1�λ���ʱ�Ľ��ص㸩��ft1
[ft1,~,~,~]=obrit2orbit(miu,alow,0,t0,t0,t0+tw/3600/24);
ft1=mod(flow+ft1,2*pi);
%��2�λ���ʱ�Ľ��ص㸩��ft1
[ft2,~,~,~]=obrit2orbit(miu,ahigh,0,t0,t0,t0+delaytime/3600/24);
ft2=mod(fhigh+ft2,2*pi);

deltaV1time=t0+tw/3600/24;%���ص����ʱ��
deltaV2time=deltaV1time+ttr/3600/24;%Զ�ص����ʱ��

%�����ٶ������ڵ��Ĺ�������ϵ�µ�ͶӰ
%����Ϊ����Բ��������ڹ��ƽ������ϵ�¶�ֻ�������ٶ�vr��
deltaV1orbitarrow=[deltaV1;0;0];
deltaV2orbitarrow=[deltaV2;0;0];
%ת������
deltaV1eartharrow=orbit2earth(deltaV1orbitarrow,omega,ft1,i);
deltaV2eartharrow=orbit2earth(deltaV2orbitarrow,omega,ft2,i);

end