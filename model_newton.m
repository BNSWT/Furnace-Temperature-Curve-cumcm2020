%dp为零件的厚度
function [dt]=model_newton(te,t,dp,hcrou,tstp)
dt=2*hcrou*(te-t)*tstp/dp;
end