function showorbit(list,Re,Rp,miu)
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
%绘制xyz坐标轴矢量
text(6450*2+100,0,0,'X','Color',[0 0 0],'FontSize',13);hold on;
text(0,6450*2+100,0,'Y','Color',[0 0 0],'FontSize',13);hold on;
text(0,0,6450*2+100,'Z','Color',[0 0 0],'FontSize',13);hold on;
quiver3(0,0,0,6400,0,0,2,'k','LineWidth',2);hold on;
quiver3(0,0,0,0,6400,0,2,'k','LineWidth',2);hold on;
quiver3(0,0,0,0,0,6400,2,'k--','LineWidth',2);hold on;

%批量绘制卫星某时坐标
for i=1:size(list,1)
    rx=list(i,1);vx=list(i,4);
    ry=list(i,2);vy=list(i,5);
    rz=list(i,3);vz=list(i,6);
    plot3(rx,ry,rz,'b.','LineWidth',3);hold on;
    %绘制地心&卫星连线
    Lx=[rx 0];Ly=[ry 0];Lz=[rz 0];
    plot3(Lx,Ly,Lz,'r','LineWidth',1);hold on;
    %绘制某时速度矢量
    quiver3(rx,ry,rz,vx*100,vy*100,vz*100,1,'m','LineWidth',1);hold on;
    %绘制空间椭圆轨道线
    [~,p,ii,e,omega,w,~,~,~,~,~,~,~]=earth2orbit([rx;ry;rz],[vx;vy;vz],0,miu);
    plot3Dellipse(p,e,omega,w,ii);
end
grid on;
axis equal;%等比例坐标轴

end

