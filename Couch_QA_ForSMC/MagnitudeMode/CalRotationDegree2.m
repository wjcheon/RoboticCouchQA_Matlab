function degree = CalRotationDegree2(Coordi1,Coordi2)


Coordi1 =  Coordi1/sumsqr(Coordi1);
Coordi2 =  Coordi2/sumsqr(Coordi2);
degree1 = atan(Coordi1)-atan(Coorid2);
degree2 = pi-degree1;

degree_min= min(degree1,degree2);
degree = degree_min*180/pi;
