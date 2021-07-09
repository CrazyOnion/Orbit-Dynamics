function CowellKepler(rarrow,varrow,Re,Rp,T)%此函数计算无J2项影响的开普勒轨道


%解1阶常微分方程组
[t,f]=ode45(@Cowell,0:0.1:T*3,[rarrow(1);rarrow(2);rarrow(3);varrow(1);varrow(2);varrow(3)]);

figure(1);
%画出地球椭球体
ellipsoid(0,0,0,Re,Re,Rp,20);hold on;
%alpha(0.5);hold on;%透明度
% 绘制椭球体：ellipsoid(xc,yc,zc,xr,yr,zr,n)
% xc,yc,zc分别表示椭球中心的x，y，z坐标。
% xr,yr,zr分别表示椭球x，y，z半轴的长度。
% n表示绘图时，沿着经度和纬度方向划分的曲面片数量，n越大则数据越密集，曲面越光滑。

%坐标轴标签
xlabel('x/km');
ylabel('y/km');
zlabel('z/km');
title('无J2项影响的开普勒轨道');
%绘制xyz坐标轴矢量
text(6450*2+100,0,0,'X','Color',[0 0 0],'FontSize',13);hold on;
text(0,6450*2+100,0,'Y','Color',[0 0 0],'FontSize',13);hold on;
text(0,0,6450*2+100,'Z','Color',[0 0 0],'FontSize',13);hold on;
quiver3(0,0,0,6400,0,0,2,'k','LineWidth',2);hold on;
quiver3(0,0,0,0,6400,0,2,'k','LineWidth',2);hold on;
quiver3(0,0,0,0,0,6400,2,'k--','LineWidth',2);hold on;
plot3(f(:,1),f(:,2),f(:,3),'r');hold on;
axis equal;
grid on;
end