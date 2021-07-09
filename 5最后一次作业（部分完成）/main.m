clc;clear;clf;
miu=398600.4418;%km
Re=6378.14;
Rp=6356.755;
satlist=load3linesatdata('DFH1.txt');%��ȡ���ǲ���
%��ע���������������������Ĺ�������ļ�����ʹ��load2linesatdata('***.txt')��������ȡ�������
%sortrows(satlist,2);
% ���ǲ�����
% satlist{i,1}%����
% satlist{i,2}%JDʱ��
% satlist{i,3}%���i
% satlist{i,4}%������ྭomega
% satlist{i,5}%ƫ����e
% satlist{i,6}%���ص㸩��w
% satlist{i,7}%ƽ�����M
% satlist{i,8}%ƽ���˶�Ȧ��
% satlist{i,9}%��ԪȦ��
% satlist{i,10}%rarrow
% satlist{i,11}%varrow

for i=1:size(satlist,1)%�������ϵʸ��
    n=satlist{i,8}*2*pi/(24*3600);%ƽ�����ٶ�
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
