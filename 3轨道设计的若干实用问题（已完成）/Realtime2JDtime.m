function [JD]=Realtime2JDtime(Y,M,D,hour,min,sec)
%此公式只适用于公元1900至2099年
% dayf=dy+(hour+min/60+se/3600)/24;
% JD=367*year-(7*(year+((month+9)/12))/4)+(275*month/9)+dayf+1721013.5;

%假定所求日期为年: Y; 月: M; 日: D
%如果M>2, 则y = Y, m=M-3, 否则 y = Y-1, m=M+9
if(M>2)
    M=M-3;
else
    Y=Y-1;
    M=M+9;
end
JD=1721103.5 + fix((365.25*Y)) + fix(30.6*M+0.5) + D;%fix为取整函数
JD=JD+(hour+min/60+sec/3600)/24;

end