function plotrandv(miu,p,e)
a=p/(1-e^2);
T=2*pi*sqrt((a^3)/miu);
figure(2);
for t=0:30:3*T
[ft,~,~,~]=obrit2orbit(miu,p,e,0,0,t/3600/24);
subplot(2,1,1);
r=p/(1+e*cos(ft));%轨道坐标中的r大小
plot(t,r,'r.');hold on;
subplot(2,1,2);
v=sqrt(miu*(2/r-1/a));%速度大小
plot(t,v,'r.');hold on;

end
subplot(2,1,1);
grid on;
xlabel('t/s');
ylabel('r轨道半径/km');
title('位置随时间变化的曲线');

subplot(2,1,2);
grid on;
xlabel('t/s');
ylabel('v轨道速度/(km/s)');
title('速度随时间变化的曲线');

end