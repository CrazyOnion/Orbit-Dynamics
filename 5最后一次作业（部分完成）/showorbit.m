function showorbit(list,Re,Rp,miu)
%clc;
%rarrow=[1.986456e3,  6.494446e3,  1.391853e3];%km
%varrow=[-6.310264, 2.632283 -3.272889];%km/s
%figure(1)

%��������������
ellipsoid(0,0,0,Re,Re,Rp,20);hold on;
%alpha(0.5);hold on;%͸����
% ���������壺ellipsoid(xc,yc,zc,xr,yr,zr,n)
% xc,yc,zc�ֱ��ʾ�������ĵ�x��y��z���ꡣ
% xr,yr,zr�ֱ��ʾ����x��y��z����ĳ��ȡ�
% n��ʾ��ͼʱ�����ž��Ⱥ�γ�ȷ��򻮷ֵ�����Ƭ������nԽ��������Խ�ܼ�������Խ�⻬��

%�������ǩ
xlabel('x/km');
ylabel('y/km');
zlabel('z/km');
%����xyz������ʸ��
text(6450*2+100,0,0,'X','Color',[0 0 0],'FontSize',13);hold on;
text(0,6450*2+100,0,'Y','Color',[0 0 0],'FontSize',13);hold on;
text(0,0,6450*2+100,'Z','Color',[0 0 0],'FontSize',13);hold on;
quiver3(0,0,0,6400,0,0,2,'k','LineWidth',2);hold on;
quiver3(0,0,0,0,6400,0,2,'k','LineWidth',2);hold on;
quiver3(0,0,0,0,0,6400,2,'k--','LineWidth',2);hold on;

%������������ĳʱ����
for i=1:size(list,1)
    rx=list(i,1);vx=list(i,4);
    ry=list(i,2);vy=list(i,5);
    rz=list(i,3);vz=list(i,6);
    
    %���Ƶ���&��������
%     Lx=[rx 0];Ly=[ry 0];Lz=[rz 0];
%     plot3(Lx,Ly,Lz,'r','LineWidth',1);hold on;
    %����ĳʱ�ٶ�ʸ��
    %quiver3(rx,ry,rz,vx*100,vy*100,vz*100,1,'m','LineWidth',1);hold on;
    %���ƿռ���Բ�����
    [~,p,ii,e,omega,w,~,~,~,~,~,~,~]=earth2orbit([rx;ry;rz],[vx;vy;vz],0,miu);
    plot3Dellipse(p,e,omega,w,ii);
    %��������
    plot3(rx,ry,rz,'m*','LineWidth',2);hold on;
end
grid on;
axis equal;%�ȱ���������
end

