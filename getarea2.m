function [s]=getarea2(t1,t2,t3,t4,v)
ptemp=model_function3(t1,t2,t3,t4,v);
s=getarea(ptemp,0.5);
end