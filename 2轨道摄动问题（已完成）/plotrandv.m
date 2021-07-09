function plotrandv(miu,p,e)
a=p/(1-e^2);
T=2*pi*sqrt((a^3)/miu);
figure(2);
for t=0:30:3*T
[ft,~,~,~]=obrit2orbit(miu,p,e,0,0,t/3600/24);
subplot(2,1,1);
r=p/(1+e*cos(ft));%��������е�r��С
plot(t,r,'r.');hold on;
subplot(2,1,2);
v=sqrt(miu*(2/r-1/a));%�ٶȴ�С
plot(t,v,'r.');hold on;

end
subplot(2,1,1);
grid on;
xlabel('t/s');
ylabel('r����뾶/km');
title('λ����ʱ��仯������');

subplot(2,1,2);
grid on;
xlabel('t/s');
ylabel('v����ٶ�/(km/s)');
title('�ٶ���ʱ��仯������');

end