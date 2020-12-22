function [v]=getNewVec(v0,step,step2)
v(1,5)=0;
for i=1:4
    v(1,i)=randsrc()*step;
end
v(5)=randsrc()*step2;
if(v0(1)+v(1)>185||v0(1)+v(1)<165)
    v(1)=0;
end
if(v0(2)+v(2)>205||v0(2)+v(2)<185)
    v(2)=0;
end
if(v0(3)+v(3)>245||v0(3)+v(3)<225)
    v(3)=0;
end
if(v0(4)+v(4)>265||v0(4)+v(4)<245)
    v(4)=0;
end
if(v0(5)+v(5)>0.01667||v0(5)+v(5)<0.01083)
    v(5)=0;
end
v=v0+v;
end