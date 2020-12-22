clear;
x=importdata('data.txt');
minerr=inf;hc1=0;hc2=0;
tic;ahcrou1=0;ahcrou2=0;ahcrou3=0;
for hcrou1=linspace(1.14e-6,1.18e-6,4)
    for hcrou2=linspace(1.85e-6,1.88e-6,4)
        for hcrou3=linspace(4.85e-7,4.95e-7,4)
            y=model_function(hcrou1,hcrou2,hcrou3);
            st=find(y(:,1)==19);
            ed=find(y(:,1)==373);
            err=geterr(x,y(st:ed,:));
            if(err<minerr)
                minerr=err;
                ahcrou1=hcrou1;
                ahcrou2=hcrou2;
                ahcrou3=hcrou3;
            end
        end
    end
end
result=[ahcrou1,ahcrou2,ahcrou3];
toc;t=toc;