function eartharrow=orbit2earth(orbitarrow,omega,w,i)%将轨道坐标系转换为地心惯性坐标系
% 参数表
% earth为地心惯性坐标
% orbit为轨道平面坐标

trans=...%坐标转换矩阵
[...
cos(omega)*cos(w)-sin(omega)*sin(w)*cos(i), -cos(omega)*sin(w)-sin(omega)*cos(w)*cos(i), sin(omega)*sin(i);...
sin(omega)*cos(w)+cos(omega)*sin(w)*cos(i), -sin(omega)*sin(w)+cos(omega)*cos(w)*cos(i), -cos(omega)*sin(i);...
sin(w)*sin(i), cos(w)*sin(i), cos(i);...
];
eartharrow=trans*orbitarrow;

end