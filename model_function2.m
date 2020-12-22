function [result,ptemp]=model_function2(t1,t2,t3,t4,v)
%Éè¶¨±äÁ¿
    l=4.355;
    tstp=0.5;
    xstp=tstp*v;
    hcrou1=1.15e-6;%¹ÌÌ¬ÉýÎÂ
    hcrou2=1.85e-6;%ÒºÌ¬ÉýÎÂ
    hcrou3=4.851e-7;%½µÎÂ
    dp=0.15e-3;%Áã¼þºñ¶È
    %¼ÆËã
    maxSlope=0;
    climb=0;
    high=0;
    peak=0;
    atime=l/v;
    n=uint16((atime-rem(atime,tstp))/tstp);
    ptemp=zeros(1,n);
    ptemp(1,:)=25;
    for x=0:xstp:4.355-xstp
        if(x>2.025&&x<3.4)
            hcrou=hcrou2;
        elseif(x>=3.4)
            hcrou=hcrou3;
        else
            hcrou=hcrou1;
        end
        te=getTemp(t1,t2,t3,t4,x);
        dt=model_newton(te,ptemp(1,uint16(x/xstp+1)),dp,hcrou,tstp);
        ptemp(1,uint16(x/xstp+2))=ptemp(1,uint16(x/xstp+1))+dt;
        if ptemp(1,uint16(x/xstp+2))>150 && ptemp(1,uint16(x/xstp+2))<190
            if(dt>0)
              climb=climb+tstp;
            end
        end
        if ptemp(1,uint16(x/xstp+2))>217
            high=high+tstp;
        end
        slope=getSlope(dt,tstp);
        maxSlope=max(maxSlope,slope);
        peak=max(peak,ptemp(1,uint16(x/xstp+2)));
    end
    tt=0:tstp:(atime-rem(atime,tstp));
    ptemp=[ptemp;tt];
    result=[maxSlope,climb,high,peak];
end