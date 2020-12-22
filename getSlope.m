function [res]=getSlope(dy,tstp)
res=dy/tstp;
res=abs(res);
end