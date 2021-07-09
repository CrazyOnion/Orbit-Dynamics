clc;
clear;
miu=3.986e5;%km
%% 编写星下点计算模块
%输入：地心惯性坐标系中位置矢量与纪元时刻
%输入：地球模型描述(球模型或旋转椭球模型)
%输出：经度、纬度或地理纬度、高度或海拔高度
disp('Part1--星下点计算模块');
disp('按任意键继续......');
pause;
%输入
rarrow=[23251.1237554384;-35221.7512919697;37.8484803282669];%风云4A 东经99.5
t0=2458251.41121096;%JD纪元时刻
Re=6378.140;%km
Rp=6356.755;%km
%计算
[longitude,latitude,h]=satpoint(rarrow,t0,Re,Rp);
%输出
disp('经度');
disp(num2str(longitude*180/pi));
disp('纬度');
disp(num2str(latitude*180/pi));
disp('海拔高度/km');
disp(num2str(h));
disp('按任意键继续......');
pause;
%% 编写回归轨道计算模块
%输入：回归轨道的回归圈数，回归天数，偏心率，轨道倾角
%输出：轨道半长轴。
disp('Part2--回归轨道计算模块');
disp('按任意键继续......');
% pause;
% %输入
% NR=input('请输入回归圈数 NR=');
% MR=input('请输入回归天数 MR=');
% e=input('请输入偏心率 e=');
% i=input('请输入轨道倾角(deg) i=');i=i*pi/180;

%计算示例
NR=47;
MR=3;
e=0.004;
i=45*pi/180;
%计算
a=recursiveorbit(NR,MR,e,i,miu);
%输出
disp('轨道半长轴/km');
disp(num2str(a));