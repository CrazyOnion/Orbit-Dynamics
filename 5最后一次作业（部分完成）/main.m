clc;clear;clf;
miu=398600.4418;%km
Re=6378.14;
Rp=6356.755;
satlist=load3linesatdata('DFH1.txt');%读取卫星参数
%备注：若批量打开无卫星姓名的轨道参数文件，则使用load2linesatdata('***.txt')函数来读取轨道参数
%sortrows(satlist,2);
% 卫星参数表
% satlist{i,1}%命名
% satlist{i,2}%JD时刻
% satlist{i,3}%倾角i
% satlist{i,4}%升交点赤经omega
% satlist{i,5}%偏心率e
% satlist{i,6}%近地点俯角w
% satlist{i,7}%平近点角M
% satlist{i,8}%平均运动圈数
% satlist{i,9}%纪元圈数
% satlist{i,10}%rarrow
% satlist{i,11}%varrow

for i=1:size(satlist,1)%计算惯性系矢量
    n=satlist{i,8}*2*pi/(24*3600);%平均角速度
    [rrarrow,vvarrow]=satlist2orbitarrow(satlist{i,5},satlist{i,7},n,miu);
    rarrow=orbit2earth(rrarrow,satlist{i,4},satlist{i,6},satlist{i,3});
    varrow=orbit2earth(vvarrow,satlist{i,4},satlist{i,6},satlist{i,3});
    satlist{i,10}=rarrow;
    satlist{i,11}=varrow;
    list(i,1)=rarrow(1);
    list(i,2)=rarrow(2);
    list(i,3)=rarrow(3);
    list(i,4)=varrow(1);
    list(i,5)=varrow(2);
    list(i,6)=varrow(3);
end

showorbit(list,Re,Rp,miu);
