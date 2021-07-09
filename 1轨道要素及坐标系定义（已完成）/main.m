clc;
clear;
%������
miu=398600.4418;%��km����
Re=6378.14;%km
Rp=6356.755;%km
%% ���ݵ��Ĺ���ϵ��λ���ٶ�ʸ�������Ӧ�ľ�����Ҫ��
disp('Part1--���ݵ��Ĺ���ϵ��λ���ٶ�ʸ�������Ӧ�ľ�����Ҫ�ء�');
disp('���������������......');
pause;

%����
%rarrow=input('��������Ĺ���ϵ�µ�λ��ʸ���������ʽΪ����������\nrarrow=');
%varrow=input('��������Ĺ���ϵ�µ��ٶ�ʸ���������ʽΪ����������\nvarrow=');
%t0=input('�������λ�ö�Ӧ��ʱ�̣������գ�\nt0=');

%ʹ��ĳ������ʸ��
rarrow=[1986.456; 6494.446; 1391.853];%km
varrow=[-6.310264; 2.632283; -3.272889];%km/s
t0=2455469.5;%JDʱ��

%������Ҫ��
[a,p,i,e,omega,w,f,E,M,n,tao,harrow,earrow]=earth2orbit(rarrow,varrow,t0,miu);%������Ҫ��
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
%% ��������ʱ�̵ľ�����Ҫ��
%��֪���еľ�����Ҫ�أ�������ʱ�̵ľ�����Ҫ�ء�
disp('Part2--��������ʱ�̵ľ�����Ҫ��');
disp('���������������......');
pause;

%����
% p=input('�����ͨ��p��km��=');
% i=input('������i��deg��=');i=i*pi/180;
% e=input('���ƫ����e=');
% omega=input('���������ྭmega��deg��=');omega=omega*pi/180;
% w=input('������ص㸩�ǣ�deg��=');w=w*pi/180;
% t0=input('�������λ�ö�Ӧ��ʱ�̣������գ�t0=');
t=input('������Ҫ�����ʱ�̣�ʹ��J2000���������գ�\nt=');

%��������ʱ�̣�������Ҫ��p,i,e,omega,w,t0����仯����ֻ����f,E,M,tao
[ft,Et,Mt,taot]=obrit2orbit(miu,p,e,tao,t0,t);

%���
disp('��ʱ�̵�������ft/deg');
disp(num2str(ft*180/pi));
disp('��ʱ�̵�������Et/deg');
disp(num2str(Et*180/pi));
disp('��ʱ�̵�������Mt/deg');
disp(num2str(Mt*180/pi));
disp('��ʱ��ǰ�Ĺ�������ʱ��taot/JDtime');
disp(num2str(taot));
disp('���������������......');
pause;
%% ��������ʱ�̵��Ĺ�������ϵ��λ���ٶ�ʸ��
%��֪���еľ�����Ҫ�أ�������ʱ�̵ľ�����Ҫ�ء�
disp('Part3--��������ʱ�̵��Ĺ�������ϵ��λ���ٶ�ʸ����');
disp('���������������......');
pause;

%����
% p=input('�����ͨ��p��km��=');
% i=input('������i��deg��=');i=i*pi/180;
% e=input('���ƫ����e=');
% omega=input('���������ྭmega��deg��=');omega=omega*pi/180;
% w=input('������ص㸩�ǣ�deg��=');w=w*pi/180;
% t0=input('�������λ�ö�Ӧ��ʱ�̣������գ�t0=');
t=input('������Ҫ�����ʱ�̣������գ�\nt=');

%��������ʱ�̣�������Ҫ��p,i,e,omega,w,t0����仯����ֻ����f,E,M,tao
[~,~,~,taot]=obrit2orbit(miu,p,e,tao,t0,t);
%������ƽ������ϵ������
[rrarrow,vvarrow]=orbitarrow(p,e,t,taot,miu);
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
%% ��ͼ��ʾ��Ӧ�Ŀ����չ�������Բ׶���߼�λ�ú��ٶ���ʱ��仯�����ߣ����Ԥ�����棩
disp('Part4--���Ԥ������');
disp('���������������......');
pause;

%����
%rarrow=input('��������Ĺ���ϵ�µ�λ��ʸ���������ʽΪ����������\nrarrow=');
%varrow=input('��������Ĺ���ϵ�µ��ٶ�ʸ���������ʽΪ����������\nvarrow=');
%t0=input('�������λ�ö�Ӧ��ʱ�̣������գ�\nt0=');
%[~,p,~,e,~,~,~,~,~,~,~,~,~]=earth2orbit(rarrow,varrow,t0,miu);%������Ҫ��

%����
list=[rarrow',varrow'];

%���
showorbit(list,Re,Rp,miu);
plotrandv(miu,p,e);