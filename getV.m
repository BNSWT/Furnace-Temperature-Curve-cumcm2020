function [maxv]=getV(left,right)
tic;
step=(right-left)/50;
vb=right;
while(step>1e-5)
    for v=left:step:right
        [a,b]=ifallowed(182,203,237,254,v);
        if a==-1
            vb=v;
            break;
        end
    end
    right=vb;
    left=vb-step;
    step=(right-left)/50;
end
maxv=left;
toc;
end