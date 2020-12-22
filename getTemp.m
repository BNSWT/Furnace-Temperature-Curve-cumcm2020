function [t]=getTemp(t1,t2,t3,t4,x)
    stovepos=0.4025:0.355:3.9525;
    temp=[25,t1,t1,t2,t2,t3,t3,t4,t4,25,25,25];
    temp=temp';
    pos=[0;
        stovepos(1)-0.1525;
        stovepos(5)+0.1525;
        stovepos(6)-0.1525;
        stovepos(6)+0.1525;
        stovepos(7)-0.1525;
        stovepos(7)+0.1525;
        stovepos(8)-0.1525;
        stovepos(9)+0.1525;
        stovepos(10)-0.1525;
        stovepos(11)+0.1525;
        4.355];
    t=interp1(pos,temp,x,'linear');
end