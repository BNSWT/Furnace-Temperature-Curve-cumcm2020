function [symm]=ifsymm(data)
ind=find(data(1,:)>=217);
maxind=find((data(1,:)==max(data(1,:))));
%竖直方向分割数目
n=50;
dy=(max(data(1,:))-217)/n;
y=217+dy:dy:(max(data(1,:)));
%插值得到横坐标
l=data(:,ind(1):maxind);
r=data(:,maxind:ind(length(ind)));
xl=data(2,maxind)-interp1(l(1,:),l(2,:),y,'linear');xl([1,length(xl)])=[];
xr=interp1(r(1,:),r(2,:),y,'linear')-data(2,maxind);xr([1,length(xr)])=[];
x=xr+xl;
dlen=abs(xl-xr);
dlen=dlen./x;
symm=sum(dlen)/length(dlen)+1;
end