function [result]=model_function(hcrou1,hcrou2,hcrou3)
%设定变量
    l=4.355;
    global tstp;tstp=0.5;
    v=0.01167;%传送带速度
    dp=0.15e-3;%零件厚度
    %计算
    atime=l/v;
    n=uint16(atime-tstp)+1;
    ptemp=zeros(1,n);
    ptemp(1,:)=25;
    for t=0:tstp:atime
        x=v*t;
        if(x>2.025&&x<3.4)
            hcrou=hcrou2;
        elseif(x>=3.4)
            hcrou=hcrou3;
        else
            hcrou=hcrou1;
        end
        te=getTemp(175,195,235,255,x);
        dt=model_newton(te,ptemp(1,uint16(t/tstp+1)),dp,hcrou,tstp);
        ptemp(1,uint16(t/tstp+2))=ptemp(1,uint16(t/tstp+1))+dt;
    end
    tt=0:tstp:atime;
    ptemp=ptemp(1:length(ptemp)-1);
    result=[tt;ptemp];result=result';
end