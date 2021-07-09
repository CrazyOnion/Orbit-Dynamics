function plotorbitpredict(rarrow,varrow,t0,Re,Rp,T,miu)

[~,p,i,e,omega,w,f,~,~,~,~,~,~]=earth2orbit(rarrow,varrow,t0,miu);


%��1�׳�΢�ַ�����
[t,Y]=ode45(@J2fun,[0 10000*T],[p;i;e;w;f;omega]);

figure(3);

subplot(2,3,1);
plot(t,Y(:,1),'r');
xlabel('t/s');ylabel('�����ͨ��p/km');
title('�����ͨ��p');

subplot(2,3,2);
plot(t,Y(:,2)*180/pi,'r');
xlabel('t/s');ylabel('������i/deg');
title('������i');

subplot(2,3,3);
plot(t,Y(:,3),'r');
xlabel('t/s');ylabel('ƫ����e');
title('ƫ����e');

subplot(2,3,4);
plot(t,mod(Y(:,4),2*pi)*180/pi,'r');
xlabel('t/s');ylabel('���ص㸩��w/deg');
title('���ص㸩��w');

subplot(2,3,5);
plot(t,mod(Y(:,5),2*pi)*180/pi,'r');
xlabel('t/s');ylabel('������f/deg');
title('������f');

subplot(2,3,6);
plot(t,mod(Y(:,6),2*pi)*180/pi,'r');
xlabel('t/s');ylabel('������ྭomega/deg');
title('������ྭomega');
end