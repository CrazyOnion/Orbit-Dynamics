function CowellKepler(rarrow,varrow,Re,Rp,T)%�˺���������J2��Ӱ��Ŀ����չ��


%��1�׳�΢�ַ�����
[t,f]=ode45(@Cowell,0:0.1:T*3,[rarrow(1);rarrow(2);rarrow(3);varrow(1);varrow(2);varrow(3)]);

figure(1);
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
title('��J2��Ӱ��Ŀ����չ��');
%����xyz������ʸ��
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