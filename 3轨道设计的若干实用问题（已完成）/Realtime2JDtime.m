function [JD]=Realtime2JDtime(Y,M,D,hour,min,sec)
%�˹�ʽֻ�����ڹ�Ԫ1900��2099��
% dayf=dy+(hour+min/60+se/3600)/24;
% JD=367*year-(7*(year+((month+9)/12))/4)+(275*month/9)+dayf+1721013.5;

%�ٶ���������Ϊ��: Y; ��: M; ��: D
%���M>2, ��y = Y, m=M-3, ���� y = Y-1, m=M+9
if(M>2)
    M=M-3;
else
    Y=Y-1;
    M=M+9;
end
JD=1721103.5 + fix((365.25*Y)) + fix(30.6*M+0.5) + D;%fixΪȡ������
JD=JD+(hour+min/60+sec/3600)/24;

end