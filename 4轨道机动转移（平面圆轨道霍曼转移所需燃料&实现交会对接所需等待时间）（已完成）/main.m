clc;
clear;
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
miu=3.986e5;%km^3
Re=6378.140;%km

%% ����ƽ����Բ�������ת�������ȼ���Լ�ʵ�ֽ���Խ�����ȴ���ʱ�䡣
%���룺�������ƽ��������ྭ�͹����ǣ���ʼԲ�����Ŀ��Բ����Ĺ���뾶�Լ����Ե�ǰʱ�̵Ľ��ص㸩�ǡ�
%������������ת�Ƶ����������ٶ������Լ��ڹ�������ϵ�е��ٶ�ͶӰ���������ת�����������ٶ�����ʱʱ�̡�
disp('***����ƽ����Բ�������ת�������ȼ���Լ�ʵ�ֽ���Խ�����ȴ���ʱ��***');
disp('���������������......');
pause;
%����
% disp('�����뵱ǰʱ�̣������գ�');
% t0=input('t0=');
% disp('��������ƽ��������ྭ���Զ����ƣ�');
% omega=input('omega=');omega=omega*pi/180;
% disp('����������ǣ��Զ����ƣ�');
% i=input('i=');i=i*pi/180;
% disp('�������ʼԲ����Ĺ���뾶����km�ƣ�');
% alow=input('alow=');
% disp('�����뵱ǰʱ�̳�ʼԲ����Ľ��ص㸩�ǣ��Զ����ƣ�');
% flow=input('flow=');flow=flow*pi/180;
% disp('������Ŀ��Բ����Ĺ���뾶����km�ƣ�');
% ahigh=input('ahigh=');
% disp('�����뵱ǰʱ��Ŀ��Բ����Ľ��ص㸩�ǣ��Զ����ƣ�');
% fhigh=input('fhigh=');fhigh=fhigh*pi/180;


%��������������
t0=2466500;%��ǰʱ��
omega=300.4147*pi/180;%ƽ��������ྭ
i=51.639*pi/180;%������
alow=340+Re;%СԲ����뾶km
flow=0;%СԲ���������
ahigh=405+Re;%��Բ����뾶km
fhigh=pi;%��Բ���������

%����
[deltaV1,deltaV2,delaytime,deltaV1time,deltaV2time,deltaV1eartharrow,deltaV2eartharrow]=HohmanManeuver(t0,miu,omega,i,alow,flow,ahigh,fhigh);

%���
disp('������Բ������ص��ٶ�������С(m/s)');
disp(num2str(deltaV1*1000));%��λ��m/s
disp('������Բ���Զ�ص��ٶ�������С(m/s)');
disp(num2str(deltaV2*1000));%��λ��m/s
disp('��������ϵ���ٶ�����deltaV1��ͶӰ(m/s)');
disp(num2str(deltaV1eartharrow'*1000));%��λ��m/s
disp('��������ϵ���ٶ�����deltaV2��ͶӰ(m/s)');
disp(num2str(deltaV2eartharrow'*1000));%��λ��m/s
disp('����Խ�ʱ�䣨�ȴ�+���У�/h');
disp(num2str(delaytime/3600));
disp('���ص����ʱ��(JD)');
disp(num2str(deltaV1time));
disp('Զ�ص����ʱ��(JD)');
disp(num2str(deltaV2time));