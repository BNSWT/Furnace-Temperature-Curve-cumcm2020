function [a,ptemp]=ifallowed(t1,t2,t3,t4,v)
[std,ptemp1]=model_function2(t1,t2,t3,t4,v);
a=1;
if(std(1)>3)
    a=-1;
elseif(std(2)<60||std(2)>120)
    a=-1;
elseif(std(3)<40||std(3)>90)
    a=-1;
elseif(std(4)<240||std(4)>250)
    a=-1;
end
ptemp=ptemp1;
end