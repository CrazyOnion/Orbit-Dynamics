function a=recursiveorbit(NR,MR,e,i,miu)%回归轨道计算模块
%输入：回归轨道的回归圈数NR，回归天数MR，偏心率，轨道倾角
%输出：轨道半长轴。

%参数表
Re=6378.140;%km
J2=0.001082626173852;%EGM2008模型使用的J2数值
we=7.292e-5;%rad/s
C=2*pi*MR/NR;
%计算
a=fsolve(@(a)funDelta(a,e,i,J2,Re,we,miu,C),10*Re,optimset('Display','off'));%反解出a

end