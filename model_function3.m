function [ptemp]=model_function3(t1,t2,t3,t4,v)
%ģ��������
%�������
hcrou1=1.15e-6;%��̬����
hcrou2=1.85e-6;%Һ̬����
hcrou3=4.851e-7;%����
%�趨����1
l=4.355;
global tstp;tstp=0.5;
dp=0.15e-3;%������

%����
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