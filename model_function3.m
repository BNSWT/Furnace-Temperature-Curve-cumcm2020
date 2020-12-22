function [ptemp]=model_function3(t1,t2,t3,t4,v)
%模型主函数
%定义变量
hcrou1=1.15e-6;%固态升温
hcrou2=1.85e-6;%液态升温
hcrou3=4.851e-7;%降温
%设定变量1
l=4.355;
global tstp;tstp=0.5;
dp=0.15e-3;%零件厚度

%计算
atime=l/v;
n=uint16((atime-rem(atime,tstp))/tstp);
ptemp=zeros(1,n);
ptemp(1,:)=25;
for t=0:tstp:(atime-rem(atime,tstp))-1
    x=v*t;
    if(x>2.025&&x<3.4)
        hcrou=hcrou2;
    elseif(x>=3.4)
        hcrou=hcrou3;
    else
        hcrou=hcrou1;
    end
    te=getTemp(t1,t2,t3,t4,x);
    dt=model_newton(te,ptemp(1,uint16(t/tstp+1)),dp,hcrou,tstp);
    ptemp(1,t/tstp+2)=ptemp(1,uint16(t/tstp+1))+dt;
end
tt=0:tstp:(atime-rem(atime,tstp)-tstp);
ptemp=[ptemp;tt];
end