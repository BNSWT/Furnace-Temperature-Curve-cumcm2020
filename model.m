%模型主函数
%定义变量
%待定变量
tic;
hcrou1=1.319e-6;%固态升温
hcrou2=1.319e-6;%液态升温
hcrou3=1.319e-6;%降温
crou=5e6;
%设定变量1
l=4.355;
global tstp;tstp=0.5;
v=0.01167;%传送带速度
dp=0.15e-3;%零件厚度

%计算
atime=l/v;
n=uint16(atime/tstp)+2;
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
ptemp=ptemp(1:length(ptemp)-1);
tt=0:tstp:atime;
toc;t=toc;
res=[ptemp;tt];
plot(tt,ptemp);hold on;
xx=importdata('data.txt');
% plot(xx(:,1),xx(:,2));