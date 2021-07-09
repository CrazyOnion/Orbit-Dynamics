clc;
clear;
clf;
%****����һ����****
%f������
%Eƫ�����
%Mƽ�����
%p��ͨ��
%a�볤��
%eƫ����
%i������
%omega������ྭ
%w���ص㸩��
miu=3.986e5;%m
Re=6378.140;%km
Rp=6356.755;

%����ʸ��
%rarrow=input('��������Ĺ���ϵ�µ�λ��ʸ���������ʽΪ����������\nrarrow=');
%varrow=input('��������Ĺ���ϵ�µ��ٶ�ʸ���������ʽΪ����������\nvarrow=');
%t0=input('�������λ�ö�Ӧ��ʱ�̣������գ�\nt0=');

%ʾ����������
rarrow=[4869.90753751011,-3429.43546946486,3207.84887293891];%km 
varrow=[2.04182533300771,6.38661097339316,3.73364922805568];%km/s
t0=2455469.5;%JDʱ��

[a,p,i,e,omega,w,f,E,M,n,tao,harrow,earrow]=earth2orbit(rarrow,varrow,t0,miu);
%% ʵ��Cowell���Ԥ��
disp('Part1--Cowell���Ԥ��');
disp('���������������......');pause;
disp('���ڼ����У����Ժ�......');

%������Ĺ�������ϵ��λ�ú��ٶ�ʸ��
[rrarrow,vvarrow]=orbitarrow(a,e,t0,tao,miu);
rarrow=orbit2earth(rrarrow,omega,w,i);
varrow=orbit2earth(vvarrow,omega,w,i);
%Ԥ��Kepler�������֪r��v�������ȵͣ�����figure1
a=p/(1-e^2);
T=2*pi*sqrt((a^3)/miu);
CowellKepler(rarrow,varrow,Re,Rp,T);%J2��Ϊ0
%Ԥ��J2������״�㶯��Ӱ�죨���ȵͣ�����figure2
CowellJ2Kepler(rarrow,varrow,Re,Rp,T);%J2�Ϊ0
%��ʹ��Cowell���Ĺ��Ԥ��(��figure3)
plotorbitpredict(rarrow,varrow,t0,Re,Rp,T,miu);
disp('����ɼ���ͻ�ͼ��');
disp('���������������......');pause;
%% ��д̫����ͬ���������ģ��
%�������볤��a��ƫ����e��������ط�ʱ����ǰ��Ԫʱ��
%��������ǡ�������ྭ
disp('Part2--̫����ͬ���������');
disp('���������������......');pause;clear;
%����
a=input('���������볤�ᣨ��λ��km��\na=');
e=input('������ƫ����\ne=');
downtime=input('�����뽵����ط�ʱ����24h�ƣ�\ndowntime=');
t0=input('�����뵱ǰ��Ԫʱ�̣������գ�\nt0=');
%����
miu=3.986e5;%km
[isso,omegasso]=calculateSSO(a,e,downtime,t0,miu);
%���������i��������ྭomega
disp('****SSO�������������****');
disp('SSO������/deg');
disp(num2str(isso*180/pi));
disp('SSO���������ྭ/deg');
disp(num2str(omegasso*180/pi));