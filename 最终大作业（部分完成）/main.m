clc;clear;
%����
miu=398600.4418;%km
Re=6378.14;
Rp=6356.755;
J2=0.001082626173852;%EGM2008ģ��ʹ�õ�J2��ֵ
we=7.292e-5;%������ת���ٶ�rad/s

%����
% rarrow=input('��������Ĺ���ϵ�µ�λ��ʸ���������ʽΪ����������\nrarrow=');
% varrow=input('��������Ĺ���ϵ�µ��ٶ�ʸ���������ʽΪ����������\nvarrow=');
% t0=input('�������λ�ö�Ӧ��ʱ�̣������գ�\nt0=');

%����������
rarrow=[1986.456; 6494.446; 1391.853];%km
varrow=[-6.310264; 2.632283; -3.272889];%km/s
t0=2455469.5;%JDʱ��

%% ��������ϵ�е��ٶ���λ��ʸ��ת���Ҫ��
disp('Part1--��������ϵ�е��ٶ���λ��ʸ��ת���Ҫ�ء�');
disp('���������������......');
pause;
%������Ҫ��
[a,p,i,e,omega,w,f,E,M,n,tao,~,~]=earth2orbit(rarrow,varrow,t0,miu);%������Ҫ��
%���
disp('���i/deg');
disp(num2str(i*180/pi));
disp('������ྭomega/deg');
disp(num2str(omega*180/pi));
disp('ƫ���ʴ�Сe');
disp(num2str(e));
disp('���ص㸩��w/deg');
disp(num2str(w*180/pi));
disp('�볤��a/km');
disp(num2str(a));
disp('������f/deg');
disp(num2str(f*180/pi));
disp('ƫ�����E/deg');
disp(num2str(E*180/pi));
disp('ƽ�����M/deg');
disp(num2str(M*180/pi));
disp('�����ص�ʱ��tao/JDtime');
disp(num2str(tao));

disp('���������������......');
pause;
%% ���Ҫ��ת��������ϵ�е��ٶ���λ��ʸ��
disp('Part2--���Ҫ��ת��������ϵ�е��ٶ���λ��ʸ����');
disp('���������������......');
pause;
%����
% p=input('�����ͨ����km�� p=');
% i=input('�����ǣ�deg�� i=');i=i*pi/180;
% e=input('���ƫ����e=');
% omega=input('���������ྭ��deg�� omega=');omega=omega*pi/180;
% w=input('������ص㸩�ǣ�deg�� w=');w=w*pi/180;
% tao=input('�����ص�ʱ��(������) tao=');
% t0=input('�������λ�ö�Ӧ��ʱ�̣������գ�t0=');

%������ƽ������ϵ������
[rrarrow,vvarrow]=orbitarrow(p,e,t0,tao,miu);
%ת��������ϵ
varrow=orbit2earth(vvarrow,omega,w,i);
rarrow=orbit2earth(rrarrow,omega,w,i);

%���
disp('��ʱ�̵�λ��ʸ��rx ry rz (��λ��km)');
disp(num2str(rarrow'));
disp('��ʱ�̵��ٶ�ʸ��vx vy vz (��λ��km/s)');
disp(num2str(varrow'));
disp('���������������......');
pause;
%% ����Ĺ��Ԥ����
%������ֵ���ֵ�Cowell���Ԥ����







%% ����Ĺ��Ԥ����
%����+J2����㶯Ӱ�������Ĺ��Ԥ����







%% ���͵Ĺ����Ƽ��㹤��
%̫��ͬ�����
%����ͬ�����
%�ع���
%�ٽ���









%% ���µ�켣���������








