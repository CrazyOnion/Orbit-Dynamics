function F=funDelta(a,e,i,J2,Re,we,miu,C)
X=0.75*J2*((Re/(a*(1-e^2)))^2)*((3*(cos(i)^2)-1)*sqrt(1-e^2)+5*(cos(i)^2)-1);
Delta=-2*pi*we*sqrt((a^3)/miu)*(1-X)-3*pi*J2*(Re^2)*(cos(i)/((a^2)*((1-e^2)^2)));
F=Delta+C;
end