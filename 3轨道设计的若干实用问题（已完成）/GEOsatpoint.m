%这是一个计算GEO轨道的示例程序
clc; clear;

t = 0:1:6;

we = 360/24;%自转角速度

u = we*t;%自转角度

i = 0;%倾角

fai = asind(sind(i)*sind(u));%纬度

deltalmd = atand( cosd(i)*tand(u) );%地球不转的经度

if(i==90)

deltalmd(end) = 90;

end

lmd = deltalmd - we*t;%经度

% use symetry to generate the other data

for j = 1:6

lmd(j+7) = -lmd(7-j);

fai(j+7) = fai(7-j);

end

for j = 1:12

lmd(j+13) = lmd(13-j);

fai(j+13) = -fai(13-j);

end

h = geoshow('landareas.shp', 'FaceColor', [1 1 1]);
xlabel('经度/deg');
ylabel('纬度/deg');
grid on;
axis([-180 180 -90 90])%设置二维图的x-y坐标范围
hold on;
plot(lmd, fai); 
title(['星下点轨迹', '倾角i=',num2str(i)]);