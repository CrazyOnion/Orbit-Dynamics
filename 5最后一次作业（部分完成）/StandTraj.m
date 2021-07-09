function f = StandTraj(a,e,i,omega,w)
%%
%初始条件
GM=3.986e5;  %地心引力常数，单位m/s
p=a*(1-e*e);   %轨道半通径，单位m
rp=p/(1+e);  %轨道近地点
ra=p/(1-e);  %轨道远地点
h=sqrt(GM*p);  %轨道角动量
x10=0;y10=0;z10=0; %轨道中心坐标
h_o=[0 0 h]';  %轨道角动量在地心轨道坐标系下的坐标
h_i=orbit2earth(h_o,omega,w,i);  %轨道角动量在地心惯性系下的坐标
a1=h_i(1);b1=h_i(2);c1=h_i(3); 
a=(rp+ra)/2;
b=a*sqrt(1-e*e);
%%
%赤道面内轨道坐标
t1=0:0.0001:2*pi;
x1=a*cos(t1);
y1=b*sin(t1);
z1=zeros(1,length(t1));
%%
%坐标变换
A1=asin(-b1/sqrt(b1^2+c1^2));
B1=asin(a1/sqrt(a1^2+c1^2));
C1=0;
Rx_A1=[1 0 0;0 cos(A1) sin(A1);0 -sin(A1) cos(A1)];
Ry_B1=[cos(B1) 0 -sin(B1);0 1 0;sin(B1) 0 cos(B1)];
Rz_C1=[cos(C1) sin(C1) 0;-sin(C1) cos(C1) 0;0 0 1];
Rxyz1=Rz_C1*Ry_B1*Rx_A1*[x1;y1;z1];
%%
%空间内轨道坐标
TR1(1,:)=Rxyz1(1,:)+x10*ones(1,length(t1));
TR1(2,:)=Rxyz1(2,:)+y10*ones(1,length(t1));
TR1(3,:)=Rxyz1(3,:)+z10*ones(1,length(t1));
f={TR1(1,:),TR1(2,:),TR1(3,:)};
%%
%画图
plot3(TR1(1,:),TR1(2,:),TR1(3,:));
hold on
%plot3(x1,y1,z1)
%plot3(x10,y10,z10,'*');
%grid on;
end