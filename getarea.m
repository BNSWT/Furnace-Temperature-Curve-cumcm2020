%ÎÊÌâÈı
function [S]=getarea(data,tstep)
if(max(data(1,:))<217)
    S=-1;
else
    val=data(1,(data(1,:)>=217));
    maxind=find(data(1,:)==max(data(1,:)));
    startind=find(data(1,:)==val(1));
    val=data(1,startind:maxind);
    S=(sum(val)-length(val)*217)*tstep;
end
end