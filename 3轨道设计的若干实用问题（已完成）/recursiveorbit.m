function a=recursiveorbit(NR,MR,e,i,miu)%�ع�������ģ��
%���룺�ع����Ļع�Ȧ��NR���ع�����MR��ƫ���ʣ�������
%���������볤�ᡣ

%������
Re=6378.140;%km
J2=0.001082626173852;%EGM2008ģ��ʹ�õ�J2��ֵ
we=7.292e-5;%rad/s
C=2*pi*MR/NR;
%����
a=fsolve(@(a)funDelta(a,e,i,J2,Re,we,miu,C),10*Re,optimset('Display','off'));%�����a

end