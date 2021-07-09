function plotorbitpredict(rarrow,varrow,t0,Re,Rp,T,miu)

[~,p,i,e,omega,w,f,~,~,~,~,~,~]=earth2orbit(rarrow,varrow,t0,miu);


%解1阶常微分方程组
[t,Y]=ode45(@J2fun,[0 10000*T],[p;i;e;w;f;omega]);

figure(3);

subplot(2,3,1);
plot(t,Y(:,1),'r');
xlabel('t/s');ylabel('轨道半通径p/km');
title('轨道半通径p');

subplot(2,3,2);
plot(t,Y(:,2)*180/pi,'r');
xlabel('t/s');ylabel('轨道倾角i/deg');
title('轨道倾角i');

subplot(2,3,3);
plot(t,Y(:,3),'r');
xlabel('t/s');ylabel('偏心率e');
title('偏心率e');

subplot(2,3,4);
plot(t,mod(Y(:,4),2*pi)*180/pi,'r');
xlabel('t/s');ylabel('近地点俯角w/deg');
title('近地点俯角w');

subplot(2,3,5);
plot(t,mod(Y(:,5),2*pi)*180/pi,'r');
xlabel('t/s');ylabel('真近点角f/deg');
title('真近点角f');

subplot(2,3,6);
plot(t,mod(Y(:,6),2*pi)*180/pi,'r');
xlabel('t/s');ylabel('升交点赤经omega/deg');
title('升交点赤经omega');
end